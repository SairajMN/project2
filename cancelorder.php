<?php
session_start();
error_reporting(E_ALL);
ini_set('display_errors', 0); // Set to 1 for debugging, 0 for production

// Include database configuration
require_once('includes/config.php');

// Check if user is logged in
if (!isset($_SESSION['login']) || empty($_SESSION['login'])) {
    header('location:login.php');
    exit();
}

// Validate order ID
if (!isset($_GET['oid']) || !is_numeric($_GET['oid'])) {
    die('<script>alert("Invalid order ID."); window.close();</script>');
}

$orderid = intval($_GET['oid']);
$userid = $_SESSION['id'];

// Process cancellation form
if (isset($_POST['submit'])) {
    // Validate and sanitize input
    $remark = trim($_POST['restremark']);
    if (empty($remark)) {
        $error = "Please provide a cancellation reason.";
    } else {
        $remark = mysqli_real_escape_string($con, $remark);
        $ressta = "Cancelled";
        
        // Begin transaction
        mysqli_begin_transaction($con);
        
        try {
            // Check if order belongs to the user
            $checkOrder = mysqli_query($con, "SELECT id, orderStatus FROM orders WHERE id='$orderid' AND userId='$userid'");
            if (mysqli_num_rows($checkOrder) == 0) {
                throw new Exception("Order not found or you don't have permission to cancel this order.");
            }
            
            $orderData = mysqli_fetch_assoc($checkOrder);
            
            // Check if order is already cancelled
            if ($orderData['orderStatus'] == 'Cancelled') {
                throw new Exception("This order is already cancelled.");
            }
            
            // Check if order can be cancelled (only certain statuses)
            $allowedStatuses = ['', 'Pending', 'Packed', 'Dispatched', 'In Transit'];
            if (!in_array($orderData['orderStatus'], $allowedStatuses)) {
                throw new Exception("You can't cancel this order as it's already ".$orderData['orderStatus']);
            }
            
            // Insert tracking history
            $query1 = mysqli_query($con, "INSERT INTO ordertrackhistory(orderId, remark, status, postingDate) 
                                        VALUES('$orderid', '$remark', '$ressta', NOW())"); 
            
            if (!$query1) {
                throw new Exception("Failed to update order history: ".mysqli_error($con));
            }
            
            // Update order status
            $query2 = mysqli_query($con, "UPDATE orders SET orderStatus='$ressta' WHERE id='$orderid'");
            
            if (!$query2) {
                throw new Exception("Failed to update order status: ".mysqli_error($con));
            }
            
            // Commit transaction if all queries succeeded
            mysqli_commit($con);
            
            echo '<script>
                alert("Order cancelled successfully!");
                if (window.opener && !window.opener.closed) {
                    window.opener.location.reload();
                }
                setTimeout(function() { window.close(); }, 500);
            </script>';
            exit();
            
        } catch (Exception $e) {
            mysqli_rollback($con);
            $error = $e->getMessage();
            error_log("Order cancellation error: ".$error);
        }
    }
}

// Get order details
$query = mysqli_query($con, "SELECT o.id, o.orderStatus, p.productName 
                           FROM orders o 
                           JOIN products p ON o.productId = p.id 
                           WHERE o.id='$orderid' AND o.userId='$userid'");
$order = mysqli_fetch_assoc($query);

if (!$order) {
    die('<script>alert("Order not found or you don\'t have permission to cancel this order."); window.close();</script>');
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Order #<?php echo htmlspecialchars($order['orderNumber']); ?></title>
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 20px;
            background-color: #f8f9fa;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .order-details {
            margin-bottom: 20px;
        }
        .alert {
            margin-bottom: 20px;
        }
        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #ddd;
            min-height: 100px;
        }
        .btn-cancel {
            background-color: #dc3545;
            color: white;
        }
        .btn-cancel:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Cancel Order #<?php echo htmlspecialchars($order['orderNumber']); ?></h2>
        
        <?php if (isset($error)): ?>
            <div class="alert alert-danger"><?php echo htmlspecialchars($error); ?></div>
        <?php endif; ?>
        
        <div class="order-details">
            <h4>Order Details</h4>
            <table class="table table-bordered">
                <tr>
                    <th>Product Name</th>
                    <td><?php echo htmlspecialchars($order['productName']); ?></td>
                </tr>
                <tr>
                    <th>Current Status</th>
                    <td><?php echo !empty($order['orderStatus']) ? htmlspecialchars($order['orderStatus']) : 'Pending'; ?></td>
                </tr>
            </table>
        </div>
        
        <?php 
        // Check if order can be cancelled
        $allowedStatuses = ['', 'Pending', 'Packed', 'Dispatched', 'In Transit'];
        if (in_array($order['orderStatus'], $allowedStatuses)):
        ?>
            <form method="post">
                <div class="form-group">
                    <label for="restremark"><strong>Reason for Cancellation</strong></label>
                    <textarea name="restremark" id="restremark" class="form-control" required 
                              placeholder="Please explain why you want to cancel this order..."></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" name="submit" class="btn btn-cancel btn-lg">Confirm Cancellation</button>
                    <button type="button" class="btn btn-secondary btn-lg ml-2" onclick="window.close()">Close</button>
                </div>
            </form>
        <?php else: ?>
            <div class="alert alert-info">
                <?php if ($order['orderStatus'] == 'Cancelled'): ?>
                    This order is already cancelled and cannot be cancelled again.
                <?php else: ?>
                    This order cannot be cancelled as it's already <?php echo htmlspecialchars($order['orderStatus']); ?>.
                <?php endif; ?>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-secondary" onclick="window.close()">Close</button>
            </div>
        <?php endif; ?>
    </div>

    <script src="assets/js/jquery-1.11.1.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
</body>
</html>
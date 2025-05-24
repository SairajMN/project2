<?php
session_start();
error_reporting(0);
include_once('includes/config.php');
if(isset($_POST['submit']))
  {
    
   $orderid=$_GET['oid'];
    $ressta="Cancelled";
    $remark=$_POST['restremark'];
    $canclbyuser='User';
 
  
    $query=mysqli_query($con,"insert into ordertrackhistory(orderId,remark,status,canceledBy) value('$orderid','$remark','$ressta','$canclbyuser')"); 
   $query=mysqli_query($con, "update   orders set orderStatus='$ressta' where id='$orderid'");
    if ($query) {
echo '<script>alert("Your order cancelled now.")</script>';
  }else{
echo '<script>alert("Something went wrong. Please try again.")</script>';
    }

  
}

 ?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title> Order Cancelation</title>
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

<div>
<?php  
$orderid=$_GET['oid'];
$query=mysqli_query($con,"select orderNumber,orderStatus from orders where id='$orderid'");
$num=mysqli_num_rows($query);
$cnt=1;
?>
<?php  
while ($row=mysqli_fetch_array($query)) {
  ?>
<table border="1"  cellpadding="10">
  <tr align="center">
   <th colspan="4" >Cancel Order #<?php echo  $row['orderNumber'];?></th> 
  </tr>
  <tr>
<th>Order Number </th>
<th>Current Status </th>
</tr>

<tr> 
  <td><?php  echo $row['orderNumber'];?></td> 
   <td><?php  $status=$row['orderStatus'];
if($status==""){
  echo "Waiting for confirmation";
} else { 
echo $status;
}
?></td> 
</tr>
<?php 
} ?>

</table>
     <?php if($status=="" || $status=="Packed" || $status=="Dispatched" || $status=="In Transit") {?>
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
    <?php } else { ?>
<?php if($status=='Cancelled'){?>
<p> Order already Cancelled. No need to cancel again.</p>
<?php } else { ?>
  <p> You can't cancel this. Order is Out For Delivery or delivered</p>

<?php }  } ?>
  
</div>

</body>
</html>
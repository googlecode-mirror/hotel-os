 <?php
            require_once("nganluong.php");
            $nl=new NL_Checkout();            
            $transaction_info=@$_GET["transaction_info"];//lay thong tin giao dich
            $payment_id=@$_GET["payment_id"];//ma giao dich
            $payment_type=@$_GET["payment_type"];//loai giao dich (1. thanh toan ngay 2. thanh toan tam giu)
            $order_code=@$_GET["order_code"];//ma gia dich
            $price=@$_GET["price"];//so tien thanh toan voi ngan luong
            $error_text=@$_GET['error_text'];//lay thong tin chi tiet loi tra ve tu giao dich
            $secure_code=@$_GET["secure_code"];//lay ma kiem tra tinh hop le cua dau vao
            $check=$nl->verifyPaymentUrl($transaction_info, $order_code, $price, $payment_id, $payment_type, $error_text, $secure_code);//kiem tra giao dich
            
            if($check){
                $html.="<div align=\"center\">Cam on quy khach,qua trinh thanh toan da duoc hoan tat!</div>";
                echo $html;
            }
            else{
                echo "Qua trinh thanh toan khong thanh cong vui long thu lai";
            }
 ?> 
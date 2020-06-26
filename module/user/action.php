<?php
    include("../../function/koneksi.php");   
    include("../../function/helper.php"); 
    
    admin_only("user", $level);
     
    $user_id = $_GET['user_id'];
	
    $nama = $_POST['nama'];
	$email = $_POST["email"];
	$phone = $_POST["phone"];
	$alamat = $_POST["alamat"];
	$level = $_POST["level"];
    $status = $_POST["status"];	
	
    $edit_gambar = "";
	
 
    if($_FILES["foto"]["name"] != "")
    {
        $foto = $_FILES["foto"]["name"];
        move_uploaded_file($_FILES["foto"]["tmp_name"], "../../images/fotofile/" . $foto);
         
        $edit_gambar  = ", foto='$foto'";
    }

	mysqli_query($koneksi, "UPDATE user SET nama='$nama',
											   email='$email',
											   phone='$phone',
											   alamat='$alamat',
											   level='$level',
											   status='$status'
											   $edit_gambar WHERE user_id='$user_id'");

    header("location: ".BASE_URL."index.php?page=my_profile&module=user&action=list");
?>
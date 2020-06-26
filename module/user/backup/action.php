<?php
    include("../../function/koneksi.php");   
	include("../../function/helper.php");  
	
	$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : false;
     
    $user_id = $_GET['user_id'];
	
    $nama = $_POST['nama'];
	$email = $_POST["email"];
	$phone = $_POST["phone"];
	$alamat = $_POST["alamat"];
	$status = $_POST["status"];	
	$level = $_POST["level"];	
	$edit_gambar = "";
	
 
    if(!empty($_FILES["file"]["name"]))
    {
        $nama_file = $_FILES["file"]["name"];
        move_uploaded_file($_FILES["file"]["tmp_name"], "../../images/fotofile/" .$nama_file);
         
        $edit_gambar  = ", gambar='$nama_file'";
	}
	
	if($button == "Update"){
		$user_id = $_GET['user_id'];
		mysqli_query($koneksi, "UPDATE user SET level='$level',
											nama='$nama',
											email='$email',
											alamat='$alamat',
											phone='$phone',
											status='$status'
											$edit_gambar WHERE user_id='$user_id'");
	}

    header("location: ".BASE_URL."index.php?page=my_profile&module=user&action=list");
?>
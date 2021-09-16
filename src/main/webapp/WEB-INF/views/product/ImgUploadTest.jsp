<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" session = "false" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
	<form id="imgUploadfrm" method="POST" action="imgUpload" encType="multipart/form-data">
    	<p>파일 업로드</p>
    	<label>썸네일</label>
    	<input type="file" name="product_thumb">
    	<label>썸네일</label>
    	<input type="file" name="product_images" multiple>
    	<input type="submit" value="전송">
    </form>
</body>
</html>

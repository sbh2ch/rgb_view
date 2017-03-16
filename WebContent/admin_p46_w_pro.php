<?
header("Content-Type: text/html; charset=UTF-8");

include $_SERVER[DOCUMENT_ROOT]."/include/admin_header.html";
include $_SERVER[DOCUMENT_ROOT]."/include/functions.php";

$bbs_line = quote_smart($_REQUEST[bbs_line]);
$title = quote_smart($_REQUEST[title]);
$writer = quote_smart($_REQUEST[writer]);
$pwd = quote_smart($_REQUEST[pwd]);
$contents = $_REQUEST[contents];

echo $title;

//입력될 ID 값 설정
$qry = "select MAX(ID_NUMBER) from TB_QNA";
$parent = dbQueryOne($qry,$gameDbc)+1;

// uploads디렉토리에 파일을 업로드합니다. 
$uploaddir = $upload_path_con."qna/";
$uploaddir_db = $upload_path_db_con."qna/";
// 서버에 저장될 파일이름 
//setlocale(LC_ALL, ‘ko_KR.utf8′); 
//$filename = basename($_FILES['upload_file']['name']);
$filename = iconv('utf-8', 'euc-kr', $_FILES['upload_file']['name']);

//파일명이 있으면 처리
if($filename) {
	//$filename = $_FILES['upload_file']['name'];

	//중복된 파일명이 있으면 _1 * n
	$filename = GetUniqFileName($filename, $uploaddir);
	$uploadfile = $uploaddir . $filename;

	$filename_db = iconv('euc-kr', 'utf-8', $filename);
	echo $filename."//".$filename_db;
	//exit;
	$ext = array_pop(explode(".","$filename"));

	echo $uploadfile;

	if($_FILES['upload_file']['size'] > 0) {
		echo '<pre>';
		//확장자 검사
		if( strtolower($ext) == "php" || strtolower($ext) == "html") { 
		   echo "확장자 php파일은 업로드 하실수 없습니다."; 
		} else {
			if($_POST['MAX_FILE_SIZE'] < $_FILES['upload_file']['size']){ 
				echo "업로드 파일이 지정된 파일크기보다 큽니다.\n"; 
			} else {
				if(($_FILES['upload_file']['error'] > 0) || ($_FILES['upload_file']['size'] <= 0)){ 
					echo "파일 업로드에 실패하였습니다."; 
				} else { 
					// HTTP post로 전송된 것인지 체크합니다. 
					if(!is_uploaded_file($_FILES['upload_file']['tmp_name'])) { 
						echo "HTTP로 전송된 파일이 아닙니다.";
					} else {
						// move_uploaded_file은 임시 저장되어 있는 파일을 ./uploads 디렉토리로 이동합니다. 
						if (move_uploaded_file($_FILES['upload_file']['tmp_name'], $uploadfile)) {
							echo "성공적으로 업로드 되었습니다.\n";
						} else {
							echo "파일 업로드 실패입니다.\n";
						}
					}
				}
			}
		}

		print_r($_FILES);
	}

	$filename = iconv('euc-kr', 'utf-8', $filename);
}

$inQry = "insert into tb_qna (TITLE, CONTENT, PWD, DEPTH, PARENT, ADD_DATE, YN_USE, WRITER, FILE_NAME, FILE_PATH, kor_eng, bbs_line) values ('{$title}', '{$contents}', '{$pwd}', 1, {$parent}, now(), 1, '{$writer}', '{$filename_db}', '{$uploaddir_db}', 'kor', '{$bbs_line}')";


echo $inQry;

if ( !$inRes = dbQuery($inQry, $gameDbc) )	{
	alertMsg('처리중 오류가 발생되었습니다.');
} else {
	echo "<script>alert('게시판 작성이 완료되었습니다.'); parent.location.href='admin_p46.html';</script>";
}

@dbClose($gameDbc);
?>
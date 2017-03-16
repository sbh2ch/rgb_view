<?
header("Content-Type: text/html; charset=utf-8");

include $_SERVER[DOCUMENT_ROOT]."/include/admin_header.html";
include $_SERVER[DOCUMENT_ROOT]."/include/functions.php";

$title = quote_smart($_REQUEST[title]);
$issue_seq = quote_smart($_REQUEST[is_seq]);
$writer = quote_smart($_REQUEST[writer]);
$issue_date = $_REQUEST[issue_date];
$selectArea = $_REQUEST[selectArea];

$selectAreaArr = explode(",",$selectArea);

$areaSql = "";

$checkCount = 1;

$selectCheckArr = array('0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');

if(count($selectAreaArr) > 1) {
	for($i=0; $i<count($selectAreaArr)-1; $i++) {
		echo $selectAreaArr[$i]."<br>";

		$selectCheckArr[$selectAreaArr[$i]-1] = "1";
	}

	for($i=0; $i<count($selectCheckArr); $i++) {

		if($i+1 < 10) {
			$areaSql .= " issue_area0".($i+1)." = '{$selectCheckArr[$i]}', ";
		} else {
			if($i == count($selectCheckArr)-1) {
				$areaSql .= " issue_area".($i+1)." = '{$selectCheckArr[$i]}' ";
			} else {
				$areaSql .= " issue_area".($i+1)." = '{$selectCheckArr[$i]}', ";
			}
		}
	}
}

$upSql = "update tb_distribution set issue_seq = {$issue_seq}, {$areaSql} WHERE SENSOR_NAME = 'GOCI'  AND DOC_TYPE = 'GOCI0120' AND DATE(TRANSFER_DATE) = '{$issue_date}'  ";

echo $upSql."<br>";

//이슈명 가져오기
$isQry = "select issue_name from issue_list where seq = {$issue_seq}";

$issue_name = dbQueryOne($isQry, $gameDbc);

// uploads디렉토리에 파일을 업로드합니다. 
$uploaddir = $upload_path_con."goci_app_bbs/";
$uploaddir_db = $upload_path_db_con."goci_app_bbs/";
// 서버에 저장될 파일이름 
//setlocale(LC_ALL, ‘ko_KR.utf8′); 
//$filename = basename($_FILES['upload_file']['name']);
$filename = iconv('utf-8', 'euc-kr', $_FILES['upload_file']['name']);

//파일명이 있으면 처리
if($filename) {
	//$filename = $_FILES['upload_file']['name'];

	//중복된 파일명이 있으면 _1 * n
	$filename = GetUniqFileName($filename, $uploaddir);
	$uploadfile = $uploaddir.$filename;

	$filename_db = iconv('euc-kr', 'utf-8', $filename);
	echo $filename."||".$filename_db."<br>";
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

$preQry = "insert into issue_preprocess (issue_date, issue_seq, regdate ) values ( '{$issue_date}', {$issue_seq}, now());";
$inQry = "insert into goci_app_bbs (title, filename, filepath, writer, regdate, issue_date, issue_seq, issue_name, kor_eng) values ('{$title}', '{$filename_db}', '{$uploaddir_db}', '{$writer}', now(), '{$issue_date}', {$issue_seq}, '{$issue_name}', 'kor')";

dbQuery($preQry, $gameDbc);
echo "<script>console.log('$preQry')</script>";
echo $inQry;

//exit;

if ( !$inRes = dbQuery($inQry, $gameDbc) )	{
	alertMsg('처리중 오류가 발생되었습니다.');
} else {
	//이슈관련 정보 영상파일 테이블에 업로드

	$upRes = dbQuery($upSql, $gameDbc);

	echo "<script>alert('작성이 완료되었습니다.'); parent.location.href='admin_p47.html';</script>";
}

@dbClose($gameDbc);
?>
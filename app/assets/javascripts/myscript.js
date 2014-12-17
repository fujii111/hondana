function msg_dialog(url){
// 「OK」時の処理開始 ＋ 確認ダイアログの表示
	if(window.confirm('本当によろしいですか？')){
		location.href = url; // 指示されたURLへジャンプ
	}
	// 「キャンセル」時の処理開始
	else{
		window.alert('キャンセルしました'); // 警告ダイアログを表示
	}
}

function toggle (targetId){
	if(document.getElementById){
		target = document.getElementById(targetId);
		if(target.style.display == "block"){
			target.style.display = "none";
		}else{
			target.style.display = "block";
		}
	}
}

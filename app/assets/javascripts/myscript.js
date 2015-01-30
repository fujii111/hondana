function msg_dialog(url){
// 「OK」時の処理開始 ＋ 確認ダイアログの表示
	if(window.confirm('本当によろしいですか？')){
		location.href = url; // 指示されたURLへジャンプ
	}
}

function fav_dialog(value){
//	ダイアログを表示
	window.alert('お気に入りに登録しました');
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

function msg_dialog(url){
// 「OK」時の処理開始 ＋ 確認ダイアログの表示
	if(window.confirm('本当によろしいですか？')){
		location.href = url; // 指示されたURLへジャンプ
	}
}

function fav_dialog(value){
//	ダイアログを表示
	window.alert('お気に入りに登録しました');
	var form = document.createElement('form');
	var csrf_token = document.getElementsByName ('csrf-token').item(0).content;
	document.body.appendChild( form );
	var input = document.createElement('input');
	input.setAttribute('type', 'hidden');
	input.setAttribute('name', 'authenticity_token');
	input.setAttribute('value', csrf_token);
	form.appendChild( input );
	form.setAttribute('action', '/account/create/' + value);
	form.setAttribute('method', 'post');
	form.submit();
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

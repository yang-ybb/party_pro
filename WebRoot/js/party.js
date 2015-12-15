$(document).ready(function() {
	//档案信息：初始化校验
	$(".commit").each(function() {
		validate_commit_input($(this).attr("id"));
	});

	//档案信息：输入框失去焦点校验
	$(".commit").blur(function() {
		validate_commit_input($(this).attr("id"));
	})

	//档案信息：点击增加按钮的操作
	$(".add-button").click(function() {
		add_one_to_input($(this).attr("id"));
	});

	//检查输入框不为空
	$(".input").blur(function() {
		text_not_null($(this).attr("id"));
	});

	//检查手机号码输入框
	$(".phone").blur(function() {
		check_phone_number($(this).attr("id"));
	});

	$(".date-in").change(function() {
		check_date($(this).attr("id"));
	});
});

//检查日期格式（不检查空）
function check_date(id) {
	$input = $("#"+id);
	v = $input.val().match( /\d{4}-\d{2}-\d{2}/ );
	if(v) {
		$input.val(v[0]);
	}
	else {
		$input.val("");
	}
}

//检查电话号码
function check_phone_number(id) {
	$input = $("#"+id);
	v = $input.val().match( /\d{11}/ );
	if (v) {
		$input.val(v[0]);
		$input.css({"border":""});
	}
	else {
		$input.val("");
		$input.css({"border":"1px solid red"});
	}
}

//文本输入，不为空校验
function text_not_null(id) {
	$input = $("#"+id);
	v = $input.val();
	if(v == "") {
		$input.css({"border":"1px solid red"});
	}
	else {
		$input.css({"border":""});
	}
}

//档案信息：点击plus按钮时增加对应输入框数字
function add_one_to_input(id) {
	$button = $("#"+id);
	$input = $button.parent().prev().children();

	num = parseInt($input.val());
	$input.val(num+1);
}

//档案信息：校验输入框，为空时自动变为0
function validate_commit_input(id) {
	$input = $("#"+id);
	if ($input.val() == "") {
		$input.val("0");
	}
}
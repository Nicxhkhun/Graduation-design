var Base = {};
Base.isInt = function(value) {

	if (/(^[0-9]\d*$)/.test(value)) {

		return true;

	} else {

		return false;

	}

}
Base.isFloat = function(value) {
	if ((/(^[0-9]\d*$)/.test(value)) || /^(-?\d+)(\.\d+)?$/.test(value)) {

		return true;

	} else {

		return false;

	}
}
Base.isLoginName = function(value) {
	if (/^[0-9a-zA-Z_]+$/.test(value)) {

		return true;

	} else {

		return false;

	}
}

Base.isPhone = function(value) {

	if (/^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0-9]{1}))+\d{8})$/.test(value)) {

		return true;

	} else {

		return false;

	}

}

Base.isIDCardNo = function(value) {

	if (/(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/.test(value)) {

		return true;

	} else {

		return false;

	}

}

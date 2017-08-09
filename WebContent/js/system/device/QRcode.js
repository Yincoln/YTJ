(function() {
	/**
	 * level 
	 * L - 7% damage 
	 * M - 15% damage 
	 * Q - 25% damage 
	 * H - 30% damage
	 */
	var str = '{"password":"'+$('#psw').text()+'","uuid":"'+$('#uuid').text()+'"}';
	var qr = new QRious({
		element : document.getElementById('qrious'),
		size : 200, // 100-1000
		value : str,
		background : "#ffffff",
		foreground : "#000000",
		level : "H",
	});
})();
function dadoDeVeinte(){
	var num = Math.floor((Math.random() * (20 - 1 + 1)) + 1);	
	var a = document.getElementById('testearFicha');	
	a.value = num;
}
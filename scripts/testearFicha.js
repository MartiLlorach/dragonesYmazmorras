$( () => {
	$("#btnfuerza").click( () => {
		let res = dadoDeVeinte();
		let fuerza = $("personaje").attr("fuerza");
		let bonus = Math.trunc((fuerza-10)/2);
		res += bonus;
		resultado(res);
	})
	$("#btndestreza").click( () => {
		let res = dadoDeVeinte();
		let destreza = $("personaje").attr("destreza");
		let bonus = Math.trunc((destreza-10)/2);
		res += bonus;
		resultado(res);
	})
	$("#btnconstitucion").click( () => {
		let res = dadoDeVeinte();
		let constitucion = $("personaje").attr("constitucion");
		let bonus = Math.trunc((constitucion-10)/2);
		res += bonus;
		resultado(res);
	})
	$("#btninteligencia").click( () => {
		let res = dadoDeVeinte();
		let inteligencia = $("personaje").attr("inteligencia");
		let bonus = Math.trunc((inteligencia-10)/2);
		res += bonus;
		resultado(res);
	})
	$("#btnsabiduria").click( () => {
		let res = dadoDeVeinte();
		let sabiduria = $("personaje").attr("sabiduria");
		let bonus = Math.trunc((sabiduria-10)/2);
		res += bonus;
		resultado(res);
	})
	$("#btncarisma").click( () => {
		let res = dadoDeVeinte();
		let carisma = $("personaje").attr("carisma");
		let bonus = Math.trunc((carisma-10)/2);
		res += bonus;
		resultado(res);
	})
});



function dadoDeVeinte(){
	var num = Math.floor((Math.random() * (20 - 1 + 1)) + 1);
	return num;
}

function resultado(res){
	if (res<10){
		alerta("has perdido","mal");
	} else if (res==10){
		alerta("empate","aviso");
	} else{
		alerta("has ganado","bien")
	}
}

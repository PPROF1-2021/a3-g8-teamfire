// funcion para calculo de edad
function Edad() {
    let fechaNacimiento = document.getElementById("FechaNacimiento").value;
    let fechaNace = new Date(fechaNacimiento);
    let fechaActual = new Date();

    let mes = fechaActual.getMonth();
    let dia = fechaActual.getDate();
    let año = fechaActual.getFullYear();

    fechaActual.setDate(dia);
    fechaActual.setMonth(mes);
    fechaActual.setFullYear(año);

    edad = Math.floor(((fechaActual - fechaNace) / (1000 * 60 * 60 * 24) / 365));
   
    document.getElementById('Edadcalculada').innerHTML = "tu edad es: " +edad+ " años"; 

}

//validaciones 

function soloLetras(e) {
    let key = e.keyCode || e.which,
      tecla = String.fromCharCode(key).toLowerCase(),
      letras = " áéíóúabcdefghijklmnñopqrstuvwxyz",
      especiales = [8, 37, 39, 46],
      tecla_especial = false;
    

    for (let i in especiales ) {
      if (key == especiales[i]) {
        tecla_especial = true;
        break;
      }
    }

    if (letras.indexOf(tecla) == -1 && !tecla_especial) { alert ("solo letras");
      return false;
    }
  }

function valida(){
 let Usuario = document.getElementById("Usuario").value;
 let Contraseña = document.getElementById("Contraseña").value;
 let Nombre = document.getElementById("Nombre").value;
 let Apellido = document.getElementById("Apellido").value;
 let FechaNac = document.getElementById("FechaNacimiento").value;
 let Prov = document.getElementById("Provincia").value;
 let Pais = document.getElementById("Pais").value;
 let Email = document.getElementById("Email").value;

localStorage.setItem("userUsu", JSON.stringify(Usuario));
localStorage.setItem("userContra", JSON.stringify(Contraseña));
localStorage.setItem("userName", JSON.stringify(Nombre));
localStorage.setItem("userApell", JSON.stringify(Apellido));
localStorage.setItem("userFecha", JSON.stringify(FechaNac));
localStorage.setItem("userProv", JSON.stringify(Prov));
localStorage.setItem("userPais", JSON.stringify(Pais));
localStorage.setItem("userEmail", JSON.stringify(Email));

 if (Usuario ===""|| Nombre===""|| Apellido===""|| Prov ==="" || Pais===""||Email==="" || Contraseña==="") {alert("todos los campos son obligatorios");
return false

}

else if (Usuario.length <4) {alert("Usuario muy Corto");
return false
}

else if (Nombre.length <2) {alert("Nombre muy Corto");
return false
}

else if (Apellido.length <2) {alert("Apellido muy Corto");
return false
}

else if (Contraseña.length <6) {alert("Contraseña muy corta");
return false
}
else alert("Registro Exitoso")

}

//Evento de confirmar terminos
function aceptot(){
	alert("Acepto Terminos de Uso");
}
//Evento de cambio de estilo de boton Registrar

//function color(x) {
//x.style.background-color: "#f44336";

//}

//function color2(x) {
//x.style.background-color: "#008CBA";

//}

//Funcion para llenar un nodo con información para mostrar en pantalla intermedia después de enviar el formulario

function llenarNodo(data, element) {
  let node = document.createElement("p");
  let txt = document.createTextNode(data);
  node.appendChild(txt);
  document.getElementById(element).appendChild(node);
}

//Función que muestra pantalla intermedia y luego redirecciona

function redireccion() {
	
//cronometro para redireccion a Pagina de Incio
	let pagina = "login.html";
	let segundos = 8;
	setTimeout(function () {
    document.location.href = pagina;
	
  }, segundos * 1000);
  
  let UserUsu = JSON.parse(localStorage.getItem("userUsu"));
  let UserContra = JSON.parse(localStorage.getItem("userContra"));
  let UserName = JSON.parse(localStorage.getItem("userName"));
  let UserApell = JSON.parse(localStorage.getItem("userApell"));
  let UserFecha = JSON.parse(localStorage.getItem("userFecha"));
  let UserProv = JSON.parse(localStorage.getItem("userProv"));
  let UserPais = JSON.parse(localStorage.getItem("userPais"));
  let UserEmail = JSON.parse(localStorage.getItem("userEmail"));


 //Array con variables anteriores
  
  let data = [
   "Usuario: " + UserUsu,
   "Contraseña: " + UserContra,
   "Nombre: " + UserName,
   "Apellido: " + UserApell,
   "Fecha de Nacimiento: " + UserFecha,
   "Provincia: " + UserProv,
   "Pais: " + UserPais,
   "E-mail: " + UserEmail,
 
  ];
  
//Método forEach para ejecutar la función y crear todos los nodos
  
  data.forEach((element) => {
    llenarNodo(element, "datosDelUsuario");
  });
}

//Evento de cambio de estilo de boton Registrar

function color(x) {

x.className= "btn btn-primary"



}

function color2(x) {

x.className= "btn btn-success"
}



//Evento de confirmar terminos
//function aceptot(){
//	alert("Acepto Terminos de Uso");
//}


(function() {
  "use strict";

  /**
   * Easy selector helper function
   */
  const select = (el, all = false) => {
    el = el.trim()
    if (all) {
      return [...document.querySelectorAll(el)]
    } else {
      return document.querySelector(el)
    }
  }

  /**
   * Easy event listener function
   */
  const on = (type, el, listener, all = false) => {
    let selectEl = select(el, all)
    if (selectEl) {
      if (all) {
        selectEl.forEach(e => e.addEventListener(type, listener))
      } else {
        selectEl.addEventListener(type, listener)
      }
    }
  }

  /**
   * Easy on scroll event listener 
   */
  const onscroll = (el, listener) => {
    el.addEventListener('scroll', listener)
  }

  /**
   * Navbar links active state on scroll
   */
   let navbarlinks = select('#navbar .scrollto', true)
   const navbarlinksActive = () => {
     let position = window.scrollY + 200
     navbarlinks.forEach(navbarlink => {
       if (!navbarlink.hash) return
       let section = select(navbarlink.hash)
       if (!section) return
       if (position >= section.offsetTop && position <= (section.offsetTop + section.offsetHeight)) {
         navbarlink.classList.add('active')
       } else {
         navbarlink.classList.remove('active')
       }
     })
   }
   window.addEventListener('load', navbarlinksActive)
   onscroll(document, navbarlinksActive)
  /**
   * Scrolls to an element with header offset
   */
  const scrollto = (el) => {
    let header = select('#header')
    let offset = header.offsetHeight

    let elementPos = select(el).offsetTop
    window.scrollTo({
      top: elementPos - offset,
      behavior: 'smooth'
    })
  }

  /**
   * Toggle .header-scrolled class to #header when page is scrolled
   */
  let selectHeader = select('#header')
  if (selectHeader) {
    const headerScrolled = () => {
      if (window.scrollY > 100) {
        selectHeader.classList.add('header-scrolled')
      } else {
        selectHeader.classList.remove('header-scrolled')
      }
    }
    window.addEventListener('load', headerScrolled)
    onscroll(document, headerScrolled)
  }

  /**
   * Back to top button
   */
  let backtotop = select('.back-to-top')
  if (backtotop) {
    const toggleBacktotop = () => {
      if (window.scrollY > 100) {
        backtotop.classList.add('active')
      } else {
        backtotop.classList.remove('active')
      }
    }
    window.addEventListener('load', toggleBacktotop)
    onscroll(document, toggleBacktotop)
  }

  /**
   * Mobile nav toggle
   */
  on('click', '.mobile-nav-toggle', function(e) {
    select('#navbar').classList.toggle('navbar-mobile')
    this.classList.toggle('bi-list')
    this.classList.toggle('bi-x')
  })

  /**
   * Mobile nav dropdowns activate
   */
  on('click', '.navbar .dropdown > a', function(e) {
    if (select('#navbar').classList.contains('navbar-mobile')) {
      e.preventDefault()
      this.nextElementSibling.classList.toggle('dropdown-active')
    }
  }, true)

  /**
   * Scrool with ofset on links with a class name .scrollto
   */
  on('click', '.scrollto', function(e) {
    if (select(this.hash)) {
      e.preventDefault()

      let navbar = select('#navbar')
      if (navbar.classList.contains('navbar-mobile')) {
        navbar.classList.remove('navbar-mobile')
        let navbarToggle = select('.mobile-nav-toggle')
        navbarToggle.classList.toggle('bi-list')
        navbarToggle.classList.toggle('bi-x')
      }
      scrollto(this.hash)
    }
  }, true)

  /**
   * Scroll with ofset on page load with hash links in the url
   */
  window.addEventListener('load', () => {
    if (window.location.hash) {
      if (select(window.location.hash)) {
        scrollto(window.location.hash)
      }
    }
  });

  /**
   * Animacion on scroll
   */
  window.addEventListener('load', () => {
    AOS.init({
      duration: 1000,
      easing: 'ease-in-out',
      once: true,
      mirror: false
    })
  });

})()




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
 
  document.getElementById('Edadcalculada').innerHTML = "tu edad es: " +edad+ "años"; 


 
}




//validaciones y memoria de usuario 

function validacion(){
const Nombre = document.getElementById("Nombre")
const Apellido = document.getElementById("Apellido")
const FechaNac = document.getElementById("FechaNacimiento")
const Prov = document.getElementById("Provincia")
const Pais = document.getElementById("Pais")
const Email = document.getElementById("Email")
const Contraseña = document.getElementById("Contraseña")
const Form = document.getElementById("Formulario")

Form.addEventListener("submit", e=>{

if(Nombre.value.length <2){  e.preventDefault(); alert ("nombre muy corto")}
if (Apellido.value.length <2) {e.preventDefault();alert("apellido muy corto")}
if (edad <18) {e.preventDefault(); alert ("eres menor de edad")}
if (Contraseña.value.length <6){e.preventDefault(); alert ("Contraseña Muy Corta ")}
else {alert("regristro exitoso")}

let nom=Nombre.value;
let apell= Apellido.value;
let fechaN= FechaNac.value;
let prov=Prov.value;
let pais=Pais.value;
let email=Email.value;
let contra=Contraseña.value;




localStorage.setItem("userName", JSON.stringify(nom));
localStorage.setItem("userApell", JSON.stringify(apell));
localStorage.setItem("userFecha", JSON.stringify(fechaN));
localStorage.setItem("userProv", JSON.stringify(prov));
localStorage.setItem("userPais", JSON.stringify(pais));
localStorage.setItem("userEmail", JSON.stringify(email));
localStorage.setItem("userContra", JSON.stringify(contra));

})
}








// funcion para ver datos de formulario en diplay.html y redireccionar a index.html
function redireccion() {
let UserName=JSON.parse(localStorage.getItem("userName"));
let UserApell=JSON.parse(localStorage.getItem("userApell"));
let UserFecha=JSON.parse(localStorage.getItem("userFecha"));
let UserProv=JSON.parse(localStorage.getItem("userProv"));
let UserPais=JSON.parse(localStorage.getItem("userPais"));
let UserEmail=JSON.parse(localStorage.getItem("userEmail"));
let UserContra=JSON.parse(localStorage.getItem("userContra"));



const nameNodo=document.createElement("p");
const newName=document.createTextNode(UserName);
nameNodo.appendChild(newName);
document.getElementById("datosDelUsuario").appendChild(nameNodo);

const apellNodo=document.createElement("p");
const newApell=document.createTextNode(UserApell);
apellNodo.appendChild(newApell);
document.getElementById("datosDelUsuario").appendChild(apellNodo);

const fechaNodo=document.createElement("p");
const newFecha=document.createTextNode(UserFecha);
fechaNodo.appendChild(newFecha);
document.getElementById("datosDelUsuario").appendChild(fechaNodo);

const provNodo=document.createElement("p");
const newProv=document.createTextNode(UserProv);
provNodo.appendChild(newProv);
document.getElementById("datosDelUsuario").appendChild(provNodo);

const paisNodo=document.createElement("p");
const newPais=document.createTextNode(UserPais);
paisNodo.appendChild(newPais);
document.getElementById("datosDelUsuario").appendChild(paisNodo);

const emailNodo=document.createElement("p");
const newEmail=document.createTextNode(UserEmail);
emailNodo.appendChild(newEmail);
document.getElementById("datosDelUsuario").appendChild(emailNodo);

const contraNodo=document.createElement("p");
const newContra=document.createTextNode(UserContra);
contraNodo.appendChild(newContra);
document.getElementById("datosDelUsuario").appendChild(contraNodo);

//cronometro para redireccion a index
let pagina = 'index.html';
let segundos = 50;
setTimeout(function (){
document.location.href=pagina;

},segundos*1000);
}

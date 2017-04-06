var click="";
var ancho = screen.width*0.98;
var alto = (screen.height*0.89)-100;
var temporizador = 0;

$(document).ready(function (){
    $("#cabecera").css('width', ancho+'px');
    $("#cabecera").css('height', '40px');

    $("#menu").css('width', ancho+'px');
    $("#menu").css('height', '90px');

    $("#contenedor").css('width', ancho+'px');
    $("#contenedor").css('height', (alto-130)+'px');

    $("#cuerpo").css('width', (ancho-2)+'px');
    $("#cuerpo").css('height', (alto-150)+'px');
        
    $("#pie").css('width', ancho+'px');
    $("#pie").css('height', '20px');

    $('#cargando').hide();
    
    $(function() {
        $("#actualizacion").draggable({ handle:'div.undraggable' });
        $("#puntual").draggable({ handle:'div.undraggable' });
        $("#configuracion").draggable({ handle: 'div.undraggable' });
        $("#divComentario").draggable({ handle: 'div.undraggable' });
        $("#divEvitCond").draggable({ handle: 'div.undraggable' });
        //rbn ini 01/08/2013
        $("#divAbonadoFiltros").draggable({ handle: 'div.undraggable' });
        //rbn fin 01/08/2013
        //rbn ini 13/09/2013
        $("#divEnviaCorreo").draggable({ handle: 'div.undraggable' });
        //rbn fin 13/09/2013
    });

    $("#tabsConfig").tabs();
    $("#tabs").tabs();
});

/*========================FUNCIONES GENERALES========================*/
document.onkeydown = function(e){var key = (window.event) ? event.keyCode : e.which;
    if (key == 27){$('#cargando').hide();}
}

/*function mantenerConexion(){
    $.ajax({
        type: "POST",
        url: "../General/MantenerConexion.aspx",
        data: "",
        success: function(data) {
            setTimeout("mantenerConexion()", 120000);
        }
    });
}
*/

function SeguridadUsuarios(url) {
    window.location = url;
}

function SeguridadPerfiles(url) {
    window.location = url;
}

function SeguridadModulos(url) {
    window.location = url;
}

function SeguridadUsrPrf(url) {
    window.location = url;
}

function SeguridadModPrf(url) {
    window.location = url;
}

function SeguridadUsrMod(url) {
    window.location = url;
}

function SeguridadAudit(url) {
    window.location = url;
}

function SeguridadDatos(url) {
    window.location = url;
}

function TablasSistema(url) {
    window.location = url;
}

function MonitoreoAlarmas(url) {
    window.location = url;
}

function VerificacionFallas(url) {
    window.location = url;
}

function FalloTest(url) {
    window.location = url;
}

function Programacion(url) {
    window.location = url;
}

function NoRestauradas(url) {
    window.location = url;
}

function SenialesPendientes(url) {
    window.location = url;
}

function ControlArea(url) {
    window.location = url;
}

function ControlSeniales(url) {
    window.location = url;
}

function ControlPruebas(url) {
    window.location = url;
}

function ControlCierres(url) {
    window.location = url;
}

function ControlReingresos(url) {
    window.location = url;
}

function ControlArea1864(url) {
    window.location = url;
}

function SupervisionCaidas(url) {
    window.location = url;
}

function SupervisionPruebasTecnicas(url) {
    window.location = url;
}

function ReporteActividades(url) {
    window.location = url;
}

function EstadisticoAlarmas(url) {
    window.location = url;
}

function FalsasAlarmas(url) {
    window.location = url;
}

function ConsolidadoCierres(url) {
    window.location = url;
}
function inicioGeneral() {    
    window.onload = function () {
        var timer = null;        
        $("#txtDstbCod").blur(function () {
            if (this.value != "") {
                $.ajax({
                    type: "post",
                    url: "/Modulo/GetDstb",
                    contentType: "application/json; charset=utf-8",
                    data: "{dstb: '" + this.value + "'}",
                    dataType: "json",
                    success: exitoDstb,
                    error: error
                });
            }
            else $("#txtDstbDesc").val("");
        });

        $("#txtAbndCod").blur(function () {
            if (this.value!="") {
                $.ajax({
                    type: "post",
                    url: "/Modulo/GetAbnd",
                    contentType: "application/json; charset=utf-8",
                    data: "{abnd: '" + this.value + "'}",
                    dataType: "json",
                    success: exitoAbnd,
                    error: error
                });
            }
            else $("#txtAbndDesc").val("");
        });

        $("#LookForAbnd, #btnSearchAbnd").click(function () {
            var dstbcode = $("#txtDstbCode").val();
            var abndofi = $("#txtAbndOfi").val();
            var address = $("#txtAddress").val();
            $.ajax({
                type: "post",
                url: "/Modulo/BusquedaAbonado",
                contentType: "application/json; charset=utf-8",
                data: "{DstbName: '" + dstbcode + "', AbndOfi: '"+abndofi+"', Address: '"+address+"', Pagina: null}",
                dataType: "json",
                success: exitoBusq,
                error: error
            });
        });

       


        $("#Pagina1, #Pagina2, #Pagina3, #Pagina4").click(function () {
            var dstbcode = $("#txtDstbCode").val();
            var abndofi = $("#txtAbndOfi").val();
            var address = $("#txtAddress").val();
            $.ajax({
                type: "post",
                url: "/Modulo/BusquedaAbonado",
                contentType: "application/json; charset=utf-8",
                data: "{DstbName: '" + dstbcode + "', AbndOfi: '" + abndofi + "', Address: '" + address + "', Pagina: '"+this.value+"'}",
                dataType: "json",
                success: exitoBusq,
                error: error
            });
        });

        $("#btnPlay").click(function () {
            if ($("#imgbtnPlay").attr("src").indexOf("_d.png") == -1) {
                $("#imgbtnPlay").attr("src", $("#imgbtnPlay").attr("src").replace('.png', '_d.png'));
                $("#imgbtnStop").attr("src", $("#imgbtnStop").attr("src").replace('_d', ''));
                $("#btnPlay").attr("disabled", "disabled");
                $("#btnStop").removeAttr("disabled");
            }
            timer=setInterval(function () { $("#btnSearch").click(); }, 10000);
        });

        $("#btnStop").click(function () {
            if ($("#imgbtnStop").attr("src").indexOf("_d.png") == -1) {
                $("#imgbtnStop").attr("src", $("#imgbtnStop").attr("src").replace('.png', '_d.png'));
                $("#imgbtnPlay").attr("src", $("#imgbtnPlay").attr("src").replace('_d', ''));
                $("#btnStop").attr("disabled", "disabled");
                $("#btnPlay").removeAttr("disabled");
            }
            clearInterval(timer);
        });        

        function exitoDstb(rpta) {
            $("#txtDstbDesc").val(rpta);
        }

        function exitoAbnd(rpta) {
            $("#txtAbndDesc").val(rpta);
        }

        function exitoBusq(rpta) {
            var tabla = $("#tbRegistros");
            tabla.empty();
            for (i = 0; i < rpta.Data.length; i++) {
                tabla.append("<tr data-dismiss=\"modal\" onclick=\"$('#txtAbndCod').val('" + rpta.Data[i].AbndCode + "');" +
                            "$('#txtAbndDesc').val('" + rpta.Data[i].Oficina + "');" +
                            "$('#txtDstbCod').val('" + rpta.Data[i].DstbCode + "');" +
                            "$('#txtDstbDesc').val('" + rpta.Data[i].DstbName + "');\" " +
                            "style='border-top: 1px solid #222;border-bottom: 1px solid #222;cursor:pointer'><td style='width:90px;'>" + rpta.Data[i].DstbName + "</td>" +
                    "<td style='width:90px'>" + rpta.Data[i].AbndCode + "</td>" +
                    "<td style='width:230px'>" + rpta.Data[i].Oficina + "</td>" +
                    "<td style='width:230px'>" + rpta.Data[i].AbndDireccion + "</td>" +
                    "<td>" + rpta.Data[i].AbndFuncionarios + "</td>" +
                    "</tr>");
            }
            $("#txtPosicion").val(rpta.current + 1 + " de " + (rpta.last + 1));
        }

       

        function error(rpta) {
            alert(rpta);
        }
    }    
}

function ControlHora() {
    window.addEventListener("load", function () {
        $("#txtFechaIni").datepicker({
            dateFormat: "dd/mm/yy",
            onSelect: function () {
                var dd = parseFloat(this.value.split("/")[0]);
                var mm = parseFloat(this.value.split("/")[1]) - 1;
                var yy = parseFloat(this.value.split("/")[2]);
                $("#txtFechaFin").datepicker("option", "minDate", new Date(yy, mm, dd));
                if (this.value == $("#txtFechaFin").val()) {
                    var Ini = new Date(1970, 1, 1, parseInt($("#txtHoraIni").val().substring(0, 2)), parseInt($("#txtHoraIni").val().substring(3, 5)));
                    var Fin = new Date(1970, 1, 1, parseInt($("#txtHoraFin").val().substring(0, 2)), parseInt($("#txtHoraFin").val().substring(3, 5)));
                    if (Ini > Fin) $("#txtHoraFin").val($("#txtHoraIni").val());
                    else $("#txtHoraIni").val($("#txtHoraFin").val());
                }
            }
        });
        $("#txtFechaFin").datepicker({
            dateFormat: "dd/mm/yy",
            onSelect: function () {
                if ($("#txtFechaIni").val() == this.value) {
                    var Ini = new Date(1970, 1, 1, parseInt($("#txtHoraIni").val().substring(0, 2)), parseInt($("#txtHoraIni").val().substring(3, 5)));
                    var Fin = new Date(1970, 1, 1, parseInt($("#txtHoraFin").val().substring(0, 2)), parseInt($("#txtHoraFin").val().substring(3, 5)));
                    if (Ini > Fin) $("#txtHoraFin").val($("#txtHoraIni").val());
                    else $("#txtHoraIni").val($("#txtHoraFin").val());
                }
            }
        });
        $("#txtFechaIni").datepicker("setDate", new Date());
        $("#txtFechaIni").datepicker("option", "maxDate", new Date());
        $("#txtFechaFin").datepicker({ dateFormat: "dd/mm/yy" });
        $("#txtFechaFin").datepicker("setDate", new Date());
        $("#txtFechaFin").datepicker("option", "minDate", new Date());
        $("#txtFechaFin").datepicker("option", "maxDate", new Date());

        $("#txtHoraIni").timepicker({
            onSelect: function () {
                if ($("#txtFechaIni").val() == $("#txtFechaFin").val()) {
                    var Ini = new Date(1970, 1, 1, parseInt($("#txtHoraIni").val().substring(0, 2)), parseInt($("#txtHoraIni").val().substring(3, 5)));
                    var Fin = new Date(1970, 1, 1, parseInt($("#txtHoraFin").val().substring(0, 2)), parseInt($("#txtHoraFin").val().substring(3, 5)));
                    if (Ini > Fin) $("#txtHoraFin").val($("#txtHoraIni").val());
                }
            }
        });

        $("#txtHoraFin").timepicker({
            onSelect: function () {
                if ($("#txtFechaIni").val() == $("#txtFechaFin").val()) {
                    var Ini = new Date(1970, 1, 1, parseInt($("#txtHoraIni").val().substring(0, 2)), parseInt($("#txtHoraIni").val().substring(3, 5)));
                    var Fin = new Date(1970, 1, 1, parseInt($("#txtHoraFin").val().substring(0, 2)), parseInt($("#txtHoraFin").val().substring(3, 5)));
                    if (Fin < Ini) $("#txtHoraIni").val($("#txtHoraFin").val());
                }
            }
        });
        $("#txtHoraIni").val((new Date).getHours() + ":" + ((new Date).getMinutes() < 10 ? "0" + (new Date).getMinutes().toString() : (new Date).getMinutes().toString()));
        $("#txtHoraFin").val((new Date).getHours() + ":" + ((new Date).getMinutes() < 10 ? "0" + (new Date).getMinutes().toString() : (new Date).getMinutes().toString()));

    });
}

function ControlRadioB() {
    window.addEventListener("load", function () {
        $("#All").click(function () {
            $("#Plus").removeAttr("checked");
            $("#txtTime").attr("disabled", "disabled");
        });

        $("#Plus").click(function () {
            $("#All").removeAttr("checked");
            $("#txtTime").removeAttr("disabled");
        });
    });
}

function ControlAlarma() {
    window.addEventListener("load", function () {
        $("#AlarmCode").change(function () {
            $("#txtCodAlarma").val($("#AlarmCode").val());
        });

        $("#txtCodAlarma").keyup(function () {
            $("#AlarmCode").val($("#AlarmCode option[value='"+$("#txtCodAlarma").val().toUpperCase()+"']").length>0?$("#txtCodAlarma").val().toUpperCase():"");
        });
    });
}

function ControlReporte() {
    window.addEventListener("load", function () {
        $("#btnReport").click(function () {
            location.href = "Exportar";
        });
    });
}


function inicioMonitoreo() {
    $(function () {
        $("#btnCallP").click(function () {
            $("#tdTel").html("Discard: " + $("#hdnTelP").val() + "&nbsp;&nbsp;&nbsp;&nbsp;Ext: " + $("#hdnTelPe").val());
            $("#ddlResolution").removeAttr("disabled");
        });

        $("#btnCallA1").click(function () {
            $("#tdTel").html("Discard: " + $("#hdnTelA1").val() + "&nbsp;&nbsp;&nbsp;&nbsp;Ext: " + $("#hdnTelA1e").val());
            $("#ddlResolution").removeAttr("disabled");
        });

        $("#btnCallA2").click(function () {
            $("#tdTel").html("Discard: " + $("#hdnTelA2").val() + "&nbsp;&nbsp;&nbsp;&nbsp;Ext: " + $("#hdnTelA2e").val());
            $("#ddlResolution").removeAttr("disabled");
        });

        $("#ddlResolution").change(function () {
            if (confirm("Dispatcher?")) {
                $("#btnComplete").removeAttr("disabled");
                $("#btnHold").removeAttr("disabled");
                $("#Ficha").removeAttr("style");
            }
        });

        $("#btnContactoLoc").click(function () {
            var Csid = $("#tdcsid").html().trim();
            $.ajax({
                type: "post",
                url: "/Modulo/ContactoLocacion",
                contentType: "application/json; charset=utf-8",
                data: "{csid: '" + Csid + "', Pagina: null}",
                dataType: "json",
                success: exitoContactoLocacion,
                error: error
            });
        });

        function exitoContactoLocacion(rpta) {
            var tabla = $("#tbRegcontactoloc");
            tabla.empty();
            for (i = 0; i < rpta.Data.length; i++) {
                tabla.append("<tr data-dismiss=\"modal\" style='border-top: 1px solid #222;border-bottom: 1px solid #222;'><td style='width:230px;'>" + rpta.Data[i].Name + "</td>" +                    
                    "<td style='width:350px'>" + rpta.Data[i].Title + "</td>" +
                    "<td style='width:230px'>" + rpta.Data[i].PhoneNumber + "</td>" +
                    "</tr>");
            }
            $("#txtPosicion").val(rpta.current + 1 + " de " + (rpta.last + 1));
        }


        $("#btnResSeg").click(function () {
            //var Csid = $("#tdcsid").html().trim();
            $.ajax({
                type: "post",
                url: "/Modulo/ContactoSeguridad",
                contentType: "application/json; charset=utf-8",
                data: "{Pagina: null}",
                dataType: "json",
                success: exitoContactoSeguridad,
                error: error
            });
        });

        function exitoContactoSeguridad(rpta) {
            var tabla = $("#tbRegcontactoseg");
            tabla.empty();
            for (i = 0; i < rpta.Data.length; i++) {
                tabla.append("<tr data-dismiss=\"modal\" style='border-top: 1px solid #222;border-bottom: 1px solid #222;'><td style='width:230px;'>" + rpta.Data[i].nombres + "</td>" +
                    "<td style='width:350px'>" + rpta.Data[i].cargo + "</td>" +
                    "<td style='width:230px'>" + rpta.Data[i].telefono + "</td>" +
                    "</tr>");
            }
            $("#txtPosicion").val(rpta.current + 1 + " de " + (rpta.last + 1));
        }                    

        $("#btnPolicial").click(function () {
            var palarmhistoryid = $("#tdalarmhistory").html().trim();
            var pidcategoria = '1';
            $.ajax({
                type: "post",
                url: "/Modulo/Consultaremergencia",
                contentType: "application/json; charset=utf-8",                
                data: "{palarmhistoryid: " + palarmhistoryid + ", pidcategoria: " + pidcategoria + ", Pagina: null}",
                dataType: "json",
                success: exitoConsultaremergencia,
                error: error
            });
        });

        $("#btnFuego").click(function () {
            var palarmhistoryid = $("#tdalarmhistory").html().trim();
            var pidcategoria = '2';
            $.ajax({
                type: "post",
                url: "/Modulo/Consultaremergencia",
                contentType: "application/json; charset=utf-8",
                data: "{palarmhistoryid: " + palarmhistoryid + ", pidcategoria: " + pidcategoria + ", Pagina: null}",
                dataType: "json",
                success: exitoConsultaremergencia,
                error: error
            });
        });

        
        $("#btnNuevo").click(function () {
            var palarmhistoryid = $("#tdalarmhistory").html().trim();
            var pidcategoria = '1';
            $.ajax({
                type: "post",
                url: "/Modulo/comboentidad",
                contentType: "application/json; charset=utf-8",
                data: "{palarmhistoryid: " + palarmhistoryid + ", pidcategoria: " + pidcategoria + ", pidentidad: " + -1 + ", Pagina: null}",
                dataType: "json",
                success: exitoCombo,
                error: error
            });
            
        });
        

        function exitoConsultaremergencia(rpta) {            
            var tabla = $("#tbRegConsultaemergencia"); 
            tabla.empty();

            $("#idtituloemer").html(rpta.Data[0].titcategoria);

            for (i = 0; i < rpta.Data.length; i++) {
                tabla.append("<tr id='Tr" + i + "' style='border-top: 1px solid #222;border-bottom: 1px solid #222;'>"+
                    "<td id='Td" + i + "_1' style='width:230px;'>" + rpta.Data[i].nomentidad + "</td>" +
                    "<td id='Td" + i + "_2' style='width:230px'>" + rpta.Data[i].telefono01 + "</td>" +
                    "<td id='Td" + i + "_3' style='width:230px'>" + rpta.Data[i].telefono02 + "</td>" +
                    "<td id='Td" + i + "_4' style='width:230px'>" + rpta.Data[i].horarequerimiento + "</td>" +
                    "<td id='Td" + i + "_5' style='width:230px'>" + rpta.Data[i].horaarribo + "</td>" +
                    "<td id='Td" + i + "_6' style='width:230px'>" + rpta.Data[i].nroidenpersontrans + "</td>" +
                    "<td id='Td" + i + "_7' style='width:230px'>" + rpta.Data[i].nomresponsable + "</td>" +
                    "<td colspan='2'><button id='btnEditar' type='button' onclick='EditarEmergencia("+JSON.stringify(rpta.Data[i])+ "," + i + ");' class='btn btn-primary' style='width:90px'>Editar</button></td>" +
                    "<td colspan='2'><button id='btnEliminar' type='button' onclick='EliminarEmergencia(" + rpta.Data[i].identidad + ");' class='btn btn-primary' style='width:90px' >Eliminar</button></td>" +
                    "</tr>");
            }
            $("#txtPosicion").val(rpta.current + 1 + " de " + (rpta.last + 1));
        }


        function exitoCombo(rpta) {           
            
            var liscombo = '';

            for (i = 0; i < rpta.Data.length; i++) {
                liscombo += "<option value=" + rpta.Data[i].identidad + " >" + rpta.Data[i].nomentidad + "</option> ";
            }

            var tabla = $("#tbRegConsultaemergencia");

            tabla.append("<tr style='border-top: 1px solid #222;border-bottom: 1px solid #222;'><td style='width:180px;'><select id='cboEntidad' onchange='Recuperar();' style='width:120px;height:20px'>" +
                  liscombo +
                "</select></td></td>" +
                "<td id='lbltelefono01'> </td>" +
                "<td id='lbltelefono02'> </td>" +
                "<td><input type='text' id='txthorarequerimiento' style='width:80px;height:20px'></textarea></td>" +
                "<td><input type='text' id='txthoraarribo' style='width:80px;height:20px'></textarea></td>" +
                "<td><input type='text' id='txtnroidenpersontrans' style='width:80px;height:20px'></textarea></td>" +
                "<td><input type='text' id='txtnomresponsable' style='width:80px;height:20px'></textarea></td>" +
                "<td colspan='2'><button id='btnGrabar' onclick='Grabar();' type='button' class='btn btn-primary' style='width:90px'>Grabar</button></td>" +
                "<td colspan='2'><button id='btnCancelar' type='button' class='btn btn-primary' style='width:90px'>Cancelar</button></td>" +
                "</tr>");

        }

        function error(rpta) {
            alert(rpta);
        }

    });

    setInterval("DisplayDate()", 1000);
}

function DisplayDate() {
    today = new Date();
    h = today.getHours();
    m = today.getMinutes();
    s = today.getSeconds();
    document.getElementById('reloj').innerHTML = h + ":" + m + ":" + s;
}
function Recuperar() {
    var pidentidad = $("#cboEntidad").val();
    $.ajax({
        type: "post",
        url: "/Modulo/selectentidad",
        contentType: "application/json; charset=utf-8",
        data: "{pentidad: " + pidentidad + ", Pagina: null}",
        dataType: "json",
        success: exitoselectentidad,
        error: error2
    });
}

function exitoselectentidad(rpta) {
    //$("#tdalarmhistory").html()
    //$("#idtelefono01").val(rpta.Data[0].telefono01);
    //$("#idtelefono02").val(rpta.Data[0].telefono02);
        
    $("#lbltelefono01").html(rpta.Data[0].telefono01);
    $("#lbltelefono02").html(rpta.Data[0].telefono02);

}


function Grabar() {    
    var alarmhistoryid = $("#tdalarmhistory").html().trim();
    var identidad = $("#cboEntidad").val();    
    var horarequerimiento = $("#txthorarequerimiento").val();
    var horaarribo = $("#txthoraarribo").val();
    var nroidenpersontrans = $("#txtnroidenpersontrans").val();
    var nomresponsable = $("#txtnomresponsable").val();
    $.ajax({
        type: "post",
        url: "/Modulo/InsertarEmergencia",
        contentType: "application/json; charset=utf-8",
        data: "{alarmhistoryid: " + alarmhistoryid + ", identidad: " + identidad + ", horarequerimiento: '" + horarequerimiento + "', horaarribo: '" + horaarribo + "', nroidenpersontrans: '" + nroidenpersontrans + "', nomresponsable: '" + nomresponsable + "'}",
        dataType: "json",
        success: exitoGrabar,
        error: error2
    });
}

function exitoGrabar(rpta) {    
    if (rpta == true)
    {
        alert('Datos Grabados Correctamente.');
    }
    else
    {
        alert('Datos No fueron grabados.');
    }
}


function EditarEmergencia(rpta, indice) {    
    var fila = $("#Tr" + indice);
    var campo1 = $("#Td" + indice + "_1");
    var campo2 = $("#Td" + indice + "_2");
    var campo3 = $("#Td" + indice + "_3");
    var campo4 = $("#Td" + indice + "_4");
    var campo5 = $("#Td" + indice + "_5");
    var campo6 = $("#Td" + indice + "_6");
    var campo7 = $("#Td" + indice + "_7");
    
    fila.html("<td id='Td" + indice + "_1' style='width:230px;'>" + rpta.nomentidad + "</td>" +
            "<td id='Td" + indice + "_2' style='width:230px'>" + rpta.telefono01 + "</td>" +
            "<td id='Td" + indice + "_3' style='width:230px'>" + rpta.telefono02 + "</td>" +
            "<td id='Td" + indice + "_4' style='width:230px'><input type='text' style='width:150px'value='" + rpta.horarequerimiento + "'> </input></td>" +
            "<td id='Td" + indice + "_5' style='width:230px'><input type='text' style='width:150px'value='" + rpta.horaarribo + "'> </input></td>" +
            "<td id='Td" + indice + "_6' style='width:230px'><input type='text' style='width:150px' value='" + rpta.nroidenpersontrans + "'> </input></td>" +
            "<td id='Td" + indice + "_7' style='width:230px'><input type='text' style='width:150px' value='" + rpta.nomresponsable + "'> </input></td>" +
            "<td colspan='2'><button id='btnGrabar' type='button' class='btn btn-primary' style='width:90px'>Grabar</button></td>" +
            "<td colspan='2'><button id='btnCancelar' type='button' class='btn btn-primary' style='width:90px' >Cancelar</button></td>");

    var palarmhistoryid = $("#tdalarmhistory").html().trim();
    var pidcategoria = '1';
    var pidentidad = rpta.identidad

    $.ajax({
        type: "post",
        url: "/Modulo/comboentidad",
        contentType: "application/json; charset=utf-8",
        data: "{palarmhistoryid: " + palarmhistoryid + ", pidcategoria: " + pidcategoria + ", pidentidad: " + pidentidad + ", Pagina: null}",
        dataType: "json",
        success: function (data) {
            var liscombo = '';
            for (i = 0; i < data.Data.length; i++) {
                liscombo += "<option value=" + data.Data[i].identidad + " >" + data.Data[i].nomentidad + "</option> ";
            }

            var columna = $("#Td" + indice + "_1");
            columna.html("<select id='cboEntidad' onchange='Recuperar();' style='width:120px;height:20px'>" + liscombo + "</select>");
            //$("#cboEntidad").val(campo1);
        },
        error: error2
    });
}

    



function EliminarEmergencia(varidentidad) {
    var alarmhistoryid = $("#tdalarmhistory").html().trim();    
    $.ajax({
        type: "post",
        url: "/Modulo/EliminarEmergencia",
        contentType: "application/json; charset=utf-8",
        data: "{alarmhistoryid: " + alarmhistoryid + ", identidad: " + varidentidad + "}",
        dataType: "json",
        success: exitoEliminar,
        error: error2
    });
}

function exitoEliminar(rpta) {
    if (rpta == true) {
        alert('Se eliminaron los datos.');
    }
    else {
        alert('Los datos no fueron eliminados.');
    }
}



function error2(rpta) {
    alert(rpta);
}
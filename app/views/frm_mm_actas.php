
    <div class="container "  ng-controller="mainController">
        <h3 class="text-left">{{form_title}}</h3>

        <div class="col-md-8 col-md-offset-1">

            <form class="form-horizontal alert alert-mm color-palette-set" name="formato" id="idForm" >
                               
                <div class="form-group col-md-10">
                    <label class="col-md-3" for="agenda_comiteId">{{form_agenda_comiteId}}</label>
                    <div class="col-md-8">
                    <select id='agenda_comiteId' name='agenda_comiteId' ng-model='agenda_comiteId'   
                            ng-change="updateComite()">
                     <option ng-repeat='operator1 in operators1' value = " {{operator1.comite_id}}">{{operator1.comite_nombre}}</option>
                    </select>
                    </div>
                </div>    

            </form>
        </div>
     
        <div id='divEdit' class="col-md-6 col-md-offset-1">
            <form class="form-horizontal alert alert-mm color-palette-set" name="formato" id="formEdit"
                ng-submit="insertInfo(registro2);"  ng-show="showEdit">
                <h4>{{tituloFormulario}}</h4>            
                <nav class="">
                   
                    <button class="btn btn-primary btn-xs" ng-show="btnActualiza"
                    ng-click="actualizaRegistro(registro2)">{{form_btnActualiza}}</button>

                    <button class="btn btn-primary btn-xs" ng-show="btnActualiza"
                    ng-click="cierraActa()">{{form_btnCierra}}</button>                                         

                    <button class="btn btn-primary btn-xs" ng-show="btnActualiza"
                    ng-click="anulaRegistro()">{{form_btnRegreso}}</button> 
                    
                    <span ng-model="aviso">{{aviso}}</span>
                 </nav>       
            </form>
            <div  ng-show="datosOcultos"> 
                <input type="text" ng-model="registro2.agenda_id" id ='agenda_id'  name ='agenda_id' value="{{registro2.agenda_id}}"/> 
            </div>
        </div>        

    
        <div class="clearfix"></div>
        <div class="col-md-10">
            <!-- Table to show employee detalis -->
        <div class="table-responsive">
            <table class="table table-hover tablex">
                <tr>
                    <th>ACTA</th>
                    <th>SALON</th>
                    <th>DESCRIPCION</th>
                    <th>FECHA</th>
                    <th>DESDE</th>
                    <th>HASTA</th>
                    <th>EN FIRME</th>
                    <th>CITADA</th>
                    <th>CERRADA</th>
                    <th>ESTADO</th>
                </tr>

                <tr ng-repeat="detail in details | filter:search_query">
                    <td>{{detail.agenda_acta}}</td>
                    <td>{{detail.salon_nombre}}</td>
                    <td>{{detail.agenda_Descripcion}}</td>
                    <td>{{detail.agenda_fechaDesde}}</td>
                    <td>{{detail.agenda_horaDesde}}</td>
                    <td>{{detail.agenda_horaHasta}}</td>
                    <td>{{detail.agenda_enFirme}}</td>
                    <td style="alignment-adjust: central">{{detail.agenda_conCitacion}}</td>
                    <td>{{detail.agenda_cierraActa}}</td>
                    <td>{{detail.agenda_observa}}</td>
                    <td>
                    <button class="btn btn-warning btn-xs" ng-click="editInfo(detail)" 
                            title="{{form_btnEdita}}"><span class="glyphicon glyphicon-edit"></span></button>
                    </td>
                    <td>
                    <button class="btn btn-danger btn-xs" ng-click="printInfo(detail)" id="boton"
                            title="{{form_btnPrint}}"><span class="glyphicon glyphicon-print"></span></button>
                    </td>
                </tr>
            </table>
        </div>
            
    <div
        class="modal-container" ng-show="modalShown">
        <div class="modal-window">
            <div class="modal-header">
                <div class="col-md-6"><h5>{{titVentana}}</h5></div>
                <div class="col-md-2"><button class="btn btn-primary btn-xs" ng-click="cierraVen()" id="cierraVen"
                title="{{form_btnRegreso}}">{{form_btnRegreso}} <span class="glyphicon glyphicon-collapse-down"></span></button></div>
            </div>
            <div class="modal-body">
                 <table class="table table-hover tablex">
                     <tr>
                         <th>ANEXO</th>
                         <th>VER</th>
                     </tr>  
                     <tr ng-repeat="detailAnex in detailsAnex | filter:search_query">
                     <td>{{detailAnex.anexos_anexo}}</td>
                     <td>
                         <a href="app/{{detailAnex.anexos_ruta}}"><span class="glyphicon glyphicon-download"></span></a>
                     </td>                    
                     </tr>
                 </table> 
             </div>
        </div>
    </div>
</div>                    
          
                    
        </div>
</div>
<script src="controller/ctrls/mm_actas.ctrl.js" type="text/javascript"></script>
<!--script src="controller/min/mm_actas.ctrl.min.js" type="text/javascript"></script-->

<!-- >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Tuesday,Jan 09, 2018 10:54:14   <<<<<<< -->


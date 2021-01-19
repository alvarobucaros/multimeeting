
    <div class="container "  ng-controller="mainController">
        <h3 class="text-left">{{form_title}}</h3>
<!--        <nav class="navbar navbar-default navbar-mm col-md-8 col-md-offset-1">
            <div class="navbar-header">
                <div class="alert alert-default navbar-brand search-box">
                    <button class="btn btn-primary btn-xs" ng-show="show_form" 
                    ng-click="formToggle()">{{form_btnNuevo}}<span class="glyphicon" aria-hidden="true"></span></button>
                    <button class='btn btn-primary btn-xs'
                    ng-click='exporta()'>{{form_btnExcel}}</button>
                </div>
                <div class="alert alert-default input-group search-box">
                    <span class="input-group-btn">
                        <input type="text" class="mitexto busca-mm" placeholder="{{form_Phbusca}}" ng-model="search_query" required>
                    </span>
                </div>
            </div>
        </nav>-->
        <div class="col-md-8 col-md-offset-1">

            <form class="form-horizontal alert alert-mm color-palette-set" name="formato" id="idForm"
                  ng-submit="insertInfo(registro);" hidden=""> 
                <div class="form-group" >
                    <label class="control-label milabel col-md-8" for="pendiente_empresa">{{form_anotacion}}</label>
                </div> 
                <div  style='display: none'>
                    <div class="form-group" >
                        <label class="control-label milabel col-md-4" for="pendiente_empresa">{{form_pendiente_empresa}}</label>
                       <div class="col-md-5">
                        <input type="text" class="mitexto" id="pendiente_empresa" name="pendiente_empresa"
                             ng-model="registro.pendiente_empresa" required Placeholder="{{form_Phpendiente_empresa}}" 
                             value="{{registro.pendiente_empresa}}" />
                        </div>
                    </div> 

                    <div class="form-group">
                        <label class="control-label milabel col-md-4" for="pendiente_comite">{{form_pendiente_comite}}</label>
                        <div class="col-md-5">
                        <select id='pendiente_comite' name='pendiente_comite' ng-model='registro.pendiente_comite' 
                                 ng-change="buscaAgenda()">
                         <option ng-repeat='operator0 in operators0' value = " {{operator0.comite_id}}">{{operator0.comite_nombre}}</option>
                        </select>
                        </div>
                    </div> 

                    <div class="form-group">
                        <label class="control-label milabel col-md-4" for="pendiente_agendaId">{{form_pendiente_agendaId}}</label>
                        <div class="col-md-5">
                        <select id='pendiente_agendaId' name='pendiente_agendaId' ng-model='registro.pendiente_agendaId' 
                                ng-change="buscaTemas()">
                         <option ng-repeat='operator1 in operators1' value = " {{operator1.agenda_id}}">{{operator1.agenda_Descripcion}}</option>
                        </select>
                        </div>
                    </div> 

                    <div class="form-group">
                        <label class="control-label milabel col-md-4" for="pendiente_tema">{{form_pendiente_tema}}</label>
                        <div class="col-md-5">
                        <select id='pendiente_tema' name='pendiente_tema' ng-model='registro.pendiente_tema' >
                         <option ng-repeat='operator2 in operators2' value = " {{operator2.tema_id}}">{{operator2.tema_titulo}}</option>
                        </select>
                        </div>
                    </div> 
                </div>
                <div class="form-group">
                    <label class="control-label milabel col-md-4" for="pendiente_detalle">{{form_pendiente_detalle}}</label>
                   <div class="col-md-5">
                    <textarea  class="mitexto"  cols="60" rows="4" id="pendiente_detalle" name="pendiente_detalle"
                         ng-model="registro.pendiente_detalle" required Placeholder="{{form_Phpendiente_detalle}}" 
                         value="{{registro.pendiente_detalle}}">
                    </textarea>
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label milabel col-md-4" for="pendiente_responsable">{{form_pendiente_responsable}}</label>
                   <div class="col-md-5">
                    <input type="text" class="mitexto" id="pendiente_responsable" name="pendiente_responsable"
                         ng-model="registro.pendiente_responsable" required Placeholder="{{form_Phpendiente_responsable}}" 
                         value="{{registro.pendiente_responsable}}" />
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label milabel col-md-4" for="pendiente_fecha">{{form_pendiente_fecha}}</label>
                   <div class="col-md-5">
                    <input type="date" width="12" class="mitexto fa fa-calendar fa-lg" id="pendiente_fecha" name="pendiente_fecha"
                         ng-model="registro.pendiente_fecha" required Placeholder="{{form_Phpendiente_fecha}}" 
                         value="{{registro.pendiente_fecha}}"   />
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label milabel col-md-4" for="pendiente_estado">{{form_pendiente_estado}}</label>
                    <div class="btn-group  col-md-5"  data-toggle="buttons">
                   <label>
                      <input type="radio" name ="pendiente_estado" ng-model="registro.pendiente_estado" value="C" >{{form_pendiente_estado80}}
                   </label>
                   <label>
                      <input type="radio" name ="pendiente_estado" ng-model="registro.pendiente_estado" value="P" >{{form_pendiente_estado81}}
                   </label>
                    </div>
                </div> 

                <div class="form-group">
                    <div class="col-md-5">
                        <button type="button" value="Actualizar" class="btn btn-custom pull-right btn-xs" 
                                 ng-click="updateInfo(registro)" id="send_btnAc">{{form_btnActualiza}}</button>
                     </div>  
                    <div class="col-md-1">
                        <button type="button" value="Cerrar" class="btn btn-custom pull-right btn-xs" 
                                 ng-click="clearInfo(registro)" 
                                 id="send_btnCe">{{form_btnAnula}}</button> 
                    </div>
                </div>       
                <div style='display: none'>
                <input type="text"	 ng-model="registro.pendiente_id" id ='pendiente_id'  name ='pendiente_id' value="{{registro.pendiente_id}}"/>

   
                </div>
                <div id='miExcel' style='display: none'>
                </div> 
            </form>
	</div>
	<div class="clearfix"></div>
        <div class="col-md-10">
            <!-- Table to show employee detalis -->
            <div class="table-responsive">
                <table class="table table-hover tablex">
                    <tr>
                        <!--th>ID</th>
                        <th>EMPRESA</th-->
                        <th>COMITE</th>
                        <th>AGENDA</th>
                        <th>TEMA</th>
                        <th>DETALLE</th>
                        <th>RESPONSABLE</th>
                        <th>FECHA</th>
                        <th>ESTADO</th>
                    </tr>
                   
                    <tr ng-repeat="detail in details | filter:search_query | startFromGrid: currentPage * pageSize | limitTo: pageSize">
                    <!--td>{{detail.pendiente_id}}</td>
                    <td>{{detail.pendiente_empresa}}</td>
                    <td>{{detail.pendiente_agendaId}}</td>
                    <td>{{detail.pendiente_tema}}</td>
                    <td>{{detail.pendiente_comite}}</td-->
                    <td>{{detail.comite_nombre}}</td>                    
                    <td>{{detail.agenda_Descripcion}}</td>
                    <td>{{detail.tema_titulo}}</td>
                    
                    <td>{{detail.pendiente_detalle}}</td>
                    <td>{{detail.pendiente_responsable}}</td>
                    <td>{{detail.pendiente_fecha}}</td>
                    <td>{{detail.pendiente_estado}}</td>
                    <td>
                    <button class="btn btn-warning btn-xs" ng-click="editInfo(detail)" title="{{form_btnEdita}}"><span class="glyphicon glyphicon-edit"></span></button>
                    </td>
                    </tr>
                </table>
                    <div class='btn-group'>
                        <button type='button' class='btn btn-default' ng-disabled='currentPage === 0' ng-click='currentPage = currentPage - 1'>&laquo;</button>
                        <button type='button' class='btn btn-default' ng-disabled='currentPage === page.no - 1' ng-click='setPage(page.no)' ng-repeat='page in pages'>{{page.no}}</button>
                        <button type='button' class='btn btn-default' ng-disabled='currentPage >= details.length/pageSize - 1', ng-click='currentPage = currentPage + 1'>&raquo;</button>
                    </div> 
            </div>
        </div>
</div>
<script src="controller/ctrls/mm_agendapendientes.ctrl.js" type="text/javascript"></script>

	 
<!-- >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Monday,May 18, 2020 11:21:29   <<<<<<< -->

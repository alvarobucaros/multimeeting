
    <div class="container "  ng-controller="mainController">
        <h3 class="text-left">{{form_title}}</h3>
        <nav class="navbar navbar-default navbar-mm col-md-8 col-md-offset-1">
            <div class="navbar-header">
                <div class="alert alert-default navbar-brand search-box">
                    <button class="btn btn-primary btn-xs" ng-show="show_form" 
                    ng-click="formToggle()">{{form_btnNuevo}}<span class="glyphicon" aria-hidden="true"></span></button>
                    <button class='btn btn-primary btn-xs'
                    ng-click='exporta()'>{{form_btnExcel}}</button>
                </div>
                <div class="alert alert-default input-group search-box">
                    <span class="input-group-btn">
                        <input type="text" class="form-control mitexto busca-mm" placeholder="{{form_Phbusca}}" ng-model="search_query" required>
                    </span>
                </div>
            </div>
        </nav>
        <div class="col-md-8 col-md-offset-1">

            <form class="form-horizontal alert alert-mm color-palette-set" name="formato" id="idForm"
                  ng-submit="insertInfo(registro);" hidden="">

                <div class="form-group" style='display: none'>
                    <label class="control-label milabel col-md-4" for="uc_empresa">{{form_uc_empresa}}</label>
                   <div class="col-md-6">
                    <input type="text" class="form-control mitexto" id="uc_empresa" name="uc_empresa"
                         ng-model="registro.uc_empresa" required Placeholder="{{form_Phuc_empresa}}" 
                         value="{{registro.uc_empresa}}" />
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label milabel col-md-4" for="uc_comiteId">{{form_uc_comiteId}}</label>
                    <div class="col-md-6">
                    <select id='uc_comiteId' name='uc_comiteId' ng-model='registro.uc_comiteId' >
                     <option ng-repeat='operator0 in operators0' value = " {{operator0.comite_id}}">{{operator0.comite_nombre}}</option>
                    </select>
                    </div>
                </div> 

                <div class="form-group">
                    <label class="control-label milabel col-md-4" for="uc_usuarioId">{{form_uc_usuarioId}}</label>
                    <div class="col-md-6">
                    <select id='uc_usuarioId' name='uc_usuarioId' ng-model='registro.uc_usuarioId' >
                     <option ng-repeat='operator1 in operators1' value = " {{operator1.usuario_id}}">{{operator1.usuario_nombre}}</option>
                    </select>
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
                <input type="text"  ng-model="registro.uc_id" id ='uc_id'  name ='uc_id' value="{{registro.uc_id}}"/>

   
                </div>
                <div id='miExcel' style='display: none'>
                </div> 
            </form>
	</div>
	<div class="clearfix"></div>
        <div class="col-md-10">
            <!-- Table to show employee detalis -->
            <div class="table-responsive col-md-9">
                <table class="table table-hover tablex">
                    <tr>
                        <!--th>ID</th>
                        <th>EMPRESA</th-->
                        <th>COMITE</th>
                        <th>USUARIO</th>
                    </tr>
                   
                    <tr ng-repeat="detail in details | filter:search_query | startFromGrid: currentPage * pageSize | limitTo: pageSize">
                    <!--td>{{detail.uc_id}}</td>
                    <td>{{detail.uc_empresa}}</td--> 
                    <td>{{detail.comite_nombre}}</td>
                    <td>{{detail.usuario_nombre}}</td>
                    <td>
                    <button class="btn btn-warning btn-xs" ng-click="editInfo(detail)" title="{{form_btnEdita}}"><span class="glyphicon glyphicon-edit"></span></button>
                    </td>
                    <td>
                    <button class="btn btn-danger btn-xs" ng-click="deleteInfo(detail)" 
                            confirm="Está seguro ?, {{form_btnElimina}}?" title="{{form_btnElimina}}"><span class="glyphicon glyphicon-trash"></span></button>
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
<script src="controller/min/mm_usuario_comites.ctrl.min.js" type="text/javascript"></script>

<!-- >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Wednesday,May 06, 2020 12:15:03   <<<<<<< -->

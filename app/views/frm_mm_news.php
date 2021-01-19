
<!--FRMVERSION-->

    <div class="container "  ng-controller="mainController">
        <h3 class="text-left">{{form_title1}}<strong>{{form_title2}}</strong></h3>
        <h4 class="text-left">{{form_subTitle}}</h4>

        <div class="col-md-8 col-md-offset-1">

            <form class="form-horizontal alert alert-mm color-palette-set" name="nameForm" id="idForm">
                <div class="form-group" ng-view="vista">
                    <label class="control-label col-md-4" for="empresa_nombre">{{form_empresa_nombre}}</label>
                    <div class="col-md-6">
                    <input type="text" class="form-control" id="empresa_nombre" name="empresa_nombre"
                           ng-model="empresa_nombre"  value="{{empresa_nombre}}" readonly="yes"/>
                    </div>
                </div>   

                <div class="form-group" ng-show="vista">
                    <label class="control-label col-md-4" for="empresa_clave">{{form_empresa_clave}}</label>
                    <div class="col-md-6">
                    <input type="text" class="form-control" id="empresa_clave" name="empresa_clave"
                        ng-model="empresa_clave"  value="{{empresa_clave}}" readonly="yes"/>
                    </div>
                </div> 

                <div class="form-group" ng-show="vista">
                    <label class="control-label col-md-4" for="empresa_versionPrd">{{form_empresa_versionPrd}}</label>
                    <div class="col-md-6">
                    <input type="text" class="form-control" id="empresa_versionPrd" name="empresa_versionPrd"
                        ng-model="empresa_versionPrd"  value="{{empresa_versionPrd}}" readonly="yes"/>
                    </div>
                </div>                

                <div class="form-group" ng-show="vista">
                    <label class="control-label col-md-4" for="empresa_versionBd">{{form_empresa_versionBd}}</label>
                    <div class="col-md-6">
                    <input type="text" class="form-control" id="empresa_versionBd" name="empresa_versionBd"
                        ng-model="empresa_versionBd"  value="{{empresa_versionBd}}" readonly="yes"/>
                    </div>
                </div> 

            </form>
        </div>
        <nav class="navbar navbar-default navbar-mm col-md-8 col-md-offset-1">
            <div class="navbar-header">
                <div class="alert alert-default navbar-brand search-box ">
                    {{form_version}}
                 </div>
            </div>
        </nav>
        <div class="clearfix"></div>
        <div class="col-md-12">
            <!-- Table to show employee detalis -->
            <div class="table-responsive">
                <table class="table table-hover mitexto1">
                    <tr ng-repeat="detail in details| filter:search_query" >
                    <td class="col-md-8">{{detail.actu_texto}}</td>                   
                    <td class="col-md-2">{{detail.actu_fechaopera}}</td>
                    <td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

<script src="controller/min/mm_news.ctrl.min.js" type="text/javascript"></script>


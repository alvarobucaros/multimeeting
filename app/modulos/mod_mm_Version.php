<?php
include_once("../bin/cls/clsConection.php");
$objClase = new DBconexion();
$con = $objClase->conectar();
$data = json_decode(file_get_contents("php://input")); 
$op = mysqli_real_escape_string($con, $data->op);


//    include_once("../bin/cls/clsConection.php");
//    $objClase = new DBconexion();
//    $con = $objClase->conectar();
//    $data = json_decode(file_get_contents("php://input")); 
//    $op = mysqli_real_escape_string($con, $data->op);
  
switch ($op)
{
    case 'r':
        leeRegistros($data);
        break;
    case 'n':
        leeNews($data);
        break;
    case 'a':
        actualiza($data);
        break; 
    case 'u':
        unRegistro($data);
        break;
}

function  leeRegistros($data){
    $objClase = new DBconexion(); 
    $con = $objClase->conectar(); 
    $empresa = $data->empresa;
    $fd = fopen('../bin/cls/mm.ctl', 'r');

    $datos=fread($fd,filesize('../bin/cls/mm.ctl')); 
    $data =explode('~',$datos);
    fclose($fd);
    
    $ctrl=$data[0] . '||' . $data[1] . '||' . $data[2] . '||' . $data[3];

    $servidor = funde($data[0]);
    $baseDatos = funde($data[1]);
    $usuario = funde($data[2]);
    $clave = funde($data[3]); 
    $version = $data[4]; 
    
    $ctrl=$servidor . '||' . $baseDatos . '||' . $usuario . '||' . $clave;
    if ($version == 0 ) {$ctrl .= '||LITE';} else {$ctrl .= '||ONLINE';};
      if ($con){
       {
            $query = "SELECT empresa_versionPrd, empresa_versionBd, empresa_clave, " . 
                     "empresa_nombre, empresa_nit FROM mm_empresa WHERE empresa_id = '" . $empresa ."'"; 
            

            $result = mysqli_query($con, $query);
            if(mysqli_num_rows($result) != 0) 
                {
                    while($row = mysqli_fetch_assoc($result)) {
                        $ctrl = $row['empresa_versionPrd'] . '||' . $row['empresa_versionBd'] . '||' .  
                        $row['empresa_clave'] . '||' . $row['empresa_nombre'] . '||' .  $row['empresa_nit'] . '||' .
                        $servidor . '||' . $baseDatos . '||' . $usuario . '||' . $clave;
                        if ($version == 0 ) {$ctrl .= '||BASICA';} else {$ctrl .= '||ESTANDARD';};
                    }
                }              
            echo $ctrl;
       }
    }
    }
    
    function funde($txt){
        $n= strlen($txt);
        $ret='';
        for ($i=0;$i<=$n;$i++)
        {
            $ret.= substr($txt,$n - $i,1);
        }
        return $ret;
    }

    function leeNews($data){
        $empresa = $data->empresa;    
        ini_set('track_errors', 1);
        $fd = fopen('../bin/cls/atm.ctl', 'r');

        $datos=fread($fd,filesize('../bin/cls/atm.ctl')); 
        $data =explode('~',$datos);
        fclose($fd);
        $servidor = funde($data[0]);
        $baseDatos = funde($data[1]);
        $usuario = funde($data[2]);
        $clave = funde($data[3]);
        $con = new mysqli($servidor,$usuario,$clave, $baseDatos);
        if (mysqli_connect_errno()) {
            printf("Conexión fallida: %s\n", mysqli_connect_error());
            return false;
        }  
        else { 
            mysqli_set_charset($con,"utf8"); 
             { 
            $query = "SELECT  actu_id, actu_empresa, actu_tipo, actu_texto, actu_fechacrea, actu_fechaopera, " .
                 " actu_fechavence, actu_estado, actu_app FROM actualizaciones WHERE actu_empresa = " . $empresa .
                 " AND  actu_app = 'MM' ORDER BY actu_fechaopera DESC ";   

            $result = mysqli_query($con, $query); 
            $arr = array();  
            while($row = mysqli_fetch_assoc($result)) { 
                $arr[] = $row; 
            }             
            echo $json_info = json_encode($arr); 
            }  
        }
    }  
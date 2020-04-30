<?php
include_once("../bin/cls/clsConection.php");
$objClase = new DBconexion();
$con = $objClase->conectar();
$data = json_decode(file_get_contents("php://input")); 
$op = mysqli_real_escape_string($con, $data->op);

switch ($op)
{
    case 'r':
        leeRegistros($data);
        break;
    case 'b':
        borra($data);
        break;
    case 'a':
        actualiza($data);
        break; 
    case 'u':
        unRegistro($data);
        break;
    case 'm':
        armaModal($data);
        break;
    case 'k':
        actualizaComites($data);
        break;
    case '0':
        lista0($data);
        break;
}
  
 
 
    function  leeRegistros($data) 
    { 
      $objClase = new DBconexion(); 
      $con = $objClase->conectar(); 
      $empresa = $data->empresa;
       { 
            $query = "SELECT  usuario_id, usuario_nombre, usuario_empresa, usuario_email, 
         usuario_password, usuario_tipo_acceso, usuario_fechaCreado, 
          usuario_fechaActualizado, usuario_estado, usuario_perfil, perfil_nombre,
          usuario_avatar, usuario_user, usuario_celular
          FROM mm_usuarios INNER JOIN mm_perfiles ON usuario_perfil = perfil_codigo
          WHERE usuario_empresa = '" . $empresa . "' AND  usuario_empresa = perfil_empresa ORDER BY usuario_nombre";   
   //  echo $query;
            $result = mysqli_query($con, $query); 
            $arr = array(); 
            if(mysqli_num_rows($result) != 0)  
                { 
                    while($row = mysqli_fetch_assoc($result)) { 
                        $arr[] = $row; 
                    } 
                } 
            echo $json_info = json_encode($arr); 
       } 
    }
 
    function borra($data)
    { 
        $objClase = new DBconexion(); 
        $con = $objClase->conectar(); 
        $usuario_id = 0; 
        $query = "DELETE FROM mm_usuarios WHERE usuario_id=$data->usuario_id"; 
        mysqli_query($con, $query); 
        echo 'Ok'; 
    }
 
    function actualiza($data)
    {     
        $objClase = new DBconexion(); 
        $con = $objClase->conectar(); 
        $op =  $data->op;	 
        $usuario_id =  $data->usuario_id; 
        $usuario_nombre =  $data->usuario_nombre; 
        $usuario_empresa =  $data->usuario_empresa; 
        $usuario_email =  $data->usuario_email; 
        $usuario_password =  md5($data->usuario_user); 
        $usuario_tipo_acceso =  $data->usuario_tipo_acceso; 
        $usuario_fechaCreado =  $data->usuario_fechaCreado; 
        $usuario_fechaActualizado =  $data->usuario_fechaActualizado; 
        $usuario_estado =  $data->usuario_estado; 
        $usuario_perfil =  $data->usuario_perfil; 
        $usuario_avatar =  $data->usuario_avatar; 
        $usuario_user =  $data->usuario_user; 
        $usuario_celular =  $data->usuario_celular; 
   
        if($usuario_id  == 0) 
        { 
            $condicions="usuario_empresa = '".$usuario_empresa."' AND usuario_nombre='" . $usuario_nombre."'";
            $nr = $objClase->cuentaRegistros('mm_usuarios', $condicions);
            if($nr==0){
                $query = "INSERT INTO mm_usuarios(usuario_nombre, usuario_empresa, usuario_email, usuario_password, ".
                        " usuario_tipo_acceso, usuario_fechaCreado, usuario_fechaActualizado, usuario_estado, ".
                        " usuario_perfil, usuario_avatar, usuario_user, usuario_celular)";
                $query .= "  VALUES ('" . $usuario_nombre."', '".$usuario_empresa."', '".$usuario_email."', '".
                        $usuario_password."', '".$usuario_tipo_acceso."', '".$usuario_fechaCreado."', '".
                        $usuario_fechaActualizado."', '".$usuario_estado."', '".$usuario_perfil."', '".$usuario_avatar."', '".
                        $usuario_user."', '".$usuario_celular."')";         
                mysqli_query($con, $query);
                echo 'Ok';
            }else{
                echo 'El usuario ' . $usuario_nombre . ' Ya existe en esta empresa';
            }
            
        } 
        else 
        { 
            $query = "UPDATE mm_usuarios  SET usuario_nombre = '".$usuario_nombre."', usuario_empresa = '".
                    $usuario_empresa."', usuario_email = '".$usuario_email."', usuario_password = '".
                    $usuario_password."', usuario_tipo_acceso = '".$usuario_tipo_acceso."', usuario_fechaCreado = '".
                    $usuario_fechaCreado."', usuario_fechaActualizado = '".$usuario_fechaActualizado."', usuario_estado = '".
                    $usuario_estado."', usuario_perfil = '".$usuario_perfil."', usuario_avatar = '".
                    $usuario_avatar."', usuario_user = '".$usuario_user."', usuario_celular = '".
                    $usuario_celular."' WHERE usuario_id = ".$usuario_id;
            mysqli_query($con, $query); 
            echo 'Ok';
        } 
 
    } 
 
    function unRegistro($data) 
    { 
        $objClase = new DBconexion(); 
        $con = $objClase->conectar();	 
        $usuario_id = $data->usuario_id;      
        $query = "SELECT  usuario_id, usuario_nombre, usuario_empresa, usuario_email, usuario_password, usuario_tipo_acceso, usuario_fechaCreado, usuario_fechaActualizado, usuario_estado, usuario_perfil, usuario_avatar, usuario_user, usuario_celular  " . 
                    " FROM mm_usuarios  WHERE usuario_id = " . $usuario_id  . 
                    " ORDER BY usuario_nombre "; 
        $result = mysqli_query($con, $query); 
        $arr = array(); 
        if(mysqli_num_rows($result) != 0)  
        { 
            while($row = mysqli_fetch_assoc($result)) { 
                $arr[] = $row;
           } 
        } 
        echo $json_info = json_encode($arr); 
 
    } 
 
	 
    function lista0($data) 
    { 
        $objClase = new DBconexion(); 
        $con = $objClase->conectar();
        $empresa = $data->empresa;
        $query = "SELECT perfil_codigo, perfil_nombre FROM mm_perfiles WHERE perfil_empresa = '" .$empresa . "' ORDER BY   perfil_nombre";
 //    echo $query;
         $result = mysqli_query($con, $query); 
         $arr = array(); 
         if(mysqli_num_rows($result) != 0)
         { 
             while($row = mysqli_fetch_assoc($result)) {
                 $arr[] = $row;
              }
         } 
      echo $json_info = json_encode($arr); 
    } 
 
    function actualizaComites($data){
        $empresa = $data->empresa;
        $usuario = $data->usuario;
        $condicion = $data->condicion;
        $objClase = new DBconexion(); 
        $con = $objClase->conectar();
        $query = "DELETE FROM mm_usuario_comites WHERE uc_empresa = '" .
                 $empresa . "' AND uc_usuarioId = '" . $usuario. "' AND uc_id > 0";
        mysqli_query($con, $query); 
echo $query+' '+$condicion; 
        $rec = explode(";",$condicion);
        foreach ($rec as $value) {
            if ($value > 0){
            $query = "INSERT INTO mm_usuario_comites( uc_empresa, uc_usuarioId, uc_comiteId) " .
                    " VALUES ('" .  $empresa . "', '" .$usuario. "', '" . $value . "')";
            mysqli_query($con, $query); 
            }
        }  
echo $query+' ';
        echo 'Ok';
    }
    
    function armaModal($data){
        $empresa = $data->empresa;
        $usuario = $data->usuario;
        $objClase = new DBconexion(); 
        $con = $objClase->conectar();
        $query = "select comite_id, comite_nombre from mm_comites  WHERE comite_empresa = '" .
                $empresa . "' ORDER BY  comite_nombre";
        $result1 = mysqli_query($con, $query); 
        $res='';
        $ids='';
        $n=0;
   
        while($row = mysqli_fetch_assoc($result1)) {
            $chk='';
            $comite_id = $row['comite_id'];
            $query = " SELECT COUNT(*) as Nr FROM mm_usuario_comites  WHERE  uc_comiteId = '".
                    $comite_id . "' AND uc_empresa = '". $empresa . "' AND uc_usuarioId = '" . $usuario ."' ";
            $result2 = mysqli_query($con, $query);
   
             while($rec = mysqli_fetch_assoc($result2)) {
               if ($rec['Nr'] != '0'){$chk='checked';}  
             }
            

            $res.= '<input type="checkbox" name="cbox" id="cbox' .$n .'" value="' . $row['comite_id'] .
                  '" ' .$chk . '> <label for="cbox' .$row['comite_id'] .'" >' . $row['comite_nombre'] .' </label>  ';
            $ids .= $row['comite_id'].';';
            $n+=1;
       }
       echo $res;    
    }
 
// >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Tuesday,Oct 24, 2017 11:30:34   <<<<<<< 

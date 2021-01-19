<?php
include_once("../bin/cls/clsConection.php");
$objClase = new DBconexion('atominge_mmeeting','127,0,0,1','root','');
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
        maxRegistroId($data);
        break;
    case 'exp':
        exportaXls($data);
        break; 
    case '0':
        lista0($data);
        break;
    case '1':
        lista1($data);
        break;
}
  

 
    function  leeRegistros($data) 
    { 
      global $objClase;
      $con = $objClase->conectar(); 
       $empresa = $data->empresa; 
       { 
            $query = "SELECT  uc_id, uc_empresa, uc_comiteId, comite_nombre, uc_usuarioId , usuario_nombre " .
                " FROM mm_usuario_comites  " .
                " INNER JOIN  mm_comites ON uc_comiteId = comite_id AND comite_empresa = uc_empresa " .
                " INNER JOIN  mm_usuarios ON uc_usuarioId = usuario_id AND usuario_empresa = uc_empresa " .
                " WHERE uc_empresa =  " .$empresa.
                " ORDER BY uc_comiteId ";             
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
       global $objClase;
        $con = $objClase->conectar(); 
        $query = "DELETE FROM mm_usuario_comites WHERE uc_id=$data->uc_id"; 
        mysqli_query($con, $query); 
        echo 'Ok'; 
    }
 
    function actualiza($data)
    {     
       global $objClase;
        $con = $objClase->conectar(); 
        $op =  $data->op;	 
        $uc_id =  $data->uc_id; 
        $uc_empresa =  $data->uc_empresa; 
        $uc_comiteId =  $data->uc_comiteId; 
        $uc_usuarioId =  $data->uc_usuarioId; 
   
        if($uc_id  == 0) 
        { 
           $query = "INSERT INTO mm_usuario_comites(uc_empresa, uc_comiteId, uc_usuarioId)";
           $query .= "  VALUES ('" . $uc_empresa."', '".$uc_comiteId."', '".$uc_usuarioId."')";  
            mysqli_query($con, $query);
            echo 'Ok';
        } 
        else 
        { 
            $query = "UPDATE mm_usuario_comites  SET uc_empresa = '".$uc_empresa."', uc_comiteId = '".$uc_comiteId."', uc_usuarioId = '".$uc_usuarioId."' WHERE uc_id = ".$uc_id;
            mysqli_query($con, $query); 
            echo 'Ok';
        } 
 
    } 
 
 function exportaXls($data){ 
       global $objClase;
        $con = $objClase->conectar(); 
        $empresa = $data->empresa; 
        $expo=''; 
        $expo .= '<table border=1 class="table2Excel"> '; 
        $expo .=  '<tr> '; 
      $expo .=  '          <th>ID</th>';
      $expo .=  '          <th>EMPRESA</th>';
      $expo .=  '          <th>COMITEID</th>';
      $expo .=  '          <th>USUARIOID</th>';
            $query = "SELECT  uc_id, uc_empresa, uc_comiteId, uc_usuarioId" 
                    . " FROM mm_usuario_comites ORDER BY uc_comiteId ";             
            $result = mysqli_query($con, $query); 
            if(mysqli_num_rows($result) != 0)  
                { 
                    while($row = mysqli_fetch_assoc($result)) { 
                 $expo .=  '<tr> '; 
                $expo .=  	'<td>' .$row['uc_id']. '</td> ';
                $expo .=  	'<td>' .$row['uc_empresa']. '</td> ';
                $expo .=  	'<td>' .$row['uc_comiteId']. '</td> ';
                $expo .=  	'<td>' .$row['uc_usuarioId']. '</td> ';
                 $expo .=  '</tr> '; 
                    } 
                } 
        $expo .=  '</table> ';  
        echo $expo; 
    return $expo; 
 } 
    function maxRegistroId($data) 
    { 
       global $objClase;
        $con = $objClase->conectar();	 
        $id=0;
        $query = "SELECT  MAX(uc_id) as id 
                    FROM mm_usuario_comites"; 
        $result = mysqli_query($con, $query); 
            while($row = mysqli_fetch_assoc($result)) { 
                $id = $row['id'];
                $id +=1;
           } 
        echo $id; 
        return $id; 
        } 
 
    function unRegistro($data) 
    { 
       global $objClase;
        $con = $objClase->conectar();	 
        $uc_id = $data->uc_id;      
        $query = "SELECT  uc_id, uc_empresa, uc_comiteId, uc_usuarioId  " . 
                    " FROM mm_usuario_comites  WHERE uc_id = " . $uc_id  . 
                    " ORDER BY uc_comiteId "; 
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
       global $objClase;
        $con = $objClase->conectar();
        $empresa = $data->empresa; 
         $query = "SELECT comite_id, comite_nombre FROM mm_comites WHERE comite_empresa = " . $empresa .
                  " ORDER BY  comite_nombre";
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
 
    function lista1($data) 
    { 
       global $objClase;
        $con = $objClase->conectar();	
        $empresa = $data->empresa; 
         $query = "SELECT usuario_id,  usuario_nombre FROM mm_usuarios WHERE usuario_empresa = " . $empresa .
                  " ORDER BY  usuario_nombre";
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
 
 
// >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Wednesday,May 06, 2020 12:15:03   <<<<<<< 

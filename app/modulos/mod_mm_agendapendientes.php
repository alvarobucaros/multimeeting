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
    case '2':
        lista2($data);
        break;
}
  

 
    function  leeRegistros($data) 
    { 
        global $objClase;
        $con = $objClase->conectar(); 
        $empresa = $data->empresa; 
        $usuario = $data->user;
        { 
            $query = "SELECT  pendiente_id, pendiente_empresa, pendiente_comite, comite_nombre, ".
                    " pendiente_agendaId, agenda_Descripcion, pendiente_tema, tema_titulo, pendiente_detalle, ".
                    " pendiente_responsable, pendiente_fecha, pendiente_estado ".
                    " FROM mm_agendapendientes ".
                    " INNER JOIN mm_comites ON pendiente_comite = comite_id ".
                    " INNER JOIN mm_agendamiento ON pendiente_agendaId = agenda_id ".
                    " INNER JOIN mm_agendatemas ON  pendiente_tema = tema_id AND tema_tipo = 'PDNT'".
                    " WHERE pendiente_empresa = ".$empresa . 
                    " AND pendiente_comite IN (SELECT uc_comiteId FROM mm_usuario_comites WHERE uc_empresa  = " . 
                     $empresa . "  AND uc_usuarioId = " . $usuario . ")".
                    " ORDER BY pendiente_estado DESC,  pendiente_fecha ";          
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
        $query = "DELETE FROM mm_agendapendientes WHERE pendiente_id=$data->pendiente_id"; 
        mysqli_query($con, $query); 
        echo 'Ok'; 
    }
 
    function actualiza($data)
    {     
        global $objClase;
        $con = $objClase->conectar(); 
        $op =  $data->op;	 
        $pendiente_id =  $data->pendiente_id; 
        $pendiente_empresa =  $data->pendiente_empresa; 
        $pendiente_comite =  $data->pendiente_comite; 
        $pendiente_agendaId =  $data->pendiente_agendaId; 
        $pendiente_tema =  $data->pendiente_tema; 
        $pendiente_detalle =  $data->pendiente_detalle; 
        $pendiente_responsable =  $data->pendiente_responsable; 
        $pendiente_fecha =  $data->pendiente_fecha; 
        $pendiente_estado =  $data->pendiente_estado; 
   
        if($pendiente_id  == 0) 
        { 
           $query = "INSERT INTO mm_agendapendientes(pendiente_empresa, pendiente_comite, pendiente_agendaId, ".
                    " pendiente_tema, pendiente_detalle, pendiente_responsable, pendiente_fecha, pendiente_estado)";
           $query .= "  VALUES ('" . $pendiente_empresa."', '".$pendiente_comite."', '".$pendiente_agendaId."', '".
                   $pendiente_tema."', '".$pendiente_detalle."', '".$pendiente_responsable."', '".
                   $pendiente_fecha."', '".$pendiente_estado."')";  
            mysqli_query($con, $query);
        if($pendiente_estado='C'){
            $query = "UPDATE mm_agendatemas  SET tema_tipo = 'GRAL'  WHERE tema_empresa = " . $pendiente_empresa .
                    "  AND tema_id = " . $pendiente_tema;
            mysqli_query($con, $query);
        }    
            echo 'Ok';
        } 
        else 
        { 
            $query = "UPDATE mm_agendapendientes  SET pendiente_empresa = '".$pendiente_empresa."', pendiente_comite = '".$pendiente_comite."', pendiente_agendaId = '".$pendiente_agendaId."', pendiente_tema = '".$pendiente_tema."', pendiente_detalle = '".$pendiente_detalle."', pendiente_responsable = '".$pendiente_responsable."', pendiente_fecha = '".$pendiente_fecha."', pendiente_estado = '".$pendiente_estado."' WHERE pendiente_id = ".$pendiente_id;
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
      $expo .=  '          <th>COMITE</th>';
      $expo .=  '          <th>AGENDAID</th>';
      $expo .=  '          <th>TEMA</th>';
      $expo .=  '          <th>DETALLE</th>';
      $expo .=  '          <th>RESPONSABLE</th>';
      $expo .=  '          <th>FECHA</th>';
      $expo .=  '          <th>ESTADO</th>';
            $query = "SELECT  pendiente_id, pendiente_empresa, pendiente_comite, pendiente_agendaId, pendiente_tema, pendiente_detalle, pendiente_responsable, pendiente_fecha, pendiente_estado" 
                    . " FROM mm_agendapendientes ORDER BY pendiente_comite ";             
            $result = mysqli_query($con, $query); 
            if(mysqli_num_rows($result) != 0)  
                { 
                    while($row = mysqli_fetch_assoc($result)) { 
                 $expo .=  '<tr> '; 
                $expo .=  	'<td>' .$row['pendiente_id']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_empresa']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_comite']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_agendaId']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_tema']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_detalle']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_responsable']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_fecha']. '</td> ';
                $expo .=  	'<td>' .$row['pendiente_estado']. '</td> ';
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
        $query = "SELECT  MAX(pendiente_id) as id 
                    FROM mm_agendapendientes"; 
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
        $pendiente_id = $data->pendiente_id;      
        $query = "SELECT  pendiente_id, pendiente_empresa, pendiente_comite, pendiente_agendaId, pendiente_tema, pendiente_detalle, pendiente_responsable, pendiente_fecha, pendiente_estado  " . 
                    " FROM mm_agendapendientes  WHERE pendiente_id = " . $pendiente_id  . 
                    " ORDER BY pendiente_comite "; 
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
        $empresa = $data->empresa;
        $usuario = $data->user;
        $objClase = new DBconexion(); 
        $con = $objClase->conectar();	 
        $query = "SELECT comite_id,  comite_nombre FROM mm_comites WHERE  comite_empresa = " . $empresa .
                 " AND comite_activo = 'A' " .
                 " AND comite_id IN (SELECT uc_comiteId FROM mm_usuario_comites WHERE uc_empresa  = " . 
                  $empresa . "  AND uc_usuarioId = " . $usuario . ")".
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
        $empresa = $data->empresa;
        $comite = $data->comite;
        global $objClase;
        $con = $objClase->conectar();	 
         $query = " SELECT agenda_id, agenda_Descripcion FROM mm_agendamiento where agenda_comiteId = ". $comite;
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
 
    function lista2($data) 
    { 
       global $objClase;
        $con = $objClase->conectar();	
        $empresa = $data->empresa;
        $comite = $data->comite;
        $agenda = $data->agenda;
        if($agenda >0 ){$cond = " AND tema_agendaId = " .$agenda ;}
        else{$cond = "";}
        $query = " SELECT tema_id, tema_titulo FROM mm_agendatemas WHERE tema_tipo = 'PDNT' ".
                  " AND tema_empresa = ". $empresa . " AND tema_comite = " . $comite . $cond ;
// echo $query;             
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

// >>>>>>>   Creado por: Alvaro Ortiz Castellanos   Monday,May 18, 2020 11:21:29   <<<<<<< 

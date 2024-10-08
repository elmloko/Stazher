<?php include 'includes/session.php'; ?>
<?php include 'includes/header.php'; ?>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php include 'includes/navbar.php'; ?>
    <?php include 'includes/menubar.php'; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Asistencia
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
          <li class="active">Asistencia</li>
        </ol>
      </section>
      <!-- Main content -->
      <section class="content">
        <?php
        if (isset($_SESSION['error'])) {
          echo "
            <div class='alert alert-danger alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-warning'></i> Error!</h4>
              " . $_SESSION['error'] . "
            </div>
          ";
          unset($_SESSION['error']);
        }
        if (isset($_SESSION['success'])) {
          echo "
            <div class='alert alert-success alert-dismissible'>
              <button type='button' class='close' data-dismiss='alert' aria-hidden='true'>&times;</button>
              <h4><i class='icon fa fa-check'></i>¡Proceso Exitoso!</h4>
              " . $_SESSION['success'] . "
            </div>
          ";
          unset($_SESSION['success']);
        }
        ?>
        <div class="row">
          <div class="col-xs-12">
            <div class="box">
              <div class="box-header with-border">
                <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i> Nuevo</a>
                
                <!-- Select para elegir el empleado -->
                <div class="form-group" style="width: 200px; display: inline-block;">
                  <label for="employeeSelect">Seleccione un Pasante:</label>
                  <select id="employeeSelect" class="form-control">
                    <option value="">Todos</option>
                    <?php
                    $sql = "SELECT * FROM employees";
                    $query = $conn->query($sql);
                    while($row = $query->fetch_assoc()){
                        echo "<option value='".$row['id']."'>".$row['firstname']." ".$row['lastname']."</option>";
                    }
                    ?>
                  </select>
                </div>

                <!-- Botón para imprimir reporte único -->
                <a href="#" id="printUnique" class="btn btn-success btn-sm btn-flat pull-right">
                    <span class="glyphicon glyphicon-print"></span> Imprimir Reporte Único
                </a>

              </div>
              <div class="box-body">
                <table id="example1" class="table table-bordered">
                  <thead>
                    <th class="hidden"></th>
                    <th>ID Pasante</th>
                    <th>Nombre</th>
                    <th>Fecha</th>
                    <th>Hora Entrada</th>
                    <th>Hora Salida</th>
                    <th>Acción</th>
                  </thead>
                  <tbody>
                    <?php
                    $sql = "SELECT *, employees.employee_id AS empid, attendance.id AS attid, 
                IF(attendance.status2 = 1, '<span class=\"label label-danger pull-right\">temprano</span>', '<span class=\"label label-warning pull-right\">extra</span>') AS status2_label
        FROM attendance 
        LEFT JOIN employees ON employees.id=attendance.employee_id 
        ORDER BY attendance.date DESC, attendance.time_in DESC";
                    $query = $conn->query($sql);
                    while ($row = $query->fetch_assoc()) {
                      $status = ($row['status']) ? '<span class="label label-success pull-right">temprano</span>' : '<span class="label label-danger pull-right">tarde</span>';
                      $formattedDate = $row['date'] ? date('M d, Y', strtotime($row['date'])) : '';
                      $formattedTimeIn = $row['time_in'] ? date('h:i A', strtotime($row['time_in'])) . $status : '';
                      $formattedTimeOut = $row['time_out'] ? date('h:i A', strtotime($row['time_out'])) . $row['status2_label'] : '';

                      echo "
    <tr>
      <td class='hidden'></td>
      <td>" . $row['empid'] . "</td>
      <td>" . $row['firstname'] . ' ' . $row['lastname'] . "</td>
      <td>" . $formattedDate . "</td>
      <td>" . $formattedTimeIn . "</td>
      <td>" . $formattedTimeOut . "</td>
      <td>
        <button class='btn btn-success btn-sm btn-flat edit' data-id='" . $row['attid'] . "'><i class='fa fa-edit'></i> Editar</button>
        <button class='btn btn-danger btn-sm btn-flat delete' data-id='" . $row['attid'] . "'><i class='fa fa-trash'></i> Eliminar</button>
      </td>
    </tr>
  ";
                    }
                    ?>
                  </tbody>
                </table>
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>

    <?php include 'includes/footer.php'; ?>
    <?php include 'includes/attendance_modal.php'; ?>
  </div>
  <?php include 'includes/scripts.php'; ?>
  <script>
    $(function() {
      // Utiliza la delegación de eventos en lugar de adjuntar directamente a .edit y .delete
      $(document).on('click', '.edit', function(e) {
        e.preventDefault();
        $('#edit').modal('show');
        var id = $(this).data('id');
        getRow(id);
      });

      $(document).on('click', '.delete', function(e) {
        e.preventDefault();
        $('#delete').modal('show');
        var id = $(this).data('id');
        getRow(id);
      });
    });

    function getRow(id) {
      $.ajax({
        type: 'POST',
        url: 'attendance_row.php',
        data: {
          id: id
        },
        dataType: 'json',
        success: function(response) {
          $('#datepicker_edit').val(response.date);
          $('#attendance_date').html(response.date);
          $('#edit_time_in').val(response.time_in);
          $('#edit_time_out').val(response.time_out);
          $('#attid').val(response.attid);
          $('#employee_name').html(response.firstname + ' ' + response.lastname);
          $('#del_attid').val(response.attid);
          $('#del_employee_name').html(response.firstname + ' ' + response.lastname);
        }
      });
    }

    // Script para manejar la impresión del reporte único
    document.getElementById('printUnique').addEventListener('click', function() {
        var employee_id = document.getElementById('employeeSelect').value;
        var url = 'asistence_print_unique.php?employee_id=' + employee_id;
        window.location.href = url;
    });

    $(document).ready(function() {
  // Verifica si la tabla ya está inicializada
  if (!$.fn.DataTable.isDataTable('#example1')) {
    $('#example1').DataTable({
      "paging": true,
      "lengthChange": false,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  }
});

  </script>
</body>

</html>

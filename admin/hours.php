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
              <div class="box-body">
                <table id="example1" class="table table-bordered">
                  <thead>
                    <tr>
                      <th class="hidden"></th>
                      <th>ID Pasante</th>
                      <th>Nombre</th>
                      <th>Horas Totales</th>
                      <th>Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    <?php
                    $sql = "SELECT 
                              employees.employee_id AS empid, 
                              employees.firstname, 
                              employees.lastname, 
                              SUM(TIME_TO_SEC(TIMEDIFF(attendance.time_out, attendance.time_in)) + TIME_TO_SEC(employees.add_hr)) AS totalSeconds
                            FROM 
                              attendance 
                            INNER JOIN 
                              employees 
                            ON 
                              employees.id = attendance.employee_id 
                            GROUP BY 
                              attendance.employee_id, 
                              employees.employee_id, 
                              employees.firstname, 
                              employees.lastname;";
                    $query = $conn->query($sql);

                    while ($row = $query->fetch_assoc()) {
                      $empid = $row['empid'];
                      $firstname = $row['firstname'];
                      $lastname = $row['lastname'];
                      $totalSeconds = $row['totalSeconds'];

                      // Formatear totalSeconds en horas y minutos
                      $hours = floor($totalSeconds / 3600);
                      $minutes = floor(($totalSeconds % 3600) / 60);

                      echo "
                        <tr>
                          <td class='hidden'></td>
                          <td>" . $empid . "</td>
                          <td>" . $firstname . ' ' . $lastname . "</td>
                          <td>" . sprintf('%d:%02d', $hours, $minutes) . "</td>
                          <td>
                            <button class='btn btn-primary btn-sm btn-flat add-schedule' data-empid='" . $empid . "'><i class='fa fa-clock-o'></i> Agregar Horario</button>
                            <button class='btn btn-danger btn-sm btn-flat print-certificate' data-empid='" . $empid . "'><i class='fa fa-print'></i> Descargar en PDF</button>
                            <a href='certificate_edit.php?empid=" . $empid . "' class='btn btn-info btn-sm btn-flat'><i class='fa fa-file-word-o'></i> Descargar en Word</a>
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
    <?php include 'includes/add_schedule_modal.php'; ?>
  </div>
  <?php include 'includes/scripts.php'; ?>
  <script>
    $(function() {
      $('.edit').click(function(e) {
        e.preventDefault();
        $('#edit').modal('show');
        var id = $(this).data('id');
        getRow(id);
      });

      $('.delete').click(function(e) {
        e.preventDefault();
        $('#delete').modal('show');
        var id = $(this).data('id');
        getRow(id);
      });

      $('.print-certificate').click(function(e) {
        e.preventDefault();
        var empid = $(this).data('empid');
        printCertificate(empid);
      });

      $('.add-schedule').click(function(e) {
        e.preventDefault();
        var empid = $(this).data('empid');
        $('#empid').val(empid); // Set the employee ID in the hidden input field
        $('#addScheduleModal').modal('show'); // Open the modal
      });
    });

    function getRow(id) {
      $.ajax({
        type: 'POST

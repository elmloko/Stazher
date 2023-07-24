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
          Lista de Pasantes
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
          <li>Pasantes</li>
          <li class="active">Lista de Pasantes</li>
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

                <a href="#addnew" data-toggle="modal" class="btn btn-primary btn-sm btn-flat"><i class="fa fa-plus"></i>
                  Nuevo</a>
                  <a href="employee_print.php" class="btn btn-success btn-sm btn-flat pull-right">
                  <span class="glyphicon glyphicon-print"></span> Imprimir Todos
                </a>
              </div>

              <div class="box-body">
                <table id="example1" class="table table-bordered">
                  <thead>
                    <th>ID Pasante</th>
                    <th>Nombre Completo</th>
                    <th>Carnet de Identidad</th>
                    <th>Correo Electronico</th>
                    <th>Dependecia</th>
                    <th>Casas Superiores de Estudio/Instituto</th>
                    <th>Modalidad</th>
                    <th>Carrera</th>
                    <th>Miembro Desde</th>
                    <th>Foto</th>
                    <th>Acción</th>
                  </thead>
                  <tbody>
                    <?php
                    // $sql = "SELECT *, employees.id AS empid FROM employees LEFT JOIN position ON position.id=employees.position_id LEFT JOIN schedules ON schedules.id=employees.schedule_id ";
                    $sql = "SELECT *, employees.id AS empid 
                    FROM employees 
                    LEFT JOIN position ON position.id = employees.position_id 
                    LEFT JOIN schedules ON schedules.id = employees.schedule_id
                    LEFT JOIN modality ON modality.id = employees.modality_id
                    LEFT JOIN institution ON institution.id = employees.institution_id
                    LEFT JOIN area ON area.id = employees.area_id
                    LEFT JOIN career ON career.id = employees.career_id";

                    $query = $conn->query($sql);
                    while ($row = $query->fetch_assoc()) {
                      ?>
                      <tr>
                        <td>
                          <?php echo $row['employee_id']; ?>
                        </td>
                        <td>
                          <?php echo $row['firstname'] . ' ' . $row['lastname']; ?>
                        </td>
                        <td>
                          <?php echo $row['identity_card']; ?>
                        </td>
                        <td>
                          <?php echo $row['email']; ?>
                        </td>
                        <td>
                          <?php echo $row['description'] . ' - ' . $row['name_area']; ?>
                        </td>
                        <td>
                          <?php echo $row['name_institution']; ?>
                        </td>
                        <td>
                          <?php echo $row['type_modality']; ?>
                        </td>
                        <td>
                          <?php echo $row['name_career']; ?>
                        </td>
                        <td>
                          <?php echo date('M d, Y', strtotime($row['created_on'])) ?>
                        </td>
                        <td><img
                            src="<?php echo (!empty($row['photo'])) ? '../images/' . $row['photo'] : '../images/profile.jpg'; ?>"
                            width="30px" height="30px"> <a href="#edit_photo" data-toggle="modal" class="pull-right photo"
                            data-id="<?php echo $row['empid']; ?>"><span class="fa fa-edit"></span></a></td>
                        <td>
                          <button class="btn btn-success btn-sm edit btn-flat" data-id="<?php echo $row['empid']; ?>"><i
                              class="fa fa-edit"></i> Editar</button>
                          <button class="btn btn-danger btn-sm delete btn-flat" data-id="<?php echo $row['empid']; ?>"><i
                              class="fa fa-trash"></i> Eliminar</button>
                        </td>
                      </tr>
                      <?php
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
    <?php include 'includes/employee_modal.php'; ?>
  </div>
  <?php include 'includes/scripts.php'; ?>
  <script>
    $(function () {
      $('.edit').click(function (e) {
        e.preventDefault();
        $('#edit').modal('show');
        var id = $(this).data('id');
        getRow(id);
      });

      $('.delete').click(function (e) {
        e.preventDefault();
        $('#delete').modal('show');
        var id = $(this).data('id');
        getRow(id);
      });

      $('.photo').click(function (e) {
        e.preventDefault();
        var id = $(this).data('id');
        getRow(id);
      });

    });

    function getRow(id) {
      $.ajax({
        type: 'POST',
        url: 'employee_row.php',
        data: {
          id: id
        },
        dataType: 'json',
        success: function (response) {
          $('.empid').val(response.empid);
          $('.employee_id').html(response.employee_id);
          $('.del_employee_name').html(response.firstname + ' ' + response.lastname);
          $('#employee_name').html(response.firstname + ' ' + response.lastname);
          $('#edit_firstname').val(response.firstname);
          $('#edit_lastname').val(response.lastname);
          $('#edit_identity_card').val(response.identity_card);
          $('#edit_address').val(response.address);
          $('#edit_email').val(response.email);
          $('#edit_career').val(response.career);
          $('#edit_area').val(response.area);
          $('#datepicker_edit').val(response.birthdate);
          $('#edit_contact').val(response.contact_info);
          $('#email_val').val(response.email).html(response.email);
          $('#gender_val').val(response.gender).html(response.gender);
          $('#position_val').val(response.position_id).html(response.description);
          $('#career_val').val(response.career_id).html(response.name_career);
          $('#area_val').val(response.area_id).html(response.name_area);
          $('#modality_val').val(response.modality_id).html(response.type_modality);
          $('#institution_val').val(response.institution_id).html(response.name_institution);
          $('#schedule_val').val(response.schedule_id).html(response.time_in + ' - ' + response.time_out);
        }
      });
    }
  </script>
</body>

</html>
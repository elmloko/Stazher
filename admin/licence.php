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
          Licencia
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
          <li class="active">Licencia</li>
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
              </div>
              <div class="box-body">
                <table id="example1" class="table table-bordered">
                  <thead>
                    <th class="hidden"></th>
                    <th>ID Pasante</th>
                    <th>Nombre</th>
                    <th>Razon o Motivo</th>
                    <th>Fecha</th>
                    <th>Acción</th>
                  </thead>
                  <tbody>
  <?php
    $sql = "SELECT e.firstname, e.lastname, e.employee_id, l.reason, l.date_licence
    FROM employees e
    INNER JOIN licence l ON e.licence_id = l.id";
        
    $query = $conn->query($sql);
    while($row = $query->fetch_assoc()){
      echo "
        <tr>
          <td class='hidden'></td>
          <td>".$row['employee_id']."</td>
          <td>".$row['firstname'].' '.$row['lastname']."</td>
          <td>".$row['reason']."</td>
          <td>".$row['date_licence']."</td>
          <td>
            <button class='btn btn-success btn-sm btn-flat edit' data-id='".$row['employee_id']."'><i class='fa fa-edit'></i> Editar</button>
            <button class='btn btn-danger btn-sm btn-flat delete' data-id='".$row['employee_id']."'><i class='fa fa-trash'></i> Eliminar</button>
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
    <?php include 'includes/licence_modal.php'; ?>
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
    });

    function getRow(id) {
      $.ajax({
        type: 'POST',
        url: 'licence_row.php',
        data: {
          id: id
        },
        dataType: 'json',
        success: function(response) {
          $('#datepicker_edit').val(response.date);
          $('#licence_date').html(response.date);
          $('#edit_date_licence').val(response.date_licence);
          $('#edit_reason').val(response.reason);
          $('#edit_employee_id').val(response.employee_id);
          $('#employee').val(response.employee_id);
          $('#edit_licence_id').val(response.licence_id);
          $('#employee_name').html(response.firstname + ' ' + response.lastname);
          $('#del_employee_id').val(response.employee_id);
          $('#del_employee_name').html(response.firstname + ' ' + response.lastname);
        }
      });
    }
  </script>
</body>

</html>
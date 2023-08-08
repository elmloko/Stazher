<?php
include 'includes/session.php';
include 'includes/header.php';
?>

<body class="hold-transition skin-blue sidebar-mini">
  <div class="wrapper">

    <?php include 'includes/navbar.php'; ?>
    <?php include 'includes/menubar.php'; ?>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          Faltas Pasantes
        </h1>
        <ol class="breadcrumb">
          <li><a href="#"><i class="fa fa-dashboard"></i> Inicio</a></li>
          <li class="active">Faltas</li>
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
                <a href="absences_print.php" class="btn btn-success btn-sm btn-flat pull-right">
                  <span class="glyphicon glyphicon-print"></span> Imprimir Todos
                </a>
              </div>
              <div class="box-body">
                <table id="example1" class="table table-bordered">
                  <thead>
                    <th class="hidden"></th>
                    <th>ID Pasante</th>
                    <th>Nombre</th>
                    <th>Razon o Motivo</th>
                    <th>Fecha Falta</th>
                    <th>Acción</th>
                  </thead>
                  <tbody>
                    <?php
                    $sql = "SELECT a.*, e.employee_id AS empid, e.firstname, e.lastname
                    FROM absences a
                    LEFT JOIN employees e ON e.id = a.employee_id
                    ORDER BY a.date_absences DESC";
                    $query = $conn->query($sql);
                    while ($row = $query->fetch_assoc()) {
                      echo "
                    <tr>
                        <td class='hidden'></td>
                        <td>" . $row['empid'] . "</td>
                        <td>" . $row['firstname'] . ' ' . $row['lastname'] . "</td>
                        <td>" . $row['reason'] . "</td>
                        <td>" . $row['date_absences'] . "</td>
                        <td>
                            <button class='btn btn-success btn-sm btn-flat edit' data-id='" . $row['id'] . "'><i class='fa fa-edit'></i> Editar</button>
                            <button class='btn btn-danger btn-sm btn-flat delete' data-id='" . $row['id'] . "'><i class='fa fa-trash'></i> Eliminar</button>
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
    <?php include 'includes/absences_modal.php'; ?>
  </div>
  <?php include 'includes/scripts.php'; ?>
  <script>
    $(function() {
      $('.edit').click(function(e) {
        e.preventDefault();
        $('#edit').modal('show');
        var id = $(this).data('id');
        $('#empid').val(id);
        getRow(id);
      });

      $('.delete').click(function(e) {
        e.preventDefault();
        var id = $(this).data('id');
        getRow(id);
        $('#delete').modal('show');
        
      });
    });

    function getRow(id) {
      $.ajax({
        type: 'POST',
        url: 'absences_row.php',
        data: {
          id: id
        },
        dataType: 'json',
        success: function(response) {
          $('#empid').val(response.empid);
          $('#reason').val(response.reason);
          $('#date_absences').val(response.date_absences);
          $('#edit_reason').val(response.reason);
          $('#edit_date_licence').val(response.date_absences);
          $('#employee_name').html(response.firstname + ' ' + response.lastname);
          $('#del_employee_id').html(response.empid);
          $('#del_empid').val(response.id);
        }
      });
    }
  </script>
</body>

</html>
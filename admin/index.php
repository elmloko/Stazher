<?php
  session_start();
  if(isset($_SESSION['admin'])){
    header('location:home.php');
  }
?>
<?php include 'includes/header.php'; ?>
<body class="hold-transition login-page">
<style>
    .main-footer {
      background: transparent;
    }
  </style>
<div class="login-box">
  	<div class="login-logo">
  		<b>Ingreso Administrador</b>
  	</div>
  
  	<div class="login-box-body">
    	<p class="login-box-msg">Ingresa para iniciar tu sesión</p>

    	<form action="login.php" method="POST">
      		<div class="form-group has-feedback">
        		<input type="text" class="form-control" name="username" placeholder="Ingrese el nombre de usuario" required autofocus>
        		<span class="glyphicon glyphicon-user form-control-feedback"></span>
      		</div>
          <div class="form-group has-feedback">
            <input type="password" class="form-control" name="password" placeholder="Ingrese contraseña de usuario" required>
            <span class="glyphicon glyphicon-lock form-control-feedback"></span>
          </div>
      		<div class="row">
    			<div class="col-xs-4">
          			<button type="submit" class="btn btn-primary btn-block btn-flat" name="login"><i class="fa fa-sign-in"></i> Ingresar</button>
        		</div>
      		</div>
    	</form>
  	</div>
  	<?php
  		if(isset($_SESSION['error'])){
  			echo "
  				<div class='callout callout-danger text-center mt20'>
			  		<p>".$_SESSION['error']."</p> 
			  	</div>
  			";
  			unset($_SESSION['error']);
  		}
  	?>
</div>
	
<?php include 'includes/scripts.php' ?>
</body>
<footer class="main-footer">
  <div class="pull-right hidden-xs">
    <b>Hecho por: 
      <a href="https://www.linkedin.com/in/marco-antonio-espinoza-rojas-617539256/">Marco Espinoza</a>, 
      <a href="#">Alexandra Quintanilla</a> y 
      <a href="#">Leonardo Doria Medina</a> By 
      <a href="https://www.correos.gob.bo">Agencia Boliviana de Correos</a>
    </b>
  </div>
  <strong>&copy; <?php echo date('Y'); ?> Control de Asistencia y Sistema de Nómina</strong>
</footer>
</html>
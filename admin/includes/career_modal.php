<!-- Add -->
<div class="modal fade" id="addnew">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><b>Agregar Carreras Universitarias
				</b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="career_add.php">
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label">Titulo de la carrera</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="title" name="title" required>
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
				<button type="submit" class="btn btn-primary btn-flat" name="add"><i class="fa fa-save"></i> Guardar</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Edit -->
<div class="modal fade" id="edit">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><b>Actualizar Carrera Universitaria</b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="career_edit.php">
					<input type="hidden" id="carid" name="id">
					<div class="form-group">
						<label for="edit_name_career" class="col-sm-3 control-label">Titulo de la Carrera</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_name_career" name="name_career">
						</div>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
				<button type="submit" class="btn btn-success btn-flat" name="edit"><i class="fa fa-check-square-o"></i> Actualizar</button>
				</form>
			</div>
		</div>
	</div>
</div>

<!-- Delete -->
<div class="modal fade" id="delete">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><b>Eliminando...</b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="career_delete.php">
					<input type="hidden" id="del_carid" name="id">
					<div class="text-center">
						<p>ELIMINAR CARRERA</p>
						<h2 id="del_career" class="bold"></h2>
					</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
				<button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i> Eliminar</button>
				</form>
			</div>
		</div>
	</div>
</div>
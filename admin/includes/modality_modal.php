<!-- Add -->
<div class="modal fade" id="addnew">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><b>Agregar Modalidad</b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="modality_add.php">
					<div class="form-group">
						<label for="title" class="col-sm-3 control-label">Titulo de la Modalidad de Titulacion</label>

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
				<h4 class="modal-title"><b>Actualizar Modalidad</b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="modality_edit.php">
					<input type="hidden" id="modid" name="id">
					<div class="form-group">
						<label for="edit_type_modality" class="col-sm-3 control-label">Titulo de la Modalidad de Titulacion</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_type_modality" name="type_modality">
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
				<form class="form-horizontal" method="POST" action="modality_delete.php">
					<input type="hidden" id="del_modid" name="id">
					<div class="text-center">
						<p>ELIMINAR MODALIDAD</p>
						<h2 id="del_modality" class="bold"></h2>
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
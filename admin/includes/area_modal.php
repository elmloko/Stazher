<!-- Add -->
<div class="modal fade" id="addnew">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><b>Agregar Area</b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="area_add.php">
					<div class="form-group">
						<label for="name_area" class="col-sm-3 control-label">Titulo del Area</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="name_area" name="name_area" required>
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
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title"><b>Actualizar Área</b></h4>
        </div>
        <div class="modal-body">
          <form class="form-horizontal" method="POST" action="area_edit.php">
            <input type="hidden" id="areid" name="id">
            <div class="form-group">
              <label for="edit_name" class="col-sm-3 control-label">Título del Área</label>
              <div class="col-sm-9">
                <input type="text" class="form-control" id="edit_name" name="name_area" required>
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
				<form class="form-horizontal" method="POST" action="area_delete.php">
					<input type="hidden" id="del_areid" name="id">
					<div class="text-center">
						<p>ELIMINAR AREA</p>
						<h2 id="del_name" class="bold"></h2>
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
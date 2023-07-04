<!-- Add -->
<div class="modal fade" id="addnew" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <form class="form-horizontal" method="POST" action="licence_add.php">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="myModalLabel">Agregar Licencia</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="employee_id" class="col-sm-3 control-label">ID Pasante</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="employee_id" name="employee_id" placeholder="ID Pasante" required>
            </div>
          </div>
          <div class="form-group">
            <label for="reason" class="col-sm-3 control-label">Razón o Motivo</label>
            <div class="col-sm-9">
              <input type="text" class="form-control" id="reason" name="reason" placeholder="Razón o Motivo" required>
            </div>
          </div>
          <div class="form-group">
            <label for="date_licence" class="col-sm-3 control-label">Fecha</label>
            <div class="col-sm-9">
              <input type="date" class="form-control" id="datepicker" name="date_licence" placeholder="Fecha" required>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          <button type="submit" class="btn btn-primary">Agregar</button>
        </div>
      </form>
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
				<h4 class="modal-title"><b><span id="employee_name"></span></b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="licence_edit.php">
					<input type="hidden" id="edit_employee_id" name="id">
					<div class="form-group">
						<label for="edit_reason" class="col-sm-3 control-label">Razon o Motivo</label>
						<div class="col-sm-9">
							<div class="date">
								<textarea type="text" class="form-control" id="edit_reason" name="reason" required></textarea>
							</div>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_date_licence" class="col-sm-3 control-label">Fecha</label>
						<div class="col-sm-9">
							<div class="date">
								<input type="date" class="form-control" id="edit_date_licence" name="date" required>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
						<button type="submit" class="btn btn-success btn-flat" name="edit"><i class="fa fa-check-square-o"></i> Actualizar</button>
					</div>
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
				<h4 class="modal-title"><b><span id="licence_date"></span></b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="licence_delete.php">
					<input type="hidden" id="del_employee_id" name="id">
					<div class="text-center">
						<p>ELIMINAR LICENCIA</p>
						<h2 id="del_employee_name" class="bold"></h2>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn-flat pull-left" data-dismiss="modal"><i class="fa fa-close"></i> Cerrar</button>
						<button type="submit" class="btn btn-danger btn-flat" name="delete"><i class="fa fa-trash"></i> Eliminar</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

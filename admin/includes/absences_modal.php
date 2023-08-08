<!-- Add -->
<div class="modal fade" id="addnew">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title"><b>Agregar Faltas </b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="absences_add.php">
					<div class="form-group">
						<label for="employee_id" class="col-sm-3 control-label">Codigo de Pasante</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="employee_id" name="employee_id" required>
						</div>
					</div>
					<div class="form-group">
						<label for="reason" class="col-sm-3 control-label">Razon o Motivo</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="reason" name="reason" required>
						</div>
					</div>
					<div class="form-group">
						<label for="date_absences" class="col-sm-3 control-label">Fecha Falta</label>

						<div class="col-sm-9">
							<div class="date">
								<input type="date" class="form-control" id="date_absences" name="date_absences" required>
							</div>
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
				<h4 class="modal-title"><b><span id="employee_id"></span></b></h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" method="POST" action="absences_edit.php">
					<input type="hidden" id="empid" name="id">
					<div class="form-group">
						<label for="edit_reason" class="col-sm-3 control-label">Razon o Motivo</label>

						<div class="col-sm-9">
							<input type="text" class="form-control" id="edit_reason" name="reason" required>
						</div>
					</div>
					<div class="form-group">
						<label for="edit_date_absences" class="col-sm-3 control-label">Fecha Licencia</label>

						<div class="col-sm-9">
							<div class="date">
								<input type="date" class="form-control" id="edit_date_absences" name="date_absences" required>
							</div>
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
                <form class="form-horizontal" method="POST" action="absences_delete.php">
                    <input type="hidden" id="del_empid" name="del_empid">
                    <div class="text-center">
                        <p>ELIMINAR LICENCIA</p>
                        <h2 id="del_employee_id" class="bold"></h2>
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
<!-- includes/add_schedule_modal.php -->
<div class="modal fade" id="addScheduleModal" tabindex="-1" role="dialog" aria-labelledby="addScheduleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="addScheduleModalLabel">Agregar Horario</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="addScheduleForm" method="POST" action="add_schedule.php">
          <div class="form-group">
            <label for="timeIn">Añadir Horas en el Pasantes</label>
            <input type="time" class="form-control" id="timeIn" name="timeIn" required>
          </div>
          <input type="hidden" id="empid" name="empid">
          <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
      </div>
    </div>
  </div>
</div>

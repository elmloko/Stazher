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
            <input type="text" class="form-control" id="timeIn" name="timeIn" placeholder="HH:MM" required>
          </div>
          <input type="hidden" id="empid" name="empid">
          <button type="submit" class="btn btn-primary">Guardar</button>
        </form>
      </div>
    </div>
  </div>
</div>

<script>
  document.getElementById('addScheduleForm').addEventListener('submit', function(event) {
    var timeInput = document.getElementById('timeIn').value;
    var timePattern = /^(\d+):([0-5]\d)$/;
    if (!timePattern.test(timeInput)) {
      alert('Por favor, ingrese un tiempo válido en el formato HH:MM');
      event.preventDefault();
    }
  });
</script>

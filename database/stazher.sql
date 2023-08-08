SELECT *, employees.id AS empid
  FROM employees
  LEFT JOIN position ON position.id = employees.position_id
  LEFT JOIN schedules ON schedules.id = employees.schedule_id
  LEFT JOIN modality ON modality.id = employees.modality_id
  LEFT JOIN area ON area.id = employees.area_id
  LEFT JOIN institution ON institution.id = employees.institution_id
  LEFT JOIN career ON career.id = employees.career_id
  LEFT JOIN (
      SELECT employee_id, 
      DATE_FORMAT(SEC_TO_TIME(SUM(TIME_TO_SEC(TIMEDIFF(attendance.time_out, attendance.time_in)))), '%H') AS totalHours
      FROM attendance
      GROUP BY employee_id
  ) AS attendance_hours ON employees.id = attendance_hours.employee_id
  WHERE employees.employee?id = "32";
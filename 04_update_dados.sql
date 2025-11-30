UPDATE exemplar
SET estado_exemplar = 'Disponível'
WHERE id_exemplar = 2;

UPDATE reserva
SET status = 'FINALIZADA'
WHERE id_reserva = 1;

UPDATE multa
SET valor = 20.00
WHERE id_multa = 1;

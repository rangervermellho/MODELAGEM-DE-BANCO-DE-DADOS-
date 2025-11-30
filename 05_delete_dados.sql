DELETE FROM multa
WHERE dias_atraso < 1;

DELETE FROM reserva
WHERE status = 'CANCELADA';

DELETE FROM emprestimo
WHERE data_devolucao IS NOT NULL;

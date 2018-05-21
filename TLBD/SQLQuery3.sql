select * from tbCliente
select * from tbFuncionario;

select  A.idCliente,
		A.nmCliente,
		A.dtEndereco,
		B.nmFunc
from tbCliente A
INNER JOIN tbFuncionario B 
ON A.idFuncionario = B.id_func;

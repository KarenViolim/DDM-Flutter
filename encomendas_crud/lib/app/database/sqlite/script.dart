
final createTable='''
  CREATE TABLE encomenda(
    id INTEGER NOT NULL PRIMARY KEY 
    ,nome VARCHAR(200) NOT NULL
    ,cpf CHAR(14) NOT NULL
    ,pedido VARCHAR(255) NOT NULL
    ,telefone CHAR(16) NOT NULL
    ,url_avatar VARCHAR(300) NOT NULL
  )
''';

final insert1='''
  INSERT INTO encomenda(nome, cpf, pedido, telefone, url_avatar)
  VALUES('Karen','112.481.729-81','100 Brigadeiros','(44)99826-4674','https://cdn.pixabay.com/photo/2016/12/13/02/39/brigadier-1903163_960_720.png')
''';

final insert2='''
  INSERT INTO encomenda(nome, cpf, pedido, telefone, url_avatar)
  VALUES('Santiago','088.391.089-63','50 Brigadeiros, 50 Bejinhos','(44)99766-0895','https://cdn.pixabay.com/photo/2017/03/01/15/41/peck-2108841_960_720.png')
''';

final insert3='''
  INSERT INTO encomenda(nome, cpf, pedido, telefone, url_avatar)
  VALUES('Manuela','112.567.528-43','500 Brigadeiros','(44)99870-1979','https://cdn.pixabay.com/photo/2021/02/05/22/52/brigadeiro-5986270_960_720.jpg')
''';
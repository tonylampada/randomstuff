O RDS já tem suport ao pg_repack, mas tem uns macetes pra conseguir usar.

# Ativando pg_repack no banco

Quando criar a extensão no banco (logado com o superusuario) precisa dar permissao no schema repack pra nao quebrar depois:

```sql
create extension pg_repack;
ALTER DEFAULT PRIVILEGES IN SCHEMA repack GRANT INSERT ON TABLES TO PUBLIC;
ALTER DEFAULT PRIVILEGES IN SCHEMA repack GRANT USAGE, SELECT ON SEQUENCES TO PUBLIC;
ALTER DEFAULT PRIVILEGES IN SCHEMA repack GRANT EXECUTE ON FUNCTIONS TO PUBLIC ;
ALTER DEFAULT PRIVILEGES IN SCHEMA repack GRANT ALL ON FUNCTIONS TO PUBLIC ;
```

# Baixando o client correto
O client onde vc vai rodar o pg_repack precisa ser da mesma versão que o RDS suporta. (nesse momento eh o 1.4.3 != versão mais nova 1.4.5)
Vc baixa esse pg_repack e dah um `make` e um `sudo make install`

# Tem que mudar o owner na hora de executar

O pg_repack tem que ser rodado com o usuario mestre do postgres que pode nao ser o owner do banco.
Nesse caso vc precisa trocar o dono da tabela pro usuario master (e dando permissao de leitura e escrita pro antigo dono, senao a aplicacao quebra)
Depois do repack vc devolve a tabela pro antigo dono. No meu caso fiz esse script pra ajudar.

**repack.sh**:
```bash
#!/bin/bash
tabela=$1

export PGHOST=blablabla.sa-east-1.rds.amazonaws.com
export PGDATABASE=seubanco
export PGUSER=usuariomestre
export PGPASSWORD=senhafodastica

# GRANT USAGE, SELECT ON ${tabela}_id_seq TO buser;
# tira isso se for rodar na tabela django_session

psql -c "
  begin;
    alter table $tabela owner to postgres;
    GRANT USAGE, SELECT ON ${tabela}_id_seq TO buser;
    GRANT SELECT, INSERT, DELETE, UPDATE ON TABLE $tabela TO buser;
  commit;
"
echo "agora a tabela $tabela pertence ao usuario postgres"
pg_repack-1.4.3/bin/pg_repack -k -t $tabela
echo "terminou o repack"
psql -c "alter table $tabela owner to buser;"
echo "agora a tabela $tabela pertence ao usuario buser"
echo "terminou"
```

Quando tiver um dump de uma tabela grande pra fazer, esquece o `pg_dump` pq vai estourar a memoria na hora de importar.
O que resolve é `copy to stdout` / `copy from stdin`

```bash
export PGHOST=host
export PGDATABASE=nomedobanco
export PGUSER=usuario
export PGPASSWORD=senha

# dump:
psql -c "copy tabela to stdout" | gzip > tabela.dump.gz

# restore (supondo que a tabela ja existe e tem as colunas criadas na mesma ordem de onde foi tirado o dump)
cat tabela.dump.gz | gunzip | psql -c "copy tabela from stdin"
```

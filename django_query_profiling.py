from django.db import connection
from django.db import reset_queries
from core.models import *

reset_queries()
connection.queries

GOGOGO()

len(connection.queries)

an = {}
for cq in connection.queries:
    d = an.setdefault(cq['sql'], {'count': 0, 'time': 0.0})
    d['count'] += 1
    d['time'] += float(cq['time'])

with open('queries.csv', 'w') as f:
    for k, v in an.items():
        f.write('%s;;;%s;;;%s\n' % (v['time'], v['count'], k))

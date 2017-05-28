#1536242 - Paolo Tamagnini

import numpy as np
import pandas as pd
print ' '
testi = []
sizes = []
totDoc = 1400
for i in range(1,totDoc + 1):
    txt = open(r'cranData\Cranfield_DATASET\cran\______'+str(i)+'.html','r')
    listofElements = txt.read().split()
    sizes.append(len(listofElements))
    testi = testi + listofElements
print'STATS ON CRAN DATA-SET'
print 'the number of documents is:'
print totDoc
print 'the average number of words in a document is:'
print np.mean(sizes)
listOfTags = ['<head>','</head>','<body>','</body>','<title>','.</title>']
c = 0
while c!=len(testi):
    if '<title>' in testi[c]:
        testi[c] = testi[c].replace('<title>','')  
    if testi[c] in listOfTags:
        del testi[c]
    else:
        c = c + 1
print 'the number of words in the data-set is:'
tot = len(testi)
print tot
print 'but the number of different words in the data-set is:'
totDif = len(set(testi))
print totDif
print 'this means that out of', tot,'the % of repeated words is:'
print (tot-totDif)/float(tot)*100,'%'
print ' '
pathQcranDF = r'cranData\Cranfield_DATASET\cran_all_queries.tsv'
QcranDF = pd.DataFrame.from_csv(pathQcranDF, sep='\t',index_col = False)
print 'the total number of queries for Cran is:'
print len(QcranDF)
print 'the average number of words in a query is:'
sizesQ = []
for x in QcranDF['Query_text']:
    sizesQ.append(len(x.split()))
print np.mean(sizesQ)
print ' '
print ' '
testi = []
sizes = []
totDoc = 423
for i in range(1,totDoc + 1):
    txt = open(r'timeData\Time_DATASET\time\______'+str(i)+'.html','r')
    listofElements = txt.read().split()
    sizes.append(len(listofElements))
    testi = testi + listofElements
print'STATS ON TIME DATA-SET'
print 'the number of documents is:'
print totDoc
print 'the average number of words in a document is:'
print np.mean(sizes)
listOfTags = ['<head>','</head>','<body>','</body>','<title>','.</title>']
c = 0
while c!=len(testi):
    if '<title>' in testi[c]:
        testi[c] = testi[c].replace('<title>','')  
    if testi[c] in listOfTags:
        del testi[c]
    else:
        c = c + 1
print 'the number of words in the data-set is:'
tot = len(testi)
print tot
print 'but the number of different words in the data-set is:'
totDif = len(set(testi))
print totDif
print 'this means that out of', tot,'the % of repeated words is:'
print (tot-totDif)/float(tot)*100,'%'
print ' '
pathQtimeDF = r'timeData\Time_DATASET\time_all_queries.tsv'
QtimeDF = pd.DataFrame.from_csv(pathQtimeDF, sep='\t',index_col = False)
print 'the total number of queries for Time is:'
print len(QtimeDF)
print 'the average number of words in a query is:'
sizesQ = []
for x in QtimeDF['Query_text']:
    sizesQ.append(len(x.split()))
print np.mean(sizesQ)
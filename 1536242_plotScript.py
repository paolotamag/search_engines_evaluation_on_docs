#1536242 - Paolo Tamagnini

import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import matplotlib.lines as mlines

stemNames = ['Def','Eng','EngNSW']
stemNamesFold = ['defStem','engStem','engNSWStem']
scorerNames = ['CountOcc', 'TfIdf', 'BM25']


#Cranfield data-set
print 'Importing Cranfield Data-set..'
pathTSVcran = []
for i in range(0,3):
    for j in range(0,3): 
        pathTSVcran.append(r'cranData' + "\\" + stemNamesFold[i] + "\\" +'results\cran' + stemNames[i] + r'_' + scorerNames[j]+r'.tsv')
		
listOfDFCran =[]
for i in pathTSVcran:
    listOfDFCran.append(pd.DataFrame.from_csv(i, sep='\t',index_col = False))

pathGTcran=r'cranData\Cranfield_DATASET\cran_Ground_Truth.tsv'
GTcranDF = pd.DataFrame.from_csv(pathGTcran, sep='\t',index_col = False)

def PatkCran(cranth):
    
    listOfPatK = []
    ks = [1, 3, 5, 10]
    for k in ks:  
        ScoreQuery = []
        for idQ in list(set(GTcranDF['Query_id'])):
            c = 0 
            for x in cranth.loc[cranth['Query_ID']==idQ]['Doc_ID'][0:k]: 
                listOfElectedDocs = list(GTcranDF.loc[GTcranDF['Query_id']==idQ]['Relevant_Doc_id'])
                lengthy = len(listOfElectedDocs)
                if x in listOfElectedDocs:
                    c = c + 1  
            denom = min([k,lengthy])
            ScoreQuery.append(c/float(denom))
        listOfPatK.append(np.mean(ScoreQuery))
    return listOfPatK

print 'Plotting Cranfield Data-set..'
	
k = [1, 3, 5, 10]

color = ['r', 'b', 'g', 'r', 'b', 'g', 'r', 'b', 'g']
linestylish = [ '-','-','-', '--','--','--', '-.','-.','-.']
for i in range(0,len(listOfDFCran)):
    print 'plotting P@k',pathTSVcran[i]
    plt.plot(k,PatkCran(listOfDFCran[i]),c=color[i], ls=linestylish[i])
    
handleso=[]
handleso.append(mpatches.Patch(color='red', label='Count occurrences'))
handleso.append(mpatches.Patch(color='blue', label='Tf/Idf'))
handleso.append(mpatches.Patch(color='green', label='BM25'))
handleso.append(mlines.Line2D([], [], color='black', ls='-', label='Default'))
handleso.append(mlines.Line2D([], [], color='black', ls='--', label='English'))
handleso.append(mlines.Line2D([], [], color='black', ls='-.', label='Eng. no Stopwords'))

plt.legend(handles=handleso,loc=2)

plt.show()

#Time data-set
print 'Importing Time Data-set..'

pathTSVtime = []
for i in range(0,3):
    for j in range(0,3): 
        pathTSVtime.append(r'timeData' + "\\" + stemNamesFold[i] + "\\" +'results\\time' + stemNames[i] + r'_' + scorerNames[j]+r'.tsv')
		
listOfDFTime =[]
for i in pathTSVtime:
    listOfDFTime.append(pd.DataFrame.from_csv(i, sep='\t',index_col = False))
	
pathGTtime=r'timeData\Time_DATASET\time_Ground_Truth.tsv'
GTtimeDF = pd.DataFrame.from_csv(pathGTtime, sep='\t',index_col = False)

def PatkTime(timeth):
    listOfPatK = []
    ks = [1, 3, 5, 10]
    for k in ks:
        ScoreQuery = []
        for idQ in list(set(GTtimeDF['Query_id'])):
            c = 0
            for x in timeth.loc[timeth['Query_ID']==idQ]['Doc_ID'][0:k]:
                listOfElectedDocs = list(GTtimeDF.loc[GTtimeDF['Query_id']==idQ]['Relevant_Doc_id'])
                lengthy = len(listOfElectedDocs)
                if x in listOfElectedDocs:
                    c = c + 1
            denom = min([k,lengthy])
            ScoreQuery.append(c/float(denom))
        listOfPatK.append(np.mean(ScoreQuery))
    return listOfPatK

print 'Plotting Time Data-set..'

k = [1, 3, 5, 10]

color = ['r', 'b', 'g', 'r', 'b', 'g', 'r', 'b', 'g']
linestylish = [ '-','-','-', '--','--','--', '-.','-.','-.']
for i in range(0,len(listOfDFTime)):
    print 'plotting P@k',pathTSVtime[i]
    plt.plot(k,PatkTime(listOfDFTime[i]),c=color[i], ls=linestylish[i])
    
handleso=[]
handleso.append(mpatches.Patch(color='red', label='Count occurrences'))
handleso.append(mpatches.Patch(color='blue', label='Tf/Idf'))
handleso.append(mpatches.Patch(color='green', label='BM25'))
handleso.append(mlines.Line2D([], [], color='black', ls='-', label='Default'))
handleso.append(mlines.Line2D([], [], color='black', ls='--', label='English'))
handleso.append(mlines.Line2D([], [], color='black', ls='-.', label='Eng. no Stopwords'))

plt.legend(handles=handleso,loc=2)

plt.show()

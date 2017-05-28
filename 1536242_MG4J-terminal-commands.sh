#1536242 - Paolo Tamagnini

source set-my-classpath.sh

# Cran Dataset Default Stemmer

mkdir cranData/defStem

mkdir cranData/defStem/index

find cranData/Cranfield_DATASET -iname \*.html | java it.unimi.di.big.mg4j.document.FileSetDocumentCollection -f HtmlDocumentFactory -p encoding=UTF-8 cranData/defStem/index/cranDef.collection

java it.unimi.di.big.mg4j.tool.IndexBuilder --downcase -S cranData/defStem/index/cranDef.collection cranData/defStem/index/cranDef

mkdir cranData/defStem/results

java homework.RunAllQueries_HW "cranData/defStem/index/cranDef" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "CountScorer" "1:2" cranData/defStem/results/cranDef_CountOcc.tsv

java homework.RunAllQueries_HW "cranData/defStem/index/cranDef" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "TfIdfScorer" "1:2" cranData/defStem/results/cranDef_TfIdf.tsv

java homework.RunAllQueries_HW "cranData/defStem/index/cranDef" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "BM25Scorer" "1:2" cranData/defStem/results/cranDef_BM25.tsv




# Cran Dataset English Stemmer

mkdir cranData/engStem

mkdir cranData/engStem/index

find cranData/Cranfield_DATASET -iname \*.html | java it.unimi.di.big.mg4j.document.FileSetDocumentCollection -f HtmlDocumentFactory -p encoding=UTF-8 cranData/engStem/index/cranEng.collection 

java it.unimi.di.big.mg4j.tool.IndexBuilder -t it.unimi.di.big.mg4j.index.snowball.EnglishStemmer -S cranData/engStem/index/cranEng.collection cranData/engStem/index/cranEng

mkdir cranData/engStem/results

java homework.RunAllQueries_HW "cranData/engStem/index/cranEng" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "CountScorer" "1:2" cranData/engStem/results/cranEng_CountOcc.tsv

java homework.RunAllQueries_HW "cranData/engStem/index/cranEng" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "TfIdfScorer" "1:2" cranData/engStem/results/cranEng_TfIdf.tsv

java homework.RunAllQueries_HW "cranData/engStem/index/cranEng" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "BM25Scorer" "1:2" cranData/engStem/results/cranEng_BM25.tsv




# Cran Dataset English Stemmer with no Stopwords

mkdir cranData/engNSWStem

mkdir cranData/engNSWStem/index

find cranData/Cranfield_DATASET -iname \*.html | java it.unimi.di.big.mg4j.document.FileSetDocumentCollection -f HtmlDocumentFactory -p encoding=UTF-8 cranData/engNSWStem/index/cranEngNSW.collection 

java it.unimi.di.big.mg4j.tool.IndexBuilder -t homework.EnglishStemmerStopwords -S cranData/engNSWStem/index/cranEngNSW.collection cranData/engNSWStem/index/cranEngNSW

mkdir cranData/engNSWStem/results

java homework.RunAllQueries_HW "cranData/engNSWStem/index/cranEngNSW" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "CountScorer" "1:2" cranData/engNSWStem/results/cranEngNSW_CountOcc.tsv

java homework.RunAllQueries_HW "cranData/engNSWStem/index/cranEngNSW" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "TfIdfScorer" "1:2" cranData/engNSWStem/results/cranEngNSW_TfIdf.tsv

java homework.RunAllQueries_HW "cranData/engNSWStem/index/cranEngNSW" /home/paolotamag/Desktop/HW1/cranData/Cranfield_DATASET/cran_all_queries.tsv "BM25Scorer" "1:2" cranData/engNSWStem/results/cranEngNSW_BM25.tsv





# Time Dataset Default Stemmer 

mkdir timeData/defStem

mkdir timeData/defStem/index

find timeData/Time_DATASET -iname \*.html | java it.unimi.di.big.mg4j.document.FileSetDocumentCollection -f HtmlDocumentFactory -p encoding=UTF-8 timeData/defStem/index/timeDef.collection 

java it.unimi.di.big.mg4j.tool.IndexBuilder --downcase -S timeData/defStem/index/timeDef.collection timeData/defStem/index/timeDef

mkdir timeData/defStem/results

java homework.RunAllQueries_HW "timeData/defStem/index/timeDef" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "CountScorer" "1:2" timeData/defStem/results/timeDef_CountOcc.tsv

java homework.RunAllQueries_HW "timeData/defStem/index/timeDef" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "TfIdfScorer" "1:2" timeData/defStem/results/timeDef_TfIdf.tsv

java homework.RunAllQueries_HW "timeData/defStem/index/timeDef" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "BM25Scorer" "1:2" timeData/defStem/results/timeDef_BM25.tsv




# Time Dataset English Stemmer

mkdir timeData/engStem

mkdir timeData/engStem/index

find timeData/Time_DATASET -iname \*.html | java it.unimi.di.big.mg4j.document.FileSetDocumentCollection -f HtmlDocumentFactory -p encoding=UTF-8 timeData/engStem/index/timeEng.collection 

java it.unimi.di.big.mg4j.tool.IndexBuilder -t it.unimi.di.big.mg4j.index.snowball.EnglishStemmer -S timeData/engStem/index/timeEng.collection timeData/engStem/index/timeEng

mkdir timeData/engStem/results

java homework.RunAllQueries_HW "timeData/engStem/index/timeEng" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "CountScorer" "1:2" timeData/engStem/results/timeEng_CountOcc.tsv

java homework.RunAllQueries_HW "timeData/engStem/index/timeEng" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "TfIdfScorer" "1:2" timeData/engStem/results/timeEng_TfIdf.tsv

java homework.RunAllQueries_HW "timeData/engStem/index/timeEng" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "BM25Scorer" "1:2" timeData/engStem/results/timeEng_BM25.tsv




# Time Dataset English Stemmer with no Stopwords

mkdir timeData/engNSWStem

mkdir timeData/engNSWStem/index

find timeData/Time_DATASET -iname \*.html | java it.unimi.di.big.mg4j.document.FileSetDocumentCollection -f HtmlDocumentFactory -p encoding=UTF-8 timeData/engNSWStem/index/timeEngNSW.collection 

java it.unimi.di.big.mg4j.tool.IndexBuilder -t homework.EnglishStemmerStopwords -S timeData/engNSWStem/index/timeEngNSW.collection timeData/engNSWStem/index/timeEngNSW

mkdir timeData/engNSWStem/results

java homework.RunAllQueries_HW "timeData/engNSWStem/index/timeEngNSW" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "CountScorer" "1:2" timeData/engNSWStem/results/timeEngNSW_CountOcc.tsv

java homework.RunAllQueries_HW "timeData/engNSWStem/index/timeEngNSW" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "TfIdfScorer" "1:2" timeData/engNSWStem/results/timeEngNSW_TfIdf.tsv

java homework.RunAllQueries_HW "timeData/engNSWStem/index/timeEngNSW" /home/paolotamag/Desktop/HW1/timeData/Time_DATASET/time_all_queries.tsv "BM25Scorer" "1:2" timeData/engNSWStem/results/timeEngNSW_BM25.tsv


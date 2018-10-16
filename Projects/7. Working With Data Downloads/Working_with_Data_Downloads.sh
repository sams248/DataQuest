#!/bin/bash

cd ~/dq

unzip crdc201314csv.zip

mkdir data 

mv CRDC2013_14.csv data
mv CRDC2013_14content.csv data
mv CRDC_documentation_csv.txt data
mv CRDC_usage_agreement.txt data

rm crdc201314csv.zip


virtualenv python3


source python3/bin/activate

pip install pandas

pip freeze


echo -e 'import sys\n\nif __name__ == "__main__":\n    print("Program executed successfully!")\n\nimport pandas as pd\ncontent= pd.read_csv("./data/CRDC2013_14content.csv", encoding="Latin-1")\nprint(content.head(3))' > read.py

python read.py

echo -e 'import sys\n\nif __name__ == "__main__":\n    print("Program executed successfully!")\n\nimport pandas as pd\ndata= pd.read_csv("./data/CRDC2013_14.csv", encoding="Latin-1")' > exploration.py


echo -e '\nprint(data["JJ"].value_counts())\nprint(data["SCH_STATUS_MAGNET"].value_counts())' >> exploration.py

echo -e '\nprint(pd.pivot_table(data,values=["TOT_ENR_M", "TOT_ENR_F"], index="JJ",aggfunc="sum"))' >> exploration.py

python exploration.py

touch findings.txt
echo -e "Interesting patterns!" > findings.txt

echo -e 'import sys\nimport pandas as pd\ndata = pd.read_csv("./data/CRDC2013_14.csv", encoding="Latin-1")\ndata["total_enrollment"] = data["TOT_ENR_M"] + data["TOT_ENR_F"]\n\nall_enrollment = data["total_enrollment"].sum()\n\nfor c in data.columns:\n    data[c] = pd.to_numeric(data[c], errors="coerce")\n    data[c] /= all_enrollment\n\nprint(data["total_enrollment"])' > enrollment.py


python enrollment.py

deactivate

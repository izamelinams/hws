
# coding: utf-8

# In[4]:

from pandas import DataFrame, read_csv 
import matplotlib.pyplot as plt
import pandas as pd
import sys
import matplotlib 


# In[5]:

print('Python version'+sys.version)
print('Pandas ver'+pd.__version__)
print('Matplotlib ver'+matplotlib.__version__)


# In[14]:

names=['Bob', 'Bab', 'Beb','Bib','Bub']
births=[90,55,82,23,45]
age=[11,22,33,44,55,66]
BabyDataSet=list(zip(names,births))
BabyDataset2=list(zip(names,age))


# In[16]:

BabyDataset2


# In[9]:

BabyDataSet


# In[50]:

df=pd.DataFrame(data=BabyDataSet,columns=['Names','Births'])


# In[51]:

df


# In[27]:

df.to_csv('birthsfile.csv', index=False, header=False)


# In[47]:

Location=r'/home/b107-06/Documentos/birthsfile.csv'


# In[48]:

df=pd.read_csv(Location)
df 


# In[53]:

df.dtypes
df.Births.dtype


# In[58]:

sorted=df.sort_values(['Births'],ascending= False)
sorted.head(1)
df['Births'].max()


# In[62]:

df['Births'].plot()
MaxValue=df['Births'].max()
MaxName=df['Names'][df['Births']==df['Births'].max()].values
Text=str(MaxValue)+ "_" +MaxName


# In[72]:

plt.annotate(Text,xy=(1,MaxValue), xytext=(8,0),xycoords=('axes fraction', 'data'),textcoords ='off set points')


# In[65]:

print("The most popular name")


# In[73]:

df[df['Births']==df['Births'].max()]


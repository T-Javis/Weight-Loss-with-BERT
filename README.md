# **Weight Loss with BERT**

**Weight Loss with BERT**

### **Origin**
In order to slove the data-imbalanced or long-tail problem by using bert in the classification task, a method is being used which is called weight loss.

### **Method**
In the classification task, the classification data with a large amount of data is multiplied by a larger value after the loss value is calculated and the less quantity is multiplied by a smaller value.
The  is called weigth. Once the data with a large amount of data is classified incorrectly, there will be a greater penalty. When updating parameters, there will be a greater update. For the classification with less data, the penalty is small, also the update is small.
Use this method to balance the problem of data-imbalanced or long-tail. 

### **Model**
The model design is a multi classification model. For example, there are 10 classifications. The result is that it is divided into one of them, which is different from multi label classification

### **Test**
Built a simple experiment of 12 categories without sufficient training. 
If fully trained, the result will be better

### **Data prepare**
Please read the data file
Text in front, label in back

### **Train the model**
Please read the train.sh file

### **Problem**
If there is no data-imbalanced or long-tail problem in the data, using the weight loss method will lead to large data fluctuation and low accuracy. You can calculate F1 by yourself to see if there is any improvement.
However, this is just corresponding to the results of the paper **Dice Loss for Data-imbalanced NLP Tasks(ACL 2020)**. Dice loss is used in the paper, the accuracy is reduced, and F1 should be increased, because the main consideration is the balance between classifications, not all data. 

### **Create your own model**
The class need to be modified.  
class weightlosstextprocessor (dataprocessor)

And the other functions that need to be modified like read your own data, do some operations, etc  

Training, validation, prediction
def get_ train_ examples(self, data_dir)  
def get_ dev_ examples(self, data_dir)  
def get_ test_ examples(self, data_dir) 

The type number of label in the data needs to correspond to the function below.
def get_ labels(self)  
For example, return ['1 ',' 2 '] or return ['1', '2', '3']
Or start with other numbers return ['15', '16', '17', '18', '19']

### **Rebuild**
This model is built for Chinese. If you want to rebuild the model for English, you should download the BERT for English, use the English data and modify the function WeightLossTextProcessor(DataProcessor) in the run_classifier_weighted_loss.py

####  **Feel free to contact me or leave message if there’s any questions.**  

### **缘起**
为了解决bert在分类领域中，数据偏斜的问题(data-imbalanced or long-tail)，使用了weight loss的思想

### **主要思想**
在分类任务中，对数据量较多的分类数据，在loss值计算后，乘以一个较大的数值；对于数据量较少的分类loss，乘以较小的数值，这个数值称为weight(权重)  
此时，对于数据量较多的数据一旦分类错误，产生了较大的惩罚，更新参数时，会有更大的更新；数据量较少的分类，惩罚较小，一旦分类错误，更新较小  
用这种思想去平衡数据偏斜问题

### **模型**
模型设计的是多分类模型，例如有10个分类，结果是被分到其中一个分类，区别于多标签分类

### **效果**
做了12分类的简单试验，没有充分的训练，就是简单的看了一下效果  
如果充分训练，效果会更好

### **数据准备**
参考data文件
前面是文本，后面是label

### **如何训练**
参考train.sh

### **问题**
如果数据不存在偏斜问题，使用weight loss 这种方法，反而会导致数据波动较大，准确率降低, 可以自行计算一下f1, 看是否有提升
但是这正好和论文 **Dice Loss for Data-imbalanced NLP Tasks(ACL 2020)** 的结果相应，论文中使用了Dice loss, 准确率降低了, f1应该升高了, 因为主要考虑的是分类之间平衡的问题, 而不是所有数据

### **简单测试 Simple test**
|weight|result|||
|---|:---:|:---:|:---:|
|True |eval_accuracy = 0.9076735|eval_loss = 0.2973084||
|False|eval_accuracy = 0.9569958|eval_loss = 0.1600242||

### **测试图 Test_graph**
请参考 test_graph.png

### **创建自己的模型**
需要修改 class WeightLossTextProcessor(DataProcessor) 中相关function  
读取自己的数据, 进行一些操作等

训练、测试（validation）、预测（predict）  
def get_train_examples(self, data_dir)  
def get_dev_examples(self, data_dir)  
def get_test_examples(self, data_dir)  

数据中label的种类数字需要和这个相对应  
def get_labels(self)  
例如 return ['1', '2'] 或 return ['1','2','3']  
或者从其他数字开始 return ['15','16','17','18','19']



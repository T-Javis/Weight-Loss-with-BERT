export DATA_DIR='./data'   #the data used
export BERT_BASE_DIR='./chinese_L-12_H-768_A-12'  #the bert model
python run_classifier_weighted_loss.py \
    --task_name=weightedloss \
    --do_train=true \
    --do_eval=true \
    --data_dir=$DATA_DIR/ \
    --vocab_file=$BERT_BASE_DIR/vocab.txt \
    --bert_config_file=$BERT_BASE_DIR/bert_config.json \
    --init_checkpoint=$BERT_BASE_DIR/bert_model.ckpt \
    --max_seq_length=300 \
    --train_batch_size=20 \
    --learning_rate=2e-5 \
    --num_train_epochs=1.0 \
    --output_dir='./output'\  #the trained model and the results
    --weighted_loss=true \   #chose use the weighted loss model or the normal model





export DATA_DIR='./data'   #the data used
export BERT_BASE_DIR='./chinese_L-12_H-768_A-12'  #the bert model
python run_classifier_weighted_loss.py \
  --task_name=weightedloss \
  --do_predict=true \
  --data_dir=$DATA_DIR/ \
  --vocab_file=$BERT_BASE_DIR/vocab.txt \
  --bert_config_file=$BERT_BASE_DIR/bert_config.json \
  --init_checkpoint='./output' \  #the fine tuning model, load the model 
  --max_seq_length=300 \
  --output_dir='./output2'\  #the do_predict result


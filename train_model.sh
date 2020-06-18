#########################################################################
# File Name: train_model.sh
# Author: yangcheng
# Mail: yangcheng.iron@bytedance.com
# Created Time: Thu 18 Jun 2020 10:07:41 AM CST
#########################################################################
#!/bin/bash
CUDA_VISIBLE_DEVICES=0 python3 train.py \
    --train_data data_lmdb_release/training \
    --valid_data data_lmdb_release/validation \
    --select_data MJ-ST \
    --batch_ratio 0.5-0.5 \
    --Transformation None \
    --FeatureExtraction VGG \
    --SequenceModeling BiLSTM \
    --Prediction CTC

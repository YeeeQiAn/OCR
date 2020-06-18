#########################################################################
# File Name: test_model.sh
# Author: yangcheng
# Mail: yangcheng.iron@bytedance.com
# Created Time: Thu 18 Jun 2020 10:09:29 AM CST
#########################################################################
#!/bin/bash
CUDA_VISIBLE_DEVICES=0 python3 test.py \
    --eval_data data_lmdb_release/evaluation \
    --benchmark_all_eval \
    --Transformation TPS \
    --FeatureExtraction ResNet \
    --SequenceModeling BiLSTM \
    --Prediction Attn \
    --saved_model saved_models/TPS-ResNet-BiLSTM-Attn-Seed1111/best_accuracy.pth

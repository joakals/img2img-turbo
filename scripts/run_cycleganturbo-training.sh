#!/bin/bash

export NCCL_P2P_DISABLE=1

accelerate launch --main_process_port 29501 --config_file accelerate_configs/config_8gpu_12GB.sh \
    src/train_cyclegan_turbo.py \
    --pretrained_model_name_or_path="stabilityai/sd-turbo" \
    --output_dir="output/cyclegan_turbo/my_horse2zebra" \
    --dataset_folder "data/my_horse2zebra" \
    --train_img_prep "resize_286_randomcrop_128x128_hflip" --val_img_prep "no_resize" \
    --learning_rate="1e-5" --max_train_steps=25000 \
    --train_batch_size=1 --gradient_accumulation_steps=1 \
    --report_to "wandb" --tracker_project_name "gparmar_unpaired_h2z_cycle_debug_v3" \
    --enable_xformers_memory_efficient_attention --validation_steps 250 \
    --lambda_gan 0.5 --lambda_idt 1 --lambda_cycle 1

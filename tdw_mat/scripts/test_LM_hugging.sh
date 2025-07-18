lm_id=TinyLlama/TinyLlama-1.1B-Chat-v1.0
port=10010

# 포트 점유 중인 프로세스 종료
kill -9 $(lsof -t -i :$port)

# 실행
python3 tdw-gym/challenge.py \
--output_dir results \
--lm_id $lm_id \
--source hf \
--experiment_name LM-TinyLlama \
--run_id run_1 \
--port $port \
--agents lm_agent \
--prompt_template_path LLM/prompt_single.csv \
--max_tokens 256 \
--cot \
--t 0.7 \
--data_prefix dataset/dataset_test/ \
--eval_episodes 0 11 17 18 1 2 3 21 22 23 4 5 6 7 8 9 10 12 13 14 15 16 19 20 \
--screen_size 512

# 종료
kill -9 $(lsof -t -i :$port)
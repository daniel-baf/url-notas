rm -rf ../2-react-app/modelo_tfjs modelo-clase-tec-emergentes.h5

python3 1.trainer.py

tensorflowjs_converter --input_format keras modelo-clase-tec-emergentes.h5 ./modelo_tfjs

mv ./modelo_tfjs ../2-react-app/ia-chat/assets

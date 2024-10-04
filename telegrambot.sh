!#/bin/bash
TELEGRAM_BOT_TOKEN=$(grep 'TELEGRAM_BOT_TOKEN' .env | awk -F "=" '{print$2}')
TELEGRAM_USER_ID=$(grep 'TELEGRAM_ID' .env | awk -F "=" '{print$2}')

TIME="10"

URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT="Deploy status: +$CI_JOB_STATUS%0A%0AProject:+$CI_PROJECT_NAME%0AStage:+$CI_JOB_STAGE%0AURL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0ABranch:+$CI_COMMIT_REF_SLUG"

curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT" $URL > /dev/null

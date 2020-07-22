:global svr01down false
:global svr02down false
:global adc01down false
:global adc02down false
:global rdp01down false
:global ispDown false
:global ispDownTime " "

:global chatId {YourChatID}
:global BotToken {YourToken}

:delay 30s
/tool fetch url="https://api.telegram.org/bot$BotToken/sendMessage?chat_id=$chatId&text=Turned on" keep-result=no
/system script run ServersState

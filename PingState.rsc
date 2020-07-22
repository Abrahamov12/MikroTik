:global LomoMikrotikBotToken
:global chatId

:global svr01down
:global svr02down
:global adc01down
:global adc02down
:global rdp01down

:local sendmsg false

:local svr01check [/ping svr01.lomo.home count=1]
:local svr02check [/ping svr02.lomo.home count=1]
:local adc01check [/ping adc01.lomo.home count=1]
:local adc02check [/ping adc02.lomo.home count=1]
:local rdp01check [/ping rdp01.lomo.home count=1]

:local svr01checkmsg "ok"
:local svr02checkmsg "ok"
:local adc01checkmsg "ok"
:local adc02checkmsg "ok"
:local rdp01checkmsg "ok"
 
:if (svr01check = 0) do={
	:if ($svr01down != true) do={
	:set svr01checkmsg "nok"
	:set $svr01down true
	:set $sendmsg true
		}
	} else={
		:if ($svr01down = true) do={
		:set svr01checkmsg "ok"
		:set $svr01down false
		:set $sendmsg true
		}
	}

:if (svr02check = 0) do={
	:if ($svr02down != true) do={
	:set svr02checkmsg "nok"
	:set $svr02down true
	:set $sendmsg true
		}
	} else={
		:if ($svr02down = true) do={
		:set svr02checkmsg "ok"
		:set $svr02down false
		:set $sendmsg true
		}
	}

:if (adc01check = 0) do={
	:if ($adc01down != true) do={
	:set adc01checkmsg "nok"
	:set $adc01down true
	:set $sendmsg true
		}
	} else={
		:if ($adc01down = true) do={
		:set adc01checkmsg "ok"
		:set $adc01down false
		:set $sendmsg true
		}
	}

:if (adc02check = 0) do={
	:if ($adc02down != true) do={
	:set adc02checkmsg "nok"
	:set $adc02down true
	:set $sendmsg true
		}
	} else={
		:if ($adc02down = true) do={
		:set adc02checkmsg "ok"
		:set $adc02down false
		:set $sendmsg true
		}
	}

:if (rdp01check = 0) do={
	:if ($rdp01down != true) do={
	:set rdp01checkmsg "nok"
	:set $rdp01down true
	:set $sendmsg true
		}
	} else={
		:if ($rdp01down = true) do={
		:set rdp01checkmsg "ok"
		:set $rdp01down false
		:set $sendmsg true
		}
	}
:if ($sendmsg = true) do={
	:local msg "svr01\_\_$svr01checkmsg%0A\
	svr02\_\_$svr02checkmsg%0A\
	adc01\_$adc01checkmsg%0A\
	adc02\_$adc02checkmsg%0A\
	rdp01\_$rdp01checkmsg"
	/tool fetch url="https://api.telegram.org/bot$LomoMikrotikBotToken/sendMessage?chat_id=$chatId&text=$msg" keep-result=no
}

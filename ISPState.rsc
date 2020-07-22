:global ispDown
:global ispDownTime
:global BotToken
:global chatId

:local sendmsg false
:local dnscheck [/ping 8.8.8.8 count=2]

:if (dnscheck = 0) do={
	:if ($ispDown != true) do={
		:set $ispDown true
		:local DownDate [/system clock get date]
		:local DownTime [/system clock get time]
		:set ispDownTime "$DownTime $DownDate"
	}
} else={
	:if ($ispDown = true) do={
	:set $ispDown false
	:set $sendmsg true
	}
}


:if ($sendmsg = true && $ispDownTime != " ") do={
	:local msg "Been offline since $ispDownTime"
    :set $ispDownTime " "
	/tool fetch url="https://api.telegram.org/bot$BotToken/sendMessage?chat_id=$chatId&text=$msg" keep-result=no
}

:global BotToken
:global chatId
:global vpnDown

:local sendmsg false
:local vpnCheck [/ping 192.168.10.1 count=1]
:local vpnCheckMsg "ok"

:if ($vpnCheck = 0) do={
	:if ($vpnDown != true) do={
	:set $vpnCheckMsg "nok"
	:set $vpnDown true
	:set $sendmsg true
		}
	} else={
		:if ($vpnDown = true) do={
		:set $vpnCheckMsg "ok"
		:set $vpnDown false
		:set $sendmsg true
		}
	}

:if ($sendmsg = true) do={
	:local msg "VPN $vpnCheckMsg"
	/tool fetch url="https://api.telegram.org/bot$BotToken/sendMessage?chat_id=$chatId&text=$msg" keep-result=no
}

	menu(){

	echo "========================"
	echo "1-ping IP"
	echo "2-trace route"
	echo "3-set ip"
	echo "4-set subnet"
	echo "5-set gateway"
	echo "6-set new interface"
	echo "7-exit"
	echo "========================="
	echo "choose item:"
	read inp
	}
	menu
while (( $inp!="7" ))
do
	if(($inp=="1"))
	then
		echo "please enter your ip, that you want to ping:"
        	read ip
        	ping -c 4 $ip
        	sleep 5
        	menu
	elif(($inp=="2"))
	then
        	echo "please enter your destination ip address, that you want to trace:"
		read ip
		traceroute -n $ip
        	sleep 5
        	menu
	elif(($inp=="3"))
	then
		ifconfig
		echo "please enter name of network interface:"
                read interfacename
		echo "please enter ip"
		read ip
                sudo ifconfig $interfacename up $ip
		ifconfig
                sleep 7
                menu

	elif(($inp=="4"))
	then
		echo "please enter name of network interface:"
        	read interfacename
		echo "please enter subnet:"
		read subnet
        	sudo ifconfig $interfacename up netmask $subnet
		ifconfig
        	sleep 7
        	menu 
	elif(($inp=="5"))
	then
		echo "please enter gateway address:"
        	read gateway
        	sudo route add default gw $gateway
        	sleep 5
        	menu
	elif(($inp=="5"))
        then
                echo "please enter name of your new interface:"
                read interface
                
                sleep 5
                menu

	fi
done

#!/usr/bin/awk -f
# Linux users have to change $8 to $9
BEGIN 	{ 
	sentBytes=0
	recvBytes=0
	startTime=0
	endTime=0
}
{
	event = $1
	timeStamp = $2
	packetSize = $6
	packetType = $5
	sender = $3
	receiver = $4
	#printf("timestamp=%f\n",$timeStamp)
	if (event == "r" && packetType=="tcp")
	{
		sentBytes += packetSize
		printf("%.3f %.3f\n",timeStamp,sentBytes/(timeStamp-startTime)/1024)
	}
	if (sender == 2)
	{
		recvBytes += packetSize
	}

}
END   	{ 
	#printf("sent = %d, received = %d, in time\n",sentBytes,recvBytes) 
}

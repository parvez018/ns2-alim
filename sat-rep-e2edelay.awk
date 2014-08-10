#!/usr/bin/awk -f
# Linux users have to change $8 to $9
BEGIN 	{ 
	source=1
	destination=2
	total_time=0
	total_packet=0
	s=size
}
{
	event = $1
	time_stamp = $2
	packet_size = $6
	packet_type = $5
	sender = $3
	receiver = $4
	seq_num = $11
	packet_id = $12
	#printf("timestamp=%f\n",$timeStamp)
	if (event == "+" && sender == source && receiver == destination)
	{
		arr_time[packet_id] = time_stamp
	}
	if (event == "r" && sender == source && receiver == destination)
	{
		total_packet++
		delay=time_stamp - arr_time[packet_id]
		total_time +=delay
	}

}
END   	{ 
	printf("%d %f\n",s,(total_time/total_packet)) 
}

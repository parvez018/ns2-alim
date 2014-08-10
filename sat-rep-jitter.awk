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
		delay_record[delay] = delay_record[delay] + 1
		#printf("%d %f\n",packet_id,delay)
	}
	#delay_record[5.3]=10

}
END   	{ 

	for ( d in delay_record ) {
		printf("%f %f\n",d,delay_record[d])
	}


}

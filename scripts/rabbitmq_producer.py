import pika, sys
credentials = pika.PlainCredentials("guest", "guest")
conn_params = pika.ConnectionParameters("192.168.2.2",
                                        credentials = credentials)
conn_broker = pika.BlockingConnection(conn_params) 
channel = conn_broker.channel() 
channel.exchange_declare(exchange="hello-exchange", 
                         type="direct",
                         passive=False,
                         durable=True,
                         auto_delete=False)

if (len(sys.argv) > 1):
	msg = sys.argv[1]
	msg_props = pika.BasicProperties()
	msg_props.content_type = "text/plain" 
	channel.basic_publish(body=msg,
	exchange="hello-exchange",
	properties=msg_props,
	routing_key="hola")

else:	
	start_int = 1
	end_int = 31

	while (start_int < end_int):						 
		#msg = sys.argv[1]
		msg = str(start_int)
		msg_props = pika.BasicProperties()
		msg_props.content_type = "text/plain" 
		channel.basic_publish(body=msg,
		exchange="hello-exchange",
		properties=msg_props,
		routing_key="hola")
		start_int = start_int + 1
#!/usr/bin/env ruby
# -*- coding: utf-8 -*-


class ConnectionMqtt
  def initialize
    @mqtthost = "test.mosquitto.org"
    @username = "example@github"
    @password = "<password>"
    @portNum = 1883
    # MQTTに接続するためのクライアントを作成します
    @client = MQTT::Client.new(
      :host => @mqtthost,
      :port => @portNum,
      # :username => USERNAME,
      # :password => PASSWORD
    )
  end

  def publish_message(topic, json_data)
    # 接続します Pbulish example
    @client.connect do |c|
      # Publishします
      result=c.publish(topic, json_data)
      # print result
    end
  end


  def subscribe_message_loop(topic,obj)
    # 接続します Subscribe example
    @client.connect do |c|
      # Subscribeします
      c.get(topic) do |topic, message|
        obj.callback(topic,message)
      end
    end
  end

end

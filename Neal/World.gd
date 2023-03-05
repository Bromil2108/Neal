extends Node2D

var coins_value = 0

func listen_for_coins():
	var coins = get_tree().get_nodes_in_group("coin")
	for coin in coins:
		coin.connect("on_collect", self, "on_coin_collected")

func on_coin_collected(value):
	coins_value  += value 

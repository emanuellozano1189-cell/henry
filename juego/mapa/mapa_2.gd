
extends Node2D

@export var escena_enemigo: PackedScene

@export var tiempo_minimo: float = 1.0
@export var tiempo_maximo: float = 3.0

@export var max_enemigos: int = 10

@export var margen: float = 50.0

var cantidad_enemigos: int = 0

func _ready():
	randomize()
	generar_enemigos()

func generar_enemigos():
	while true:
		var tiempo = randf_range(tiempo_minimo, tiempo_maximo)
		await get_tree().create_timer(tiempo).timeout

		if cantidad_enemigos < max_enemigos:
			crear_enemigo()

func crear_enemigo():
	if escena_enemigo == null:
		return

	var enemigo = escena_enemigo.instantiate()

	var ancho = get_viewport_rect().size.x
	var alto = get_viewport_rect().size.y

	var posicion_x = randf_range(margen, ancho - margen)
	var posicion_y = randf_range(margen, alto - margen)

	enemigo.position = Vector2(posicion_x, posicion_y)

	get_parent().add_child(enemigo)

	cantidad_enemigos += 100

	enemigo.tree_exited.connect(
		func():
			cantidad_enemigos -= 100
	)

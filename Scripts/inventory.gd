extends Control

var selected = Color(1, 1, 1)
var unselected = Color(1, 1, 1, 0.25)

signal pause

func _ready():
	$inv1.color = unselected
	$inv2.color = unselected
	$inv3.color = unselected

func _process(delta):
	$Bars/Health/Bar.size.x = Global.health*4.5
	$Bars/Vedla/Bar.size.y = Global.KimuCapacity*2
	$Viin/ViinCount.text = "[center]" + str(Global.ViinPickup) + "[/center]"

func _unhandled_input(event):
	if event is InputEventKey && Global.KubikPickup == false:
		$inv1/kubik.visible = false
		
	if event is InputEventKey && event.pressed:
		
		if event.keycode==49:
			Global.currentslot = 1
			$inv1.color = selected
			$inv2.color = unselected
			$inv3.color = unselected
			
		elif event.keycode==50:
			Global.currentslot = 2
			$inv2.color = selected
			$inv1.color = unselected
			$inv3.color = unselected
			
		elif event.keycode==51:
			Global.currentslot = 3 
			$inv3.color = selected
			$inv1.color = unselected
			$inv2.color = unselected
			
		elif event.keycode==32:
			$inv1.color = unselected
			$inv2.color = unselected
			$inv3.color = unselected
			
		elif event.keycode==4194305 && event.pressed:
			emit_signal("pause")
	else:
		pass

func _on_interact_ray_kubikinteract():
	$inv1/kubik.visible = true
	
func _on_interact_ray_knife():
	$inv2/nuga.visible = true
	
func _on_interact_ray_syringe():
	$inv3/syringe.visible = true



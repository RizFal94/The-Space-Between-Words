extends Control

@onready var Healthbar1 = $ProgressBar1
@onready var Healthbar2 = $ProgressBar2

var health_bar_visible: bool = false  # Health bar disembunyikan di awal
var no_damage_timer: Timer  # Timer untuk mendeteksi 10 detik tanpa damage

func _ready():
	Healthbar1.visible = health_bar_visible
	Healthbar2.visible = health_bar_visible
	
	no_damage_timer = Timer.new()  # Membuat instance timer
	add_child(no_damage_timer)  # Menambahkan timer ke node
	no_damage_timer.wait_time = 7.0  # Set timer untuk 10 detik
	no_damage_timer.one_shot = true  # Timer hanya sekali
	no_damage_timer.timeout.connect(_on_no_damage_timeout)  # Menghubungkan sinyal timeout dengan fungsi
	no_damage_timer.start()  # Memulai timer

func change_health(newValue):
	var oldValue = Healthbar2.value
	var styleBox : StyleBox = Healthbar1.get_theme_stylebox("fill")
	
	if newValue > 0:
		Healthbar1.value = oldValue + newValue
		styleBox.bg_color = Color("1a349b")  # Warna biru untuk peningkatan health
		_catch_up_health(Healthbar2, newValue)
		_reset_no_damage_timer()  # Reset timer jika terkena damage
	elif newValue < 0:
		Healthbar2.value = oldValue + newValue
		styleBox.bg_color = Color("ca0020")  # Warna merah untuk penurunan health
		_catch_up_health(Healthbar1, newValue)
		_reset_no_damage_timer()  # Reset timer jika terkena damage
		
	Healthbar1.add_theme_stylebox_override("fill", styleBox)
	
# Fungsi ini sekarang cukup memperbarui HealthBar dengan delay untuk memberikan efek visual
func _catch_up_health(HealthBar, changeValue):
	var steps = abs(changeValue)
	var target_value = HealthBar.value + changeValue
	
	# Tunda untuk memberikan efek visual
	for i in range(steps):
		await get_tree().create_timer(0.05).timeout
		if changeValue < 0:
			HealthBar.value -= 1
		elif changeValue > 0:
			HealthBar.value += 1

	# Pastikan value benar-benar mencapai target_value
	HealthBar.value = target_value

# Fungsi ini akan dipanggil saat player tidak terkena damage selama 10 detik
func _on_no_damage_timeout():
	if health_bar_visible:
		Healthbar1.visible = false
		Healthbar2.visible = false
		health_bar_visible = false

# Fungsi untuk mereset timer jika player terkena damage
func _reset_no_damage_timer():
	if !health_bar_visible:
		Healthbar1.visible = true
		Healthbar2.visible = true
		health_bar_visible = true
	no_damage_timer.start()

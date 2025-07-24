# mpu6050_sample.rb  —  mruby/c quick demo
# ------------------------------------------------------------
# 必要ライブラリ:  i2c, mpu6050
# セットアップ例 :
#   $ ruby mlt.rb install mpu6050     # ライブラリ取得
#   $ ruby mlt.rb sample  mpu6050     # このファイルを取得
# ------------------------------------------------------------

require "i2c"        # 通信ドライバ (dependency)
require "mpu6050"    # デバイスライブラリ

puts "Initializing MPU6050..."

# 初期化 (I2C アドレス 0x68)
if MPU6050.init(0x68) == 0
  puts "MPU6050 found!"
else
  puts "MPU6050 not found!"
  System.halt
end

loop do
  ax, ay, az = MPU6050.read_accel      # 加速度 [g]
  gx, gy, gz = MPU6050.read_gyro       # 角速度 [deg/s]
  puts "ACC: #{ax}, #{ay}, #{az} | GYRO: #{gx}, #{gy}, #{gz}"
  sleep 1000                           # 1000 ms = 1 s
end

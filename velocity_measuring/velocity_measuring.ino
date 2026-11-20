#include "BluetoothSerial.h"

#if !defined(CONFIG_BT_ENABLED) || !defined(CONFIG_BLUEDROID_ENABLED)
#error Bluetooth is not enabled! Please run `make menuconfig` to and enable it
#endif

BluetoothSerial SerialBT;

float wheel_radius = 0.6096 / 2; // m
float dist_per_spin;             // m
float min_ms_between_peaks;      // ms
unsigned long last_peak;

float MAX_VEL_MPS = 100 / 3.6; // m/s

void print_value(char *str, float val, char *unit_str)
{
  Serial.print(str);
  Serial.print(val);
  Serial.println(unit_str);

  SerialBT.print(str);
  SerialBT.print(val);
  SerialBT.println(unit_str);
}

float calc_velocity_mps(float dt_ms)
{
  return dist_per_spin / (dt_ms / 1000);
}

int read_hall_sensor()
{
  return analogRead(T2);
}

void measure_velocity()
{
  int val = read_hall_sensor();
  if (val == 0)
  {
    unsigned long current_time = millis();
    int time_diff = current_time - last_peak;
    if (time_diff > min_ms_between_peaks)
    {
      float vel_mps = calc_velocity_mps(time_diff);
      print_value("Time since peak: ", time_diff, " ms");
      print_value("Velocity: ", vel_mps, " m/s");
      print_value("Velocity: ", vel_mps * 3.6, " km/h");
      Serial.println();
    }
    last_peak = current_time;
  }
}

void setup()
{
  // put your setup code here, to run once:
  Serial.begin(115200);
  SerialBT.begin("ESP32 velocity monitor"); // Bluetooth device name
  Serial.println("The device started, now you can pair it with bluetooth!");

  dist_per_spin = (wheel_radius * 2) * M_PI;
  min_ms_between_peaks = (dist_per_spin / (MAX_VEL_MPS)) * 1000;
  last_peak = millis();
}

void loop()
{
  // put your main code here, to run repeatedly:
  measure_velocity();
  delay(1);
}

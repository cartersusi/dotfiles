#! /bin/sh

SETTINGS=$1
PROFILE=$2

if [[ -f "$SETTINGS" ]]; then
  cp "$SETTINGS" $HOME/.nvidia-settings-rc
else
  echo "No conf provided..."
fi

if [[ -f "$PROFILE" ]]; then
  cp "$PROFILE" $HOME/.nv/nvidia-application-profiles-rc
else
  echo "No profile provided..."
fi


nvidia-settings --load-config-only
nvidia-settings -a '[gpu:0]/GPUGraphicsClockOffset[1]=100'
#nvidia-settings -a '[gpu:0]/GPUGraphicsMemoryOffset[1]=#1'
nvidia-settings -a '[gpu:0]/GPUMemoryTransferRateOffset[1]=300'
nvidia-settings -a GPUPowerMizerMode=1
nvidia-settings -a GPUFanControlState=1
nvidia-settings -a [fan:0]/GPUTargetFanSpeed=42
nvidia-settings -a [fan:1]/GPUTargetFanSpeed=42
nvidia-settings -a DigitalVibrance=496
nvidia-settings -a Dithering[DFP-0]=1
nvidia-settings -a DitheringMode[DFP-0]=3
nvidia-settings -a DitheringDepth[DFP-0]=2
nvidia-settings -a GPUPowerMizerMode=1
nvidia-settings -a SyncToVBlank=0
nvidia-settings -a AllowFlipping=1
nvidia-settings -a AllowFlipping=1
nvidia-settings -a AllowFlipping=1

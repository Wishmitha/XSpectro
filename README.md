# XSpectro
An audio visualizer using Processing. This visualizes audio from default audio input of the computer. So in default state it will visualize the audio input from the **microphone**. 

But alternatively default audio input of the computer can be changed to audio monitor. In that case this will visualize the **audio output** of your computer. (literally what you hear from your computer - currently playing song, youtube video etc.)

In a **Ubuntu** system, default audio input can be changed to audio monitor using 'PulseAudio Volume Control'

In a **Windows** system, default audio input can be changed to audio monitor by going through system settings (or Control Panel in older versions)

Looking foward to include switching between microphone and audio monitor to application itself :)

**Keyboard Controls :**

Use up, down arrows to adjust height of the spectrum bars. ( If the audio strength is low and movement of the spectrum is low, increasing the height will output a better spectrum with higher movemnt)

Pressing Spacebar switches the height to default value.

Press 'R' to resync if there is a syncinc delay between audio and the visualization

**Issues :**

1. Application has no control over default audio input ( User can change it from computer settings)
2. Syncing between audio and visualization can be decrased ( There could be a delay )
3. Resync only can be done few times during running time ( An audio input erroe occurs when resyncing is done continuously)

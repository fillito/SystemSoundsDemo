SystemSoundsDemo
================

This is just a demo of how to use iOS AudioServices API to play a system sound

In this demo you could test all the avaiable system sounds.


## How to use AudioServices in your application

- Add AudioToolbox framework to your proyect :

      Build Phases -> Link Binary With Libraries -> + -> AudioToolbox.framework
      
- Include AudioToolbox header in the controller wich will play the system sound

```objc
#include <AudioToolbox/AudioToolbox.h>
```

- Call AudioServicesPlaySystemSound function passing the soundID as a parameter

```objc
AudioServicesPlaySystemSound(1000);
```
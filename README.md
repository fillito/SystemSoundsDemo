SystemSoundsDemo
================

This is just a demo of how to use iOS AudioServices API to play a system sound

In this demo you could test all the avaiable system sounds.

<img src="https://raw.github.com/fillito/SystemSoundsDemo/master/screenshot.png" />

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


## License
Copyright 2012 [Daniel García](http://www.fillito.com) (ios@fillito.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
 limitations under the License. 

Attribution is not required, but appreciated.
There's my .irbrc in here which has some useful stuff:

 - better minimal prompt 
 - tab completion
 - saved history across irb sessions
 - `local_methods`: call on any object, like `methods` but only includes methods specific to that class, not all its superclass stuff
 - logging: call `log` to start it, it will dump to `irb.log` in cwd -- hack as needed, if you use the minimal prompt this file will actually be an executable ruby script of your session as-is

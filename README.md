# ruby-init
Ruby assignments and tasks during onboarding


Koans can be checked for completion by running the following command inside the 'koans' directory - - - 

	> ruby path_to_enlightenment.rb 

Greed game can be played by running the following command in the 'greed_problem' directory - - -
 
	> ruby game.rb

Rover can be played by running the following command in the 'rover_problem' directory - - -
 
	> ruby mars-rover.rb 

and then enter the input 
To check with the sample input - - - 

	> ruby mars-rover.rb < sample.input

To check the sinatra server for the key_server problem implementation, go to the directory and use the command 'rackup'

	>$./key_sever/$>   rackup



check the endpoints on the localhost:9292 


/keys/?num?  -> keys/10 - To generate a bunch of keys
/key/get     -> Gets an available Key
/key/release/?keyId?
/key/delete/?keyId?
/key/refresh/?keyId?

cleanup job runs as described every 60 seconds on a background thread

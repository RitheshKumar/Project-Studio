(
m = SimpleMIDIFile.read( "/Users/Rithesh/Documents/SuperCollider!/Gil/SweetChild.mid" );
m.midiEvents.dopostln;

x =m.generatePatternSeqs;
b = NetAddr.new( "127.0.0.1", 7771);    // send data to Max/MSP
)


(
t = Task({
   i = 0;
while{x[1][i].notNil; }
{

		// x[1][i][0].postln;
		if( x[1][i][0] == 35,
			{b.sendMsg( "0");
		    },

		   { if( x[1][i][0] == 4
			    {    b.sendMsg("1");
				},

			  ); }
		);

		(x[1][i][1]/2).wait;
	 i=i+1;
}

}).play;
)



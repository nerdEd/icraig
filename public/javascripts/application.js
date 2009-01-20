window.dhtmlHistory.create({
    toJSON: function(o) { return Object.toJSON(o); },
    fromJSON: function(s) { return s.evalJSON(); }
});

var pageListener = function( newLocation, historyData ) { eval( historyData ); };

window.onload = function() {
	
    dhtmlHistory.initialize();
   	dhtmlHistory.addListener( pageListener );
    dhtmlHistory.add( "home", "new Ajax.Request( '/', { asynchronous:false, evalScripts:true, method:'get' } );" );
}

function experimentalOnLoad()  {
	if ( window.location.hash.length < 1 ) {
        dhtmlHistory.initialize();
        dhtmlHistory.addListener( pageListener );
        dhtmlHistory.add( "home", "new Ajax.Request( '/', { asynchronous:false, evalScripts:true, method:'get' } );" );
    }
    else {
		initialiseStateFromURL();
	}
}

function initialiseStateFromURL() {
    var location = window.location.hash;
    hashlessLocation = location.replace( /#/, "" );
    window.location.href = window.location.href.replace( /#\//, "" );
}
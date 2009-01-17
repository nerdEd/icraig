window.dhtmlHistory.create({
    toJSON: function(o) {
        return Object.toJSON(o);

    },
    fromJSON: function(s) {
        return s.evalJSON();

    }

});

var pageListener = function(newLocation, historyData) {
    eval(historyData);

};

window.onload = function() {
    dhtmlHistory.initialize();
    dhtmlHistory.addListener(pageListener);
    dhtmlHistory.add( 'home', "new Ajax.Request('/', {asynchronous:false, evalScripts:true, method:'get'});")
}
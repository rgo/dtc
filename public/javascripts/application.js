// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


Event.onReady(function() {
    Event.addBehavior({
        'a.comparate': Remote.Link({
            onComplete: function(){
                //$('sound_bazinga_track_url')
                Sound.play('bazinga_sin_risas.mp3',{replace:true});                
            }
        })
    });
    Event.addBehavior.reassignAfterAjax = true;
});

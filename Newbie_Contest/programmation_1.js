// Newbie Contest - Challenge programmation 1 avec CasperJS

var casper = require('casper').create();
var number = "";
var url = "";
var password = "";

// Connexion au site
casper.start('https://www.newbiecontest.org', function() {
    casper.evaluate(function() {
	    document.querySelector('#user').setAttribute('value', 'kraken31');
	    document.querySelector('#passwrd').setAttribute('value', 'dejean');
	    document.querySelector('form').submit();
	});
});

// Récupération du nombre aléatoire
casper.thenOpen('https://www.newbiecontest.org/epreuves/prog/prog1.php', function() {
	if ( /.*: (\d*)/.test( this.getHTML() ) ) {
    	number = RegExp.$1;
    	
    	// Validation du nombre récupéré
    	url = 'https://www.newbiecontest.org/epreuves/prog/verifpr1.php?solution=' + number;
    	casper.open(url).then( function() {
    	
    		// Récupération du mot de passe
			if ( /.*: (\S*)/.test( this.fetchText('body') ) ) {
		    	password = RegExp.$1;
				this.echo("password="+password);
			}
    	});
    }
});

casper.run();


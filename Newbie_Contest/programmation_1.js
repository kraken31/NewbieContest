// Newbie Contest - Challenge programmation 1 avec CasperJS

var casper = require('casper').create();

var usernb = casper.cli.get(0); 
var passnb = casper.cli.get(1);

var number = "";
var url = "";
var password = "";

// Connexion au site
casper.start('https://www.newbiecontest.org', function() {
    casper.evaluate(function(user, pass) {
	    document.querySelector('#user').setAttribute('value', user);
	    document.querySelector('#passwrd').setAttribute('value', pass);
	    document.querySelector('form').submit();
	}, usernb, passnb);
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

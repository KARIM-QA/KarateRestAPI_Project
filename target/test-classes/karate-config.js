function fn() {
	var env = karate.env; // get system property 'karate.env' karate.log('karate.env system property was:', env); 
	if (!env) {
		// default to preprod if not specified
		env = 'preprod';
	}

	var config = {
		env: env,
		baseUrl: 'http://localhost:3000',

	}

	if (env == 'preprod') {
		// customize baseUrl based on preprod environment implemented in your company
		config.baseUrl = 'http://localhost:3000';

	}
	else if (env == 'prod') {
		// customize baseUrl based on prod environment implemented in your company
		config.baseUrl = 'http://localhost:3000';
	}
	else if (env == 'recette') {
		// customize baseUrl based on recette environment implemented in your company
		config.baseUrl = 'http://localhost:3000';
	}
	return config;
}
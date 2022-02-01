startup
{
	vars.isLoading = false;
	vars.waitingForOmega = false;
	vars.waitingForNonOmega = false;

	vars.fullOmega = 0;
}

update
{
	vars.fullOmega = features["omega"].current + features["omega2"].current + features["omega3"].current;

	if( vars.waitingForNonOmega && (vars.fullOmega < 1.0)) {
		vars.waitingForNonOmega = false;
		vars.isLoading = false;
	}

	if( vars.waitingForOmega && (vars.fullOmega > 10.0)) {
		vars.waitingForOmega = false;
		vars.waitingForNonOmega = true;	
	}

	if( features["skip"].current > 10.0 ) {
		vars.isLoading = true;
		vars.waitingForOmega = true;
		vars.waitingForNonOmega = false;
	}
	
		

	

}

isLoading
{
	return vars.isLoading;
}
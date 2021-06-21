init
{
    // reduces CPU usage by halfing the amount of frames per secound... maybe
    var refreshRate = 30;
}

isLoading
{
	return features["isLoading"].current > 15.0;
}
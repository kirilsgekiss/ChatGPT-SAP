sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'ns/beer/test/integration/FirstJourney',
		'ns/beer/test/integration/pages/BeerList',
		'ns/beer/test/integration/pages/BeerObjectPage'
    ],
    function(JourneyRunner, opaJourney, BeerList, BeerObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('ns/beer') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBeerList: BeerList,
					onTheBeerObjectPage: BeerObjectPage
                }
            },
            opaJourney.run
        );
    }
);
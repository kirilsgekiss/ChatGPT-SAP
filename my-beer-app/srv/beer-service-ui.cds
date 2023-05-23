using {BeerService as my} from './beer-service';

annotate my.Beer with {
    ID @(
		UI.Hidden,
		Common: {
		Text: name
	    }
	);
	name        @title: 'Beer name';
	rating      @title: 'Beer rating';
	beerType    @title: 'Beer type';
	brewery     @title: 'Brewery';
}

annotate my.BeerType with {
    ID @(
		  UI.Hidden,
		  Common: {
		  Text: name
	      }
	  );
    name        @title: 'Beer type name';
}

annotate my.Brewery with {
    ID @(
		  UI.Hidden,
		  Common: {
		  Text: name
	      }
	  );
    name                @title: 'Brewery name';
    yearOfFoundation    @title: 'Year of foundation';
}

annotate my.Beer with @UI: {
  LineItem: [
    { Value: ID },
    { Value: name },
    {
			Value: rating,
			Criticality: criticality
		},
    { Value: brewery_ID},
    { Value: beerType_ID}
  ],
  HeaderInfo: {
    TypeName: 'Beer',
    TypeNamePlural: 'Beers'
  },
  FieldGroup#Main: {
    Data: [
      { Value: ID },
      { Value: name },
      {
			  Value: rating,
			  Criticality: criticality
		  },
      { Value: brewery_ID},
      { Value: beerType_ID}
    ]
  },
  Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      Label: 'Main',
      Target: '@UI.FieldGroup#Main'
    }
  ]
};

annotate my.BeerType with @UI: {
  LineItem: [
    { Value: ID },
    { Value: name }
  ],
  HeaderInfo: {
    TypeName: 'Beer Type',
    TypeNamePlural: 'Beer Types'
  },
  FieldGroup#Main: {
    Data: [
      { Value: ID },
      { Value: name }
    ]
  },
  Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      Label: 'Main',
      Target: '@UI.FieldGroup#Main'
    }
  ]
};

annotate my.Brewery with @UI: {
  LineItem: [
    { Value: ID },
    { Value: name },
    { Value: yearOfFoundation }
  ],
  HeaderInfo: {
    TypeName: 'Brewery',
    TypeNamePlural: 'Breweries'
  },
  FieldGroup#Main: {
    Data: [
      { Value: ID },
      { Value: name },
      { Value: yearOfFoundation }
    ]
  },
  Facets: [
    {
      $Type: 'UI.ReferenceFacet',
      Label: 'Main',
      Target: '@UI.FieldGroup#Main'
    }
  ]
};

annotate my.Beer with {
	brewery @(
		Common: {
			Text: brewery.name  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'Brewery',
				CollectionPath: 'Brewery',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: brewery_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
			}
		}
	);
	beerType @(
		Common: {
			Text: beerType.name  , TextArrangement: #TextOnly,
			ValueList: {
				Label: 'BeerType',
				CollectionPath: 'BeerType',
				Parameters: [
					{ $Type: 'Common.ValueListParameterInOut',
						LocalDataProperty: beerType_ID,
						ValueListProperty: 'ID'
					},
					{ $Type: 'Common.ValueListParameterDisplayOnly',
						ValueListProperty: 'name'
					}
				]
			}
		}
	);
}
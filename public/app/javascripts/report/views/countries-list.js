'use strict';

define([
  'views/class/lists'
], function(ListsView) {

  var CountriesListView = ListsView.extend({

    el: '#countriesListView',

    options: {
      slug: 'countries',
      limit: 30
    }

  });

  return CountriesListView;

});
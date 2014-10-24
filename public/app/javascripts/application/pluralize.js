'use strict';

var pairs = [
    ['activity', 'activities'],
    ['audience', 'audiences'],
    ['disease', 'diseases'],
    ['donor', 'donors'],
    ['medicine', 'medicines'],
    ['organization', 'organizations'],
    ['project', 'projects'],
    ['region', 'regions'],
    ['sector', 'sectors']
];


define(['underscore'], function(_) {
    var Pluralize = {
        pluralsOfSingulars: {},
        singularsOfPlurals: {},
        singularize: function (string) {
            return this.singularsOfPlurals[string] || string;
        },
        pluralize: function (string) {
            return this.pluralsOfSingulars[string] || string;
        },
        inflectForCount: function (string, count) {
            if (count === 1 || count === '1') {
                return this.singularize(string);
            } else {
                return this.pluralize(string);
            }
        }
    };

    _.each(pairs, function (pair) {
        Pluralize.pluralsOfSingulars[pair[0]] = pair[1];
        Pluralize.singularsOfPlurals[pair[1]] = pair[0];
    });

    return Pluralize;
});

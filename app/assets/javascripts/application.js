// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require cable
//= require bootstrap-typeahead-rails
//= require react
//= require react_ujs
//= require components
//= require_tree .

(function($){
  $(function(){

    $('.button-collapse').sideNav();


    var substringMatcher = function(strs) {
      return function findMatches(q, cb) {
        var matches, substringRegex;

        // an array that will be populated with substring matches
        matches = [];

        // regex used to determine if a string contains the substring `q`
        substrRegex = new RegExp(q, 'i');

        // iterate through the pool of strings and for any string that
        // contains the substring `q`, add it to the `matches` array
        $.each(strs, function(i, str) {
          if (substrRegex.test(str)) {
            matches.push(str);
          }
        });

        cb(matches);
      };
    };

    function refreshPrefetch() {

    		localStorage.clear()


        // instantiate the bloodhound suggestion engine
        var countries = new Bloodhound({
          datumTokenizer: function(countries) {
              return Bloodhound.tokenizers.whitespace(countries.value);
          },
          queryTokenizer: Bloodhound.tokenizers.whitespace,
          remote: {
            url: "http://vocab.nic.in/rest.php/country/json",
            filter: function(response) {
              return response.countries;
            }
          }
        });

        // initialize the bloodhound suggestion engine
        countries.initialize();

        // instantiate the typeahead UI
        $('.typeahead').typeahead(
          { hint: true,
            highlight: true,
            minLength: 1
          },
          {
          name: 'countries',
          displayKey: function(countries) {
            return countries.country.country_name;
          },
          source: countries.ttAdapter()
        });

};

    refreshPrefetch();


  }); // end of document ready
})(jQuery); // end of jQuery name space

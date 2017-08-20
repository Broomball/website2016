// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).on('turbolinks:load', function(){
  var players = new Bloodhound({
    datumTokenizer: Bloodhound.tokenizers.whitespace,
    queryTokenizer: Bloodhound.tokenizers.whitespace,
    remote: {
      url: '/players/autocomplete?query=%QUERY',
      wildcard: '%QUERY'
    }
  });
  $('#players_search').typeahead(null, {
    source: players
  });
})

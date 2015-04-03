$("#query").typeahead({
    name: "restaurant",
    remote: "/search/autocomplete?query=%QUERY"
  });
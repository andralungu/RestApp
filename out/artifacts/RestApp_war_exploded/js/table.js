$(function() { 
 
  // call the tablesorter plugin 
  $(".mytable").tablesorter({ 
    theme: 'blue', 
 
    // hidden filter input/selects will resize the columns, so try to minimize the change 
    widthFixed : true, 
 
    // initialize zebra striping and filter widgets 
    widgets: ["zebra", "filter"], 
 
    // headers: { 5: { sorter: false, filter: false } }, 
 
    widgetOptions : { 
 
      // If there are child rows in the table (rows with class name from "cssChildRow" option) 
      // and this option is true and a match is found anywhere in the child row, then it will make that row 
      // visible; default is false 
      filter_childRows : false, 
 
      // if true, a filter will be added to the top of each table column; 
      // disabled by using -> headers: { 1: { filter: false } } OR add class="filter-false" 
      // if you set this to false, make sure you perform a search using the second method below 
      filter_columnFilters : true, 
 
      // css class applied to the table row containing the filters & the inputs within that row 
      filter_cssFilter : 'tablesorter-filter', 
 
      // add custom filter functions using this option 
      // see the filter widget custom demo for more specifics on how to use this option 
      filter_functions : null, 
 
      // if true, filters are collapsed initially, but can be revealed by hovering over the grey bar immediately 
      // below the header row. Additionally, tabbing through the document will open the filter row when an input gets focus 
      filter_hideFilters : true, 
 
      // Set this option to false to make the searches case sensitive 
      filter_ignoreCase : true, 
 
      // jQuery selector string of an element used to reset the filters 
      filter_reset : 'button.reset', 
 
      // Delay in milliseconds before the filter widget starts searching; This option prevents searching for 
      // every character while typing and should make searching large tables faster. 
      filter_searchDelay : 300, 
 
      // Set this option to true to use the filter to find text from the start of the column 
      // So typing in "a" will find "albert" but not "frank", both have a's; default is false 
      filter_startsWith : false, 
 
      // Filter using parsed content for ALL columns 
      // be careful on using this on date columns as the date is parsed and stored as time in seconds 
      filter_useParsedData : false 
 
    } 
 
  }); 
 
  // External search 
  // buttons set up like this: 
  // <button class="search" data-filter-column="4" data-filter-text="2?%">Saved Search</button> 
  $('button.search').click(function(){ 
    /*** first method *** data-filter-column="1" data-filter-text="!son" 
      add search value to Discount column (zero based index) input */ 
    var filters = $('table').find('input.tablesorter-filter'), 
      col = $(this).data('filter-column'), // zero-based index 
      txt = $(this).data('filter-text'); // text to add to filter 
 
    filters.val(''); // clear all filters 
    filters.eq(col).val(txt).trigger('search', false); 
 
    /*** second method *** 
      this method bypasses the filter inputs, so the "filter_columnFilters" 
      option can be set to false (no column filters showing) 
    ******/ 
    /* 
    var columns = []; 
    columns[4] = '2?%'; // or define the array this way [ '', '', '', '2?%' ] 
    $('table').trigger('search', [columns]); 
    */ 
 
  }); 
 
});

function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e != null){
	    if(e.style.display == 'block')
		e.style.display = 'none';
	    else
		e.style.display = 'block';
	}
}
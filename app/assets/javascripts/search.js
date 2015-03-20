var ajaxSearchRequest = null;

$(function () {
    var $searchInput = $('.common-search input');
    var $searchResults = $('.common-search .search-results');

    $searchResults.css('maxHeight', ($(window).height() - 200) + 'px');

    $searchInput.keyup(function() {
        if (ajaxSearchRequest != null) {
            ajaxSearchRequest.abort();
            ajaxSearchRequest = null;
        }
        if ($(this).val()) {
            ajaxSearchRequest = $.ajax({
                url: '/search',
                data: { query: $searchInput.val() },
                type: 'post',
                success: function(data) {
                    $searchResults.show();
                    $searchResults.html(data);
                }
            });
        } else {
            $searchResults.hide();
        }
    });

    $('.common-search .search-reset').click(function() {
        $searchResults.hide();
        $searchInput.val('');
        $searchInput.focus();
    });

    // when clicked elsewhere
    $('html').click(function(event) {
        // hide search results
        if (!$(event.target).parents().is('.common-search')) {
            $searchResults.hide();
        }
    });

    $searchInput.focus();
});

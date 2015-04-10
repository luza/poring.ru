$(function() {
    var $rates = $('.common-top-spacer .rates');
    $rates.webuiPopover({
        title: 'Выбор рейтов',
        content: '<div id="rates-webui" />',
        width: 180
    }).on('shown.webui.popover', function () {
        $('.common-top-spacer .rates-popover-content').appendTo('#rates-webui');
    });

    // show popover if no rates set
    if (!$.cookie('base_mod') || !$.cookie('job_mod') || !$.cookie('drop_mod')) {
        $rates.webuiPopover('show');
    }

    $('#rates-apply').click(function () {
        $.cookie('base_mod', $('#ratebox-base').val(), { expires: 7, path: '/' });
        $.cookie('job_mod', $('#ratebox-job').val(), { expires: 7, path: '/' });
        $.cookie('drop_mod', $('#ratebox-drop').val(), { expires: 7, path: '/' });
        $.cookie('is_renewal', $('#ratebox-renewal').prop('checked') ? 1 : 0, { expires: 7, path: '/' });
        document.location.reload();
        return false;
    });
});
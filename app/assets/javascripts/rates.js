$(function() {
    $('.common-top-spacer .rates').webuiPopover({
        title: 'Выбор рейтов',
        content: '<div id="rates-webui" />',
        width: 180
    }).on('shown.webui.popover', function () {
        $('.common-top-spacer .rates-popover-content').appendTo('#rates-webui');
    });

    // show popover if no rates set
    if (!$.cookie('base_mod') || !$.cookie('job_mod') || !$.cookie('drop_mod')) {
        $('.common-top-spacer .rates').webuiPopover('show');
    }
    //
    //var base = $.cookie('base_mod') || 1,
    //    job = $.cookie('job_mod') || 1,
    //    drop = $.cookie('drop_mod') || 1;

    // fill selects with cookie values
    //$('#ratebox-base').val(base);
    //$('#ratebox-job').val(job);
    //$('#ratebox-drop').val(drop);
    //
    //$('.rates .rates-base').html(base);
    //$('.rates .rates-job').html(job);
    //$('.rates .rates-drop').html(drop);

    $('#rates-apply').click(function () {
        $.cookie('base_mod', $('#ratebox-base').val(), { expires: 7 });
        $.cookie('job_mod', $('#ratebox-job').val(), { expires: 7 });
        $.cookie('drop_mod', $('#ratebox-drop').val(), { expires: 7 });
        document.location.reload();
        return false;
    });
});
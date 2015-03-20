$(function () {
    var $rows = $('.details-map .npc-list .row');
    $rows.mouseover(function () {
        var npcId = $(this).attr('data-npc-id');
        $('.details-map .map-image .npc-box[data-npc-id="' + npcId + '"]').addClass('hl');
    });
    $rows.mouseout(function () {
        var npcId = $(this).attr('data-npc-id');
        $('.details-map .map-image .npc-box[data-npc-id="' + npcId + '"]').removeClass('hl');
    });
});

function toggleIssuesSelection(el) {
  var boxes = $(el).parents('form').find('input[type=checkbox]');
  var all_checked = true;
  boxes.each(function(){ if (!$(this).prop('checked')) { all_checked = false; } });
  boxes.each(function(){
    if (all_checked) {
      $(this).removeAttr('checked');
      $(this).parents('tr').removeClass('context-menu-selection');
    } else if (!$(this).prop('checked')) {
      $(this).prop('checked', true);
      $(this).parents('tr').addClass('context-menu-selection');
    }
  });
}

$(document).on('turbolinks:load',function(){
    $('form').on('click','.add_row',function(event){

        var regexp, time;
        time = new Date().getTime();
        regexp = new RegExp($(this).data('id'),'g');
        $('.fields').append($(this).data('fields').replace(regexp,time));
        return event.preventDefault();
    });
});

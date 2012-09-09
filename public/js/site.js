$(function() {
  
  SyntaxHighlighter.all();
  
  $('#paragraph-trigger').click(function() {
    $(this).overlay({
      closeOnClick: true
    });
  });
  
  var $modal = $('<div id="image_frame"><div id="profile_frame"><div id="profile_photo"><img src="http://images.instagram.com/profiles/profile_13494644_75sq_1340759945.jpg" class="profile_photo"/><p></p></div></div><div id="detail_frame">hello</div></div>')
    .attr('id', 'modal')
    .css({
	    background: '#f5f5f5',
	    zIndex: 3000,
			padding: '20px 18px',
	    width: '650px',
	    height: '240px',
	    margin: 'auto',
	    opacity: 1,
	    position: 'absolute',
	    top: '10%',
	    left : '300px'
  });
  
  $('#modal-trigger').click(function(evt) {
    evt.preventDefault();
    $(this).overlay({
      effect: 'fade',
      opacity: 0.8,
      closeOnClick: true,
      onShow: function() {
        $('body').append($modal);
      },
      onHide: function() {
        $modal.remove();
      },
    })
  });
  
  $('#anchor-trigger').click(function(evt) {
    evt.preventDefault();
    $(this).overlay({
      color: 'red',
      closeOnClick: true,
      glossy: true
    });
  });  

  $('#photo-trigger').click(function() {
    $(this).overlay({
      color: '#ccc',
      effect: 'fade',
      glossy: true,
      container: '#photo-trigger',
      onShow: function() {
        $(this).click(function(evt) {
          evt.preventDefault();
        }).bind('contextmenu', function(evt) {
          evt.preventDefault();
        });
      }
    });
  });

  $('#photo-trigger-2').click(function() {
    $(this).overlay({
      overlayClass: 'ui-widget-overlay',
      effect: 'fade',
      container: '#photo-trigger-2'
    });
  });
});
// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.piece').draggable({
      snap: '.droppable',
      revert: 'invalid'
  });

  function canPromote() {
    let piece = $(this)
    if (piece.data('piece-type') === "Pawn" && piece.data('y_position') === "8" || piece.data('y_position') === "1")  
      return true
    else
      return false;
  };

// BELOW HERE IS THE PROMOTION MODAL JS  
  var pawnPromoteModal = document.getElementById("pawnPromoteModal");

  // Get the button that opens the modal
  var btn = document.getElementById("myBtn");

  var queenBtn = document.getElementById("queenBtn")

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks on the button, open the modal
  btn.onclick = function() {
    document.getElementById("pawnPromoteModal").style.display = "block";
  }

  queenBtn.onclick = function() {
    console.log(queenBtn.innerHTML)
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
    pawnPromoteModal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function(event) {
    if (event.target == pawnPromoteModal) {
      pawnPromoteModal.style.display = "none";
    }
  }
// above here is the promotion modal JS

  $('.droppable').droppable({
      drop: function(event, ui) {
          let piece = ui.draggable
          let destination_square = $(this);
          console.log($(this));
          var update_piece = {
              id: piece.data('piece-id'),
              game_id: piece.data('game-id'),
              x_position: destination_square.data('x_position'),
              y_position: destination_square.data('y_position')
          }

          if (update_piece.canPromote) { 
              document.getElementById("pawnPromoteModal").style.display = "block"
              $('modalEx submit').onSubmit(function(e) {
                  $.ajax({
                      type: 'PATCH',
                      url: '/chess_pieces/' + update_piece.id,
                      beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
                      dataType: 'json',
                      data: {
                          id: update_piece.id,
                          game_id: update_piece.game_id,
                          x_position: update_piece.x_position,
                          y_position: update_piece.y_position,
                          type: $('pawnPromoteModal form radio-btn active').value
                      },
                      success: function(data) {
                          destination_square.empty();
                          location.reload(true);
                      }
                  })
              })
          }

          $.ajax({
              type: 'PATCH',
              url: '/chess_pieces/' + update_piece.id,
              beforeSend: function(xhr) { xhr.setRequestHeader('X-CSRF-Token', $('meta[name="csrf-token"]').attr('content')) },
              dataType: 'json',
              data: {
                  id: update_piece.id,
                  game_id: update_piece.game_id,
                  x_position: update_piece.x_position,
                  y_position: update_piece.y_position,
              },
              success: function(data) {
                  destination_square.empty();
                  location.reload(true);
              }
          });
      }
  });
});





  //def pawn_promotion(destination)
    //if self.type(Pawn) && y_position == 8 || y_position == 1
      //launch_modal
      //update_attributes(type: "#{@promotion_type}", )
    //end
  //end



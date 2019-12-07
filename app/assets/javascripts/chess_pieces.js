// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {
  $('.piece').draggable({
      snap: '.droppable',
      revert: 'invalid'
  });

  function canPromote() {
    console.log(this);
    if (this.type === "Pawn" && this.y_position == 8 || this.y_position == 1)  
      return true;
    else
      return false;
  };

// BELOW HERE IS THE PROMOTION MODAL JS  
  var pawnPromoteModal = document.getElementById("pawnPromoteModal");

  // Get the button that opens the modal
  var btn = document.getElementById("myBtn");

  var queenBtn = document.getElementById("queenBtn")

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close");

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
        var update_piece = {
            id: piece.data('piece-id'),
            game_id: piece.data('game-id'),
            x_position: destination_square.data('x_position'),
            y_position: destination_square.data('y_position'),
            type: piece.data('piece-type'),
            color: piece.data('color'),
            canPromote: canPromote
        }
        console.log(update_piece)
        if (update_piece.canPromote()) { 
          document.getElementById("pawnPromoteModal").style.display = "block"
          $('#promote_container button').click(function(e) {
          document.getElementById("pawnPromoteModal").style.display = "none"
          console.log(chooseCode(update_piece))
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
                    type: $(e.target).val(),
                    htmlcode: chooseCode(update_piece.color, $(e.target).val())
                },
                success: function(data) {
                    destination_square.empty();
                    // location.reload(true);
                }
            })
          })
        } else {
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
                  // location.reload(true);
              }
          });
        }
      }
  });

});


function chooseCode(color, type) {
  if (color === true){ 
    switch(type) {
      case 'Queen':
        return '&#9813;';
        break;
      case 'Bishop':
        return '&#9815;';
        break;
      case 'Rook':
        return '&#9814;';
        break;
      case 'Knight':
        return '&#9816;';
        break;
    }
  } else {
    switch(type) {
      case 'Queen':
        return '&#9819';
        break;
      case 'Bishop':
        return '&#9821;';
        break;
      case 'Rook':
        return '&#9820;';
        break;
      case 'Knight':
        return '&#9822;';
        break;
    }
  }
}

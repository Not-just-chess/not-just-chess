$(document).ready(function() {
    $('.add-message').on('ajax:success', displayMessage);

    function displayMessage(event, data) {
        console.log("test");

    }
});
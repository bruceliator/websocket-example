App.messages = App.cable.subscriptions.create('MessagesChannel', {
    received: function(data) {
        $('#message_content').val('');
        return $('#messages').append(this.renderMessage(data));
    },

    renderMessage: function(data) {
        return "<li><strong class='text-blue'>" + data.user + ":</strong>" + data.message + "</li>";
    }
});
const APIUtil = {
    followUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'POST',
            dataType: 'JSON'
        })
    },

    unfollowUser: id => {
        return $.ajax({
            url: `/users/${id}/follow`,
            method: 'DELETE',
            dataType: 'JSON'
        })
    }
};

module.exports = APIUtil;
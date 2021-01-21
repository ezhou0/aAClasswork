const APIUtil = require("./api_util.js");

class FollowToggle {
    constructor(el) {
        this.$el = $(el);
        this.userId = this.$el.data("user-id");
        this.followState = this.$el.data("initial-follow-state");
        this.render();

        this.$el.on("click", this.handleClick.bind(this));
    }

    render() {
        if (this.followState === "unfollowed") {
            this.$el.text("Follow!");
        } else if (this.followState === "followed") {
            this.$el.text("Unfollow!");
        }
    }

    handleClick(e) {
        e.preventDefault();

        if (this.followState === "followed") {

            APIUtil.unfollowUser(this.userId)
                .then(()=> {
                    this.followState = "unfollowed"
                    this.render();
                }
            )

        } else if (this.followState === "unfollowed") {

            APIUtil.followUser(this.userId)
                .then(() => {
                    this.followState = "followed"
                    this.render();
                }
            )

        }
    }

}

module.exports = FollowToggle;
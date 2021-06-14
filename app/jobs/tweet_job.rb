class TweetJob < ApplicationJob
  queue_as :default

  def perform(tweet)
    # if we reschedule to sooner
    return if tweet.published?

    # if we reschedule to the future
    return if tweet.publish_at > Time.current

    tweet.publish_to_twitter!
  end
end

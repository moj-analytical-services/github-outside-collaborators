# The GithubCollaborators class namespace
class GithubCollaborators
  # The UndeliveredApproverNotifyEmail class
  class UndeliveredApproverNotifyEmail
    include Logging

    # Creates a line to be used within a Slack message using app data
    #
    # @param collaborator [GithubCollaborators::Collaborator] a collaborator object
    # @return [String] the formatted string
    def create_line(collaborator)
      logger.debug "create_line"
      "- #{collaborator.email.downcase}"
    end

    # Creates the first line to be used within a Slack message when a single
    # collaborator is reported by the Slack message
    #
    # @return [String] the formatted string
    def singular_message
      "Undelivered Notify email to approver"
    end

    # Creates the first line to be used within a Slack message when a multiple
    # collaborators are reported by the Slack message
    #
    # @param collaborators [Numeric] the number of collaborators in the message
    # @return [String] the formatted string
    def multiple_message(collaborators)
      "Undelivered Notify email to approver"
    end
  end
end

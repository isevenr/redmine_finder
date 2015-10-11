class FinderController < ApplicationController
  unloadable

  before_filter :find_project, :authorize, :only => :index

  def index
    @files = Attachment.joins('LEFT JOIN `issues` ON `attachments`.container_id = `issues`.id').where("`issues`.project_id = #{@project.id}").all
  end

  def delete
    attachments = Attachment.find(params[:ids])

    attachments.each do |a|
      if a.container.respond_to?(:init_journal)
        a.container.init_journal(User.current)
      end

      if a.container
        # Make sure association callbacks are called
        a.container.attachments.delete(a)
      else
        a.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to request.referer, notice: 'Attachment(s) removed!' }
    end
  end

  def find_project
    # @project variable must be set before calling the authorize filter
    @project = Project.find_by_identifier(params[:id])
  end
end

# class JobTagsController < ApplicationController
#   before_action :set_job

#   def new
#     @job_tag = JobTag.new
#   end

#   def create
#     @tags = Tag.where(id: params[:job_tag][:tag])
#     @tags.each do |tag|
#       job_tag = JobTag.new(job: @job, tag: tag)
#       job_tag.save
#     end
#     redirect_to dwarf_path(@job.dwarf)
#   end

#   def destroy
#     @job_tag = JobTag.find(params[:id])
#     @job_tag.destroy
#     redirect_to dwarf_path(@job_tag.job.dwarf)
#   end

#   private

#   def set_job
#     @job = Job.find(params[:job_id])
#   end
# end

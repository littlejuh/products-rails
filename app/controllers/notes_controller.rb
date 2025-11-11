# frozen_string_literal: true

class NotesController < ApplicationController
  before_action :set_note, only: %i[edit show update destroy]

  def index
    @notes = Note.all.order(created_at: :desc)
  end

  def show; end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new(note_params)
    @note.save!
  end

  def edit
    respond_to do |format|
      format.turbo_stream
      format.html
    end
  end

  def update
    if @note.update(note_params)
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to @note, notice: "Note was successfully updated." }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @note.destroy
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
    end
  end

  private

  def set_note
    @note = Note.find(params[:id])
  end

  def note_params
    params.require(:note).permit(:title, :description)
  end
end

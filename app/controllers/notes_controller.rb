class NotesController < ApplicationController

  def verse_notes
    notes = Verse.find(params[:id]).notes

    render json: {notes: notes}
  end

  def show
    note = Note.find(params[:id])

    render json: {note: note}
  end

  def update
    note = Note.find(params[:id])

    if note.update(note_params)
      render json: {status: 201, note: note, message: "Note updated"}
    else
      render json: {status: 422, message: "Bad parameters"}
    end
  end

  def destroy
    note = Note.find(params[:id])

    note.destroy
    render json: {status: 204, message: "Note destroyed"}
  end

  def create
    note = Note.new(note_params)

    if note.save!
      render json: {status: 201, note: note, message: "New note created"}
    else
      render json: {status: 422, message: "Bad parameters"}
    end
  end

  private

    def note_params
      params.required(:note).permit(:text, :verse_id)
    end

end

class selection:
    selection_id: int
    stage: int
    book_id: int
    vote: int

    def __init__(self, selection_id: int, stage: int,
                 book_id: int, vote: int) -> object:
        self.vote = vote
        self.stage = stage
        self.selection_id = selection_id
        self.book_id = book_id

import concours_dao
import concours
from DAO.concours_dao import selection_dao

my_selection: selection_dao = selection_dao()
ids = 42
Test: concours.selection = my_selection.read(ids)
if Test:
    print('selection_id : %d \n' % Test.selection_id,
          'étape %d \n' % Test.stage,
          'Livre %d \n' % Test.book_id,
          'Vote %d \n' % Test.vote)
else:
      print( 'la sélection %d n\'existe pas' % ids )



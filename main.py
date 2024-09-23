import concours
from DAO.concours_dao import selection_dao

import actions

my_selection: selection_dao = selection_dao()
ids = 10
Test: concours.selection = my_selection.read(ids)
if Test:
    print('selection_id : %d \n' % Test.selection_id,
          'étape %d \n' % Test.stage,
          'Livre %d \n' % Test.book_id,
          'Vote %d \n' % Test.vote)
else:
    print( 'la sélection %d n\'existe pas' % ids )
my_peone=actions.peone()
my_peone.choisir_selection()
print('et c\'est toujours %s' % my_peone.choix)
my_selection = selection_dao()
my_selection.palmares(my_peone.choix)



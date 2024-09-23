import actions
from DAO.concours_dao import selection_dao

class peone:
    choix: int
    def choisir_selection(self):
        OK = False
        while not OK:
            S = int(input( '''De quelle sélection
            voulez-vous les détails ?
            1 (première sélection), 
            2 (deuxième), 
            3 (finalistes)
            4 (vainqueur)
            '''))
            if 1 <= S <= 4:
                self.choix = S
                OK = True
            else:
                print("Entrez un nombre entre 1 et 4")
        print(f"Voici la liste des livres et leurs auteurs de la sélection {self.choix}")
        my_selection = selection_dao()
        resultat = my_selection.palmares(choix=self.choix)
        if resultat:
            print("id | titre       | Auteur ")
            for i in range(len(resultat)):
                print( resultat[i].get('id'), " |   ",
                       resultat[i].get('titre'),
                   "    |   ", resultat[i].get('name'),
                       resultat[i].get('surname'), "    |")
        else:
            print("Pas encore de résultats")
        on_joue = True
        while on_joue:
            print('Que voulez-vous faire ?')
            print('1 : consulter le résumé d\'un livre')
            print('2 : consulter la bio d\'un auteur')
            print('3 : sortir')
            choix = input('votre choix :')
            match choix:
                case '1':
                    ident=input('Quel est l\'identifiant du livre ?')
                    resume = my_selection.digest(ident)
                    print(resume)
                case '2':
                    ident=input('Quel est l\'identifiant du livre ?')
                    cv = my_selection.cv(ident)
                    print(cv)
                case '3':
                    print("Au revoir")
                    on_joue = False

    class juror(actions.peone):
        def vote(self):
            toto = input('Id du livre pour lequel vous voulez voter')
            titi = input('Sur quelle sélection vous voulez voter')
            titi = titi - 1
            ''' Récupérer l'id de la sélection correspondant 
            au livre dans la sélection N-1, où prend place le vote, soit ids
            SELECT id FROM selection WHERE stage = {titi} AND book_id = {toto}'''
            ids = 42 # fake
            obj = selection_dao.read(ids)
            obj.vote += 1
            if selection_dao.update(obj):
                print('a voté')

 class president(actions.juror):
     pass






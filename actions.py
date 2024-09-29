# noinspection PyUnresolvedReferences
# from actions import juror, peone
from DAO.concours_dao import SelectionDao
from concours import selection


class peone:
    GRR = "donnez un entier positif"
    choix: int

    def choisir_selection(self, stage: int = 0):
        print(f"Appel de la méthode choisir_selection de {self.__class__.__name__}")
        if stage == 0:
            ok = False
            while not ok:
                stage = int(input('''De quelle sélection
                voulez-vous les détails ?
                1 (première sélection), 
                2 (deuxième), 
                3 (finalistes)
                4 (vainqueur)
                '''))
                if ord('1') <= stage <= ord('4'):
                    ok = True

                else:

                    print("Entrez un nombre entre 1 et 4")

        print(f"Voici la liste des livres et leurs auteurs de la sélection {stage}")

        my_selection = SelectionDao()
        resultat = my_selection.palmares(choix=stage)
        if resultat:
            print("id | titre       | Auteur ")
            for i in range(len(resultat)):
                print(resultat[i].get('id'), " |   ",
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
                    ident = input('Quel est l\'identifiant du livre ?')
                    resume = my_selection.digest(ident)
                    print(resume)
                case '2':
                    ident = input('Quel est l\'identifiant du livre ?')
                    cv = my_selection.cv(ident)
                    print(cv)
                case '3':
                    print("Au revoir")
                    on_joue = False


class juror(peone):
    def vote(self):

        book_id = -1
        momento = True
        while momento or book_id < 0:
            b_id: str = input('Id du livre pour lequel vous voulez voter')
            try:
                book_id = int(b_id)
            except ValueError as _:
                print(self.GRR)
            else:
                momento = False
        momento = True
        stage = -1
        while momento or stage < 0:
            stg = input('Pour quelle sélection voulez-vous voter ?')
            try:
                stage = int(stg)
            except ValueError as _:
                print(self.GRR)

            else:
                momento = False
        stage -= 1

        ''' Récupérer l'id de la sélection correspondant 
        au livre dans la sélection N-1, où prend place le vote, soit ids
        '''
        ma_select = SelectionDao()
        ids = ma_select.get_sel_id(stage=stage, book_id=book_id)
        obj = ma_select.read(ids)
        obj.vote += 1
        if ma_select.update(obj):
            print('a voté')


class president(juror):
    def indique_selection(self, tour: int):

        pas_content = True
        while pas_content:

            alz = input("voulez-vous revoir la sélection précédente ?(o/n)")

            if alz == 'o':
                self.choisir_selection(tour - 1)

            book_id: int = -1  # Initialisation à une valeur int
            notyet = True

            while notyet or book_id <= 0:
                b_id = input(f'''Quel livre voulez-vous 
                ajouter à la sélection {tour}''')
                try:
                    book_id = int(b_id)  # Conversion en int
                    if book_id > 0:  # Vérification si book_id est positif
                        notyet = False  # Quitter la boucle si valide
                except ValueError:
                    print(self.GRR)

            # À ce point, book_id est garanti d'être un int
            nouvelle_selection = selection(
                s_id=0,
                stage=tour,
                book_id=book_id,
                vote=0
            )

            commis = SelectionDao()
            commis.create(nouvelle_selection)


if __name__ == '__main__':
    gomme = SelectionDao()
    dernier: selection = gomme.read(17)
    print(dernier)
    if not gomme.delete(dernier):
        print("la suppression n'a pas eu lieu")

    mon_lecteur = juror()
    mon_lecteur.vote()

from typing import Optional

from DAO.dao import Dao
from concours import selection


class selection_dao(selection):
    def create(self, obj: selection) -> int:
        """Crée l'entité en BD correspondant à l'objet obj

        :param obj: à créer sous forme d'entité en BD
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        insert_selection_item = '''INSERT INTO selection (stage, book_id, vote)
        VALUES (%d %d %d)''' % (obj.stage, obj.book_id, obj.vote)
        with self.__class__.connection.cursor() as cursor:
            cursor.execute(insert_selection_item)
            last_inserted_id = cursor.lastrowid
            self.__class__.connection.commit()
            return last_inserted_id

    def read(self, id_entity: int) -> Optional[object]:
        """Renvoit l'objet correspondant à l'entité dont l'id est id_entity
           (ou None s'il n'a pu être trouvé)"""
        query = '''SELECT * FROM selection 
        WHERE id = %d''' % id_entity

        with self.__class__.connection.cursor() as cursor:
            cursor.execute(query)
            resultat = cursor.fetchone()
            if resultat:
                resultat_selection: selection = selection(
                    selection_id=resultat['id'],
                    stage=resultat['stage'],
                    book_id=resultat['book_id'],
                    vote=resultat['vote'])
            else:
                resultat_selection = None
            self.__class__.connection.commit()

        return resultat_selection

    def update(self, obj: Dao) -> bool:
        """Met à jour en BD l'entité correspondant à obj, pour y correspondre

        :param obj: objet déjà mis à jour en mémoire
        :return: True si la mise à jour a pu être réalisée
        """
        query = '''UPDATE
        selection
        SET
        stage = %d, book_id = %d, vote = %d
        WHERE
        id = %d''' (obj.stage, obj.book_id, obj.vote, obj.selection_id,)
        with self.__class__.connection.cursor() as cursor:
            effet = cursor.execute(query)
            if effet == None:
                return False
            if effet == 1:
                return True
            else:
                print(f"Panique : {effet} lignes affectées")

    def delete(self, obj: object) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param obj: objet dont l'entité correspondante est à supprimer
        :return: True si la suppression a pu être réalisée
        """
        return False

    def palmares(self, choix: int):
        requete = '''SELECT Livre.id, Livre.titre, 
        auteur.name, auteur.surname 
        FROM selection 
        INNER JOIN Livre on Livre.id = selection.book_id 
        INNER JOIN auteur on Livre.id_auteur = auteur.id 
        WHERE selection.stage = %d''' % choix
        with self.__class__.connection.cursor() as cursor:
            cursor.execute(requete)
            resultat = cursor.fetchall()
            return resultat

    def digest(self, ident):
        requete = '''SELECT digest 
                    FROM Livre
                    WHERE id = %s ''' % ident
        with self.__class__.connection.cursor() as cursor:
            cursor.execute(requete)
            resultat = cursor.fetchone()
            cursor.fetchall()
            return resultat['digest']

    def cv(self, ident):
        requete = '''SELECT cv 
                            FROM auteur
                            INNER JOIN Livre
                            ON Livre.id_auteur = auteur.id
                            WHERE Livre.id = %s ''' % ident
        with self.__class__.connection.cursor() as cursor:
            cursor.execute(requete)
            resultat = cursor.fetchone()
            cursor.fetchall()
            return resultat['cv']
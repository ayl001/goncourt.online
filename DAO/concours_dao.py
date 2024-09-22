from DAO.dao import Dao
from ..concours import selection

class selection_dao(Dao):
    def create(self, obj: selection) -> int:
        """Crée l'entité en BD correspondant à l'objet obj

        :param obj: à créer sous forme d'entité en BD
        :return: l'id de l'entité insérée en BD (0 si la création a échoué)
        """
        insert_selection_item = '''INSERT INTO selection (stage, book_id, vote)
        VALUES (%d %d %d)''' %(obj.stage, obj.book_id, obj.vote)
        try:
            with self.__class__.connection.cursor() as cursor:
                cursor.execute(insert_selection_item)
#                assert isinstance(cursor.lastrowid, int)
                last_inserted_id = cursor.lastrowid
                self.__class__.connection.commit()
        finally:
            self.__class__.connection.close
        return last_inserted_id
    def read(self, id_entity: int) -> Optional[T]:
        """Renvoit l'objet correspondant à l'entité dont l'id est id_entity
           (ou None s'il n'a pu être trouvé)"""
        return None # test de Create
    def delete(self, obj: T) -> bool:
        """Supprime en BD l'entité correspondant à obj

        :param obj: objet dont l'entité correspondante est à supprimer
        :return: True si la suppression a pu être réalisée
        """
        return None # test de create



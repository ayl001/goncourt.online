from DAO.dao import Dao
class selection_dao(Dao):
    def create(self, obj: selection) -> int:
        insert_selection_item = '''INSERT INTO selection (stage, book_id, vote)
        VALUES (%d %d %d)''' %(obj.stage, obj.book_id, obj.vote)
        with self.__class__.connection.cursor() as cursor:
            cursor.execute(insert_selection_item)
            self.__class__.connection.commit()


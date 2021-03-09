class StepsUtils:
    @staticmethod
    def convert_table_to_dict(context):
        row_dict = {}
        for row in context.table.rows:
            row_dict = dict(row.as_dict())
        for (key, value) in row_dict.items():
            row_dict[key] = value
        return row_dict

    @staticmethod
    def convert_table_to_array(context):
        result = []
        for row in context.table.rows:
            row_dict = dict(row.as_dict())
            result.append(row_dict)
        return result

    @staticmethod
    def compare_dict_in_array(actual, expected):
        for index, data in enumerate(expected):
            for key in expected[index]:
                assert str(expected[index][key]) == str(actual[index][key]), \
                    f"assert failed: expected: {key} = {expected[index][key]} but actual: {key} = {actual[index][key]}"

# write data to a binary file using pickle
def write_binary_file_pickle(data: object) -> bool:
    try:
        with open(FILE_PATH, "wb") as data_file:
            pickle.dump(data, data_file)
            return True
    except Exception as e:
        print(f"Error: {e}")
        return False


# read data from a binary file using pickle
def read_binary_file_pickle(file_path: str) -> object:
    try:
        with open(file_path, "rb") as data_file:
            return pickle.load(data_file)
    except Exception as e:
        return {"message": f"Error: {e}", "status": False}
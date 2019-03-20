require './person'
require './interface'

interface = Interface.new
interface.load_data("people.csv")
interface.load_data("people_pipe.csv")
interface.load_data("people_space.csv")

interface.sort_by_gender_and_last_name
interface.sort_by_birthdate
interface.sort_by_last_name_desc
select person.name from person_order
left join person on person_id = person.id
left join menu on menu_id = menu.id
where (person.address = 'Moscow' or person.address = 'Samara')
	and (menu.pizza_name = 'pepperoni pizza' or menu.pizza_name = 'mushroom pizza')
	and person.gender = 'male'
order by name desc
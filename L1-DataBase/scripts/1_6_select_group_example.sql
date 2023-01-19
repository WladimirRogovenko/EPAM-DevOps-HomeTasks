SELECT 
    cb.BrendName, count(s.ByerName) as Quantity_saled_cars
FROM
    Sales AS s,
    CarBrends AS cb,
    Store AS st
WHERE
    cb.id = st.CarBrends_id and s.Store_id=st.id
    group by cb.BrendName
    order by Quantity_saled_cars desc;
use CarsSaloon;
SELECT 
    s.ByerName, s.OrderDate, s.FinalPrice, st.BasePrice,s.FinalPrice- st.BasePrice as gesheft, cb.BrendName
FROM
    Sales AS s,
    CarBrends AS cb,
    Store AS st
WHERE
    cb.id = st.CarBrends_id and s.Store_id=st.id;
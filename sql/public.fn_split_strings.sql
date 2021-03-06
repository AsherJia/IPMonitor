CREATE OR REPLACE FUNCTION public.fn_split_strings
(
    _text text,
    _delimiter VARCHAR DEFAULT ','::VARCHAR
)
RETURNS TABLE
(
    parameter TEXT
)
AS $$
BEGIN
	_text := CASE WHEN RIGHT(_text,1) = _delimiter THEN SUBSTRING(_text FROM 1 FOR LENGTH(_text) - 1) ELSE _text END;
    RETURN query
    SELECT unnest(string_to_array(_text, _delimiter));
END;
$$ LANGUAGE PLPGSQL;

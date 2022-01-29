DECLARE

type type_ntt

IS

  TABLE OF NUMBER;

  l_ntt_var1 type_ntt:=type_ntt();

BEGIN

  l_ntt_var1.extend();

  l_ntt_var1(1):=857;

  l_ntt_var1.extend(3);

  l_ntt_var1.extend(3,1);

  FOR loop_ntt IN 1..l_ntt_var1.count

  LOOP

    dbms_output.put_line('Index value ['||loop_ntt||']: Element value - '||nvl(to_char(l_ntt_var1(loop_ntt)),'Null'));

  END LOOP loop_ntt;

END;

/
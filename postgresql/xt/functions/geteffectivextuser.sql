create or replace function xt.getEffectiveXtUser() returns text as $$
/* Copyright (c) 1999-2012 by OpenMFG LLC, d/b/a xTuple. 
   See www.xtuple.com/CPAL for the full text of the software license. */

  if (!plv8.XT) {
    plv8.execute('select xt.js_init();');
    XT.user = plv8.execute('select public.getEffectiveXtUser() as username')[0].username;
  }
  return XT.user;
  
$$ language 'plv8' stable;

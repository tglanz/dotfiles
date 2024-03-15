-- Need "jtls" installed on the system
--
-- See the project home:
-- https://github.com/eclipse-jdtls/eclipse.jdt.ls
-- 
-- In my specific case, at the arch system, I used the aur repository:
-- https://aur.archlinux.org/packages/jdtls

local config = {
  cmd = {'jdtls'}
}

require('jdtls').start_or_attach(config)

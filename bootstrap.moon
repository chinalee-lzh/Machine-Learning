require 'libs.version'

require 'libs.type'
require 'libs.ensure'
require 'libs.function'
require 'libs.string'
require 'libs.table'
require 'libs.math'
require 'libs.class'

setmetatable(_G, {
  __index: (_, k) -> error "attempt to index a unexist global: [ #{k} ]"
  __newindex: (_, k, v) -> error "attempt to write a unexist global: [ #{k} ]=[ #{v} ]"
})
(module
 (type $FUNCSIG$vi (func (param i32)))
 (type $FUNCSIG$vj (func (param i64)))
 (type $FUNCSIG$vii (func (param i32 i32)))
 (type $FUNCSIG$ijjjii (func (param i64 i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$ijjii (func (param i64 i64 i32 i32) (result i32)))
 (type $FUNCSIG$i (func (result i32)))
 (type $FUNCSIG$iii (func (param i32 i32) (result i32)))
 (type $FUNCSIG$iiii (func (param i32 i32 i32) (result i32)))
 (type $FUNCSIG$ii (func (param i32) (result i32)))
 (import "env" "action_size" (func $action_size (result i32)))
 (import "env" "assert" (func $assert (param i32 i32)))
 (import "env" "load_i64" (func $load_i64 (param i64 i64 i64 i32 i32) (result i32)))
 (import "env" "memcpy" (func $memcpy (param i32 i32 i32) (result i32)))
 (import "env" "memset" (func $memset (param i32 i32 i32) (result i32)))
 (import "env" "printi" (func $printi (param i64)))
 (import "env" "printn" (func $printn (param i64)))
 (import "env" "prints" (func $prints (param i32)))
 (import "env" "read_action" (func $read_action (param i32 i32) (result i32)))
 (import "env" "require_auth" (func $require_auth (param i64)))
 (import "env" "sbrk" (func $sbrk (param i32) (result i32)))
 (import "env" "store_i64" (func $store_i64 (param i64 i64 i32 i32) (result i32)))
 (import "env" "update_i64" (func $update_i64 (param i64 i64 i32 i32) (result i32)))
 (table 0 anyfunc)
 (memory $0 1)
 (data (i32.const 4) "pb\00\00")
 (data (i32.const 8416) "account: \00")
 (data (i32.const 8432) ", act: \00")
 (data (i32.const 8448) "\n\00")
 (data (i32.const 8464) "received unexpected action\00")
 (data (i32.const 8496) "withdraw to: \00")
 (data (i32.const 8512) "account does not exist\00")
 (data (i32.const 8544) "it should send: \00")
 (data (i32.const 8576) "read\00")
 (data (i32.const 8592) "tipping EOS to \00")
 (data (i32.const 8608) "account has not enough balance\00")
 (data (i32.const 8640) "transfering EOS to \00")
 (data (i32.const 8672) "transfer.memo.get_data()\00")
 (data (i32.const 8704) "get\00")
 (data (i32.const 8720) "malloc_from_freed was designed to only be called after _heap was completely allocated\00")
 (export "memory" (memory $0))
 (export "apply" (func $apply))
 (export "_GLOBAL__sub_I_twitbot.cpp" (func $_GLOBAL__sub_I_twitbot.cpp))
 (func $_GLOBAL__sub_I_twitbot.cpp
  (i64.store offset=8204 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8212 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8220 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8228 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i64.store offset=8236 align=4
   (i32.const 0)
   (i64.const 0)
  )
  (i32.store offset=8244
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8248
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8252
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8256
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8260
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8264
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8268
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8272
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8276
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8280
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8284
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8288
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8292
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8296
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8300
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8304
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8308
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8312
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8316
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8320
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8324
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8328
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8332
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8336
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8340
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8344
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8348
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8352
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8356
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8360
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8364
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8368
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8372
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8376
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8380
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8384
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8388
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8392
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8396
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8400
   (i32.const 0)
   (i32.const 0)
  )
  (i32.store offset=8404
   (i32.const 0)
   (i32.const 0)
  )
 )
 (func $apply (param $0 i64) (param $1 i64)
  (call $prints
   (i32.const 8416)
  )
  (call $printn
   (get_local $0)
  )
  (call $prints
   (i32.const 8432)
  )
  (call $printn
   (get_local $1)
  )
  (call $prints
   (i32.const 8448)
  )
  (block $label$0
   (br_if $label$0
    (call $_ZN5eosio8dispatchIN7twitbot8contractILy14924247275159945216EEENS_15native_currency8transferENS3_3tipEJNS3_8withdrawEEEEbyy
     (get_local $0)
     (get_local $1)
    )
   )
   (call $assert
    (i32.const 0)
    (i32.const 8464)
   )
  )
 )
 (func $_ZN5eosio8dispatchIN7twitbot8contractILy14924247275159945216EEENS_15native_currency8transferENS3_3tipEJNS3_8withdrawEEEEbyy (param $0 i64) (param $1 i64) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $6
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 48)
    )
   )
  )
  (set_local $5
   (i32.const 0)
  )
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (br_if $label$3
       (i64.eq
        (get_local $0)
        (i64.const -3522496798549606400)
       )
      )
      (br_if $label$0
       (i64.ne
        (get_local $0)
        (i64.const 6138663577826885632)
       )
      )
      (br_if $label$0
       (i64.ne
        (get_local $1)
        (i64.const -3617168760277827584)
       )
      )
      (call $_ZN5eosio13unpack_actionINS_15native_currency8transferEEET_v
       (i32.add
        (get_local $6)
        (i32.const 8)
       )
      )
      (call $_ZN7twitbot8contractILy14924247275159945216EE2onERKN5eosio15native_currency8transferE
       (i32.add
        (get_local $6)
        (i32.const 8)
       )
      )
      (br_if $label$1
       (i32.eqz
        (i32.load8_u
         (i32.add
          (get_local $6)
          (i32.const 40)
         )
        )
       )
      )
      (br_if $label$1
       (i32.eqz
        (tee_local $5
         (i32.load
          (i32.add
           (get_local $6)
           (i32.const 44)
          )
         )
        )
       )
      )
      (i32.store
       (get_local $5)
       (tee_local $4
        (i32.add
         (i32.load
          (get_local $5)
         )
         (i32.const -1)
        )
       )
      )
      (br_if $label$1
       (get_local $4)
      )
      (br_if $label$1
       (i32.eqz
        (tee_local $2
         (i32.load
          (i32.add
           (get_local $6)
           (i32.const 36)
          )
         )
        )
       )
      )
      (br_if $label$1
       (i32.lt_s
        (tee_local $4
         (i32.load offset=8396
          (i32.const 0)
         )
        )
        (i32.const 1)
       )
      )
      (set_local $5
       (i32.const 8204)
      )
      (set_local $3
       (i32.add
        (i32.mul
         (get_local $4)
         (i32.const 12)
        )
        (i32.const 8204)
       )
      )
      (loop $label$4
       (br_if $label$1
        (i32.eqz
         (tee_local $4
          (i32.load
           (i32.add
            (get_local $5)
            (i32.const 4)
           )
          )
         )
        )
       )
       (block $label$5
        (br_if $label$5
         (i32.gt_u
          (i32.add
           (get_local $4)
           (i32.const 4)
          )
          (get_local $2)
         )
        )
        (br_if $label$2
         (i32.gt_u
          (i32.add
           (get_local $4)
           (i32.load
            (get_local $5)
           )
          )
          (get_local $2)
         )
        )
       )
       (br_if $label$4
        (i32.lt_u
         (tee_local $5
          (i32.add
           (get_local $5)
           (i32.const 12)
          )
         )
         (get_local $3)
        )
       )
       (br $label$1)
      )
     )
     (block $label$6
      (br_if $label$6
       (i64.eq
        (get_local $1)
        (i64.const -2039333636196532224)
       )
      )
      (br_if $label$0
       (i64.ne
        (get_local $1)
        (i64.const -3771201737969369088)
       )
      )
      (call $_ZN5eosio13unpack_actionIN7twitbot8contractILy14924247275159945216EE3tipEEET_v
       (i32.add
        (get_local $6)
        (i32.const 8)
       )
      )
      (call $_ZN7twitbot8contractILy14924247275159945216EE2onERKNS1_3tipE
       (i32.add
        (get_local $6)
        (i32.const 8)
       )
      )
      (br $label$1)
     )
     (set_local $0
      (call $_ZN5eosio13unpack_actionIN7twitbot8contractILy14924247275159945216EE8withdrawEEET_v)
     )
     (call $prints
      (i32.const 8496)
     )
     (call $printi
      (get_local $0)
     )
     (call $require_auth
      (i64.const -3522496798549606400)
     )
     (i64.store offset=8
      (get_local $6)
      (get_local $0)
     )
     (call $assert
      (i32.ne
       (call $load_i64
        (i64.const -3522496798549606400)
        (i64.const -3522496798549606400)
        (i64.const 3607749778735104000)
        (i32.add
         (get_local $6)
         (i32.const 8)
        )
        (i32.const 16)
       )
       (i32.const 16)
      )
      (i32.const 8512)
     )
     (i64.store offset=16
      (get_local $6)
      (i64.const 0)
     )
     (drop
      (call $update_i64
       (i64.const -3522496798549606400)
       (i64.const 3607749778735104000)
       (i32.add
        (get_local $6)
        (i32.const 8)
       )
       (i32.const 16)
      )
     )
     (call $prints
      (i32.const 8544)
     )
     (call $printi
      (get_local $0)
     )
     (br $label$1)
    )
    (i32.store
     (tee_local $5
      (i32.add
       (get_local $2)
       (i32.const -4)
      )
     )
     (i32.and
      (i32.load
       (get_local $5)
      )
      (i32.const 2147483647)
     )
    )
   )
   (set_local $5
    (i32.const 1)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $6)
    (i32.const 48)
   )
  )
  (get_local $5)
 )
 (func $_ZN5eosio13unpack_actionINS_15native_currency8transferEEET_v (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $2
    (i32.sub
     (tee_local $3
      (i32.load offset=4
       (i32.const 0)
      )
     )
     (i32.and
      (i32.add
       (tee_local $1
        (call $action_size)
       )
       (i32.const 15)
      )
      (i32.const -16)
     )
    )
   )
  )
  (drop
   (call $read_action
    (get_local $2)
    (get_local $1)
   )
  )
  (call $_ZN5eosio6unpackINS_15native_currency8transferEEET_PKcj
   (get_local $0)
   (get_local $2)
   (get_local $1)
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $3)
  )
 )
 (func $_ZN7twitbot8contractILy14924247275159945216EE2onERKN5eosio15native_currency8transferE (param $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (local $4 i64)
  (local $5 i64)
  (local $6 i64)
  (local $7 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $7
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (set_local $3
   (i32.load
    (i32.add
     (get_local $0)
     (i32.const 28)
    )
   )
  )
  (call $prints
   (i32.const 8640)
  )
  (call $prints
   (get_local $3)
  )
  (set_local $5
   (i64.const 0)
  )
  (i64.store
   (get_local $7)
   (i64.const 0)
  )
  (set_local $4
   (i64.const 59)
  )
  (set_local $3
   (i32.const 8672)
  )
  (set_local $6
   (i64.const 0)
  )
  (loop $label$0
   (block $label$1
    (block $label$2
     (br_if $label$2
      (i32.gt_u
       (i32.and
        (i32.add
         (tee_local $1
          (i32.load8_s
           (get_local $3)
          )
         )
         (i32.const -97)
        )
        (i32.const 255)
       )
       (i32.const 25)
      )
     )
     (set_local $1
      (i32.add
       (get_local $1)
       (i32.const 165)
      )
     )
     (br $label$1)
    )
    (set_local $1
     (select
      (i32.add
       (get_local $1)
       (i32.const 208)
      )
      (i32.const 0)
      (i32.lt_u
       (i32.and
        (i32.add
         (get_local $1)
         (i32.const -49)
        )
        (i32.const 255)
       )
       (i32.const 5)
      )
     )
    )
   )
   (set_local $2
    (i64.shr_s
     (i64.shl
      (i64.extend_u/i32
       (get_local $1)
      )
      (i64.const 56)
     )
     (i64.const 56)
    )
   )
   (block $label$3
    (block $label$4
     (br_if $label$4
      (i64.gt_u
       (get_local $5)
       (i64.const 11)
      )
     )
     (set_local $2
      (i64.shl
       (i64.and
        (get_local $2)
        (i64.const 31)
       )
       (i64.and
        (get_local $4)
        (i64.const 4294967295)
       )
      )
     )
     (br $label$3)
    )
    (set_local $2
     (i64.and
      (get_local $2)
      (i64.const 15)
     )
    )
   )
   (set_local $3
    (i32.add
     (get_local $3)
     (i32.const 1)
    )
   )
   (set_local $5
    (i64.add
     (get_local $5)
     (i64.const 1)
    )
   )
   (set_local $6
    (i64.or
     (get_local $2)
     (get_local $6)
    )
   )
   (br_if $label$0
    (i64.ne
     (tee_local $4
      (i64.add
       (get_local $4)
       (i64.const -5)
      )
     )
     (i64.const -6)
    )
   )
  )
  (i64.store
   (get_local $7)
   (get_local $6)
  )
  (set_local $3
   (call $load_i64
    (i64.const -3522496798549606400)
    (i64.const -3522496798549606400)
    (i64.const 3607749778735104000)
    (get_local $7)
    (i32.const 16)
   )
  )
  (set_local $5
   (i64.load offset=16
    (get_local $0)
   )
  )
  (block $label$5
   (block $label$6
    (br_if $label$6
     (i32.ne
      (get_local $3)
      (i32.const 16)
     )
    )
    (i64.store offset=8
     (get_local $7)
     (i64.add
      (get_local $5)
      (i64.load offset=8
       (get_local $7)
      )
     )
    )
    (drop
     (call $update_i64
      (i64.const -3522496798549606400)
      (i64.const 3607749778735104000)
      (get_local $7)
      (i32.const 16)
     )
    )
    (br $label$5)
   )
   (i64.store offset=8
    (get_local $7)
    (get_local $5)
   )
   (i64.store
    (get_local $7)
    (get_local $6)
   )
   (drop
    (call $store_i64
     (i64.const -3522496798549606400)
     (i64.const 3607749778735104000)
     (get_local $7)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $7)
    (i32.const 16)
   )
  )
 )
 (func $_ZN5eosio13unpack_actionIN7twitbot8contractILy14924247275159945216EE3tipEEET_v (param $0 i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $2
    (i32.sub
     (tee_local $3
      (i32.load offset=4
       (i32.const 0)
      )
     )
     (i32.and
      (i32.add
       (tee_local $1
        (call $action_size)
       )
       (i32.const 15)
      )
      (i32.const -16)
     )
    )
   )
  )
  (drop
   (call $read_action
    (get_local $2)
    (get_local $1)
   )
  )
  (i64.store offset=8
   (get_local $0)
   (i64.const 0)
  )
  (i64.store
   (get_local $0)
   (i64.const 0)
  )
  (call $assert
   (i32.gt_u
    (get_local $1)
    (i32.const 7)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (get_local $0)
    (get_local $2)
    (i32.const 8)
   )
  )
  (call $assert
   (i32.ne
    (tee_local $1
     (i32.and
      (get_local $1)
      (i32.const -8)
     )
    )
    (i32.const 8)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (i32.add
     (get_local $2)
     (i32.const 8)
    )
    (i32.const 8)
   )
  )
  (call $assert
   (i32.ne
    (get_local $1)
    (i32.const 16)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (i32.add
     (get_local $2)
     (i32.const 16)
    )
    (i32.const 8)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (get_local $3)
  )
 )
 (func $_ZN7twitbot8contractILy14924247275159945216EE2onERKNS1_3tipE (param $0 i32)
  (local $1 i64)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $4
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 32)
    )
   )
  )
  (call $require_auth
   (i64.const -3522496798549606400)
  )
  (set_local $1
   (i64.load offset=8
    (get_local $0)
   )
  )
  (call $prints
   (i32.const 8592)
  )
  (call $printn
   (get_local $1)
  )
  (i64.store offset=16
   (get_local $4)
   (i64.load
    (get_local $0)
   )
  )
  (set_local $2
   (call $load_i64
    (i64.const -3522496798549606400)
    (i64.const -3522496798549606400)
    (i64.const 3607749778735104000)
    (i32.add
     (get_local $4)
     (i32.const 16)
    )
    (i32.const 16)
   )
  )
  (i64.store
   (get_local $4)
   (i64.load offset=8
    (get_local $0)
   )
  )
  (set_local $3
   (call $load_i64
    (i64.const -3522496798549606400)
    (i64.const -3522496798549606400)
    (i64.const 3607749778735104000)
    (get_local $4)
    (i32.const 16)
   )
  )
  (call $assert
   (i32.ne
    (get_local $2)
    (i32.const 16)
   )
   (i32.const 8512)
  )
  (call $assert
   (i64.lt_u
    (i64.load offset=24
     (get_local $4)
    )
    (i64.load offset=16
     (get_local $0)
    )
   )
   (i32.const 8608)
  )
  (i64.store offset=24
   (get_local $4)
   (i64.sub
    (i64.load offset=24
     (get_local $4)
    )
    (i64.load offset=16
     (get_local $0)
    )
   )
  )
  (drop
   (call $update_i64
    (i64.const -3522496798549606400)
    (i64.const 3607749778735104000)
    (i32.add
     (get_local $4)
     (i32.const 16)
    )
    (i32.const 16)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.ne
      (get_local $3)
      (i32.const 16)
     )
    )
    (i64.store offset=8
     (get_local $4)
     (i64.add
      (i64.load
       (i32.add
        (get_local $0)
        (i32.const 16)
       )
      )
      (i64.load offset=8
       (get_local $4)
      )
     )
    )
    (drop
     (call $update_i64
      (i64.const -3522496798549606400)
      (i64.const 3607749778735104000)
      (get_local $4)
      (i32.const 16)
     )
    )
    (br $label$0)
   )
   (i64.store
    (get_local $4)
    (i64.load
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
    )
   )
   (i64.store offset=8
    (get_local $4)
    (i64.load
     (i32.add
      (get_local $0)
      (i32.const 16)
     )
    )
   )
   (drop
    (call $store_i64
     (i64.const -3522496798549606400)
     (i64.const 3607749778735104000)
     (get_local $4)
     (i32.const 16)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $4)
    (i32.const 32)
   )
  )
 )
 (func $_ZN5eosio13unpack_actionIN7twitbot8contractILy14924247275159945216EE8withdrawEEET_v (result i64)
  (local $0 i32)
  (local $1 i32)
  (local $2 i64)
  (local $3 i32)
  (i32.store offset=4
   (i32.const 0)
   (tee_local $3
    (i32.sub
     (i32.load offset=4
      (i32.const 0)
     )
     (i32.const 16)
    )
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (tee_local $1
    (i32.sub
     (get_local $3)
     (i32.and
      (i32.add
       (tee_local $0
        (call $action_size)
       )
       (i32.const 15)
      )
      (i32.const -16)
     )
    )
   )
  )
  (drop
   (call $read_action
    (get_local $1)
    (get_local $0)
   )
  )
  (call $assert
   (i32.gt_u
    (get_local $0)
    (i32.const 7)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (i32.add
     (tee_local $3
      (get_local $3)
     )
     (i32.const 8)
    )
    (get_local $1)
    (i32.const 8)
   )
  )
  (set_local $2
   (i64.load offset=8
    (get_local $3)
   )
  )
  (i32.store offset=4
   (i32.const 0)
   (i32.add
    (get_local $3)
    (i32.const 16)
   )
  )
  (get_local $2)
 )
 (func $_ZN5eosio6unpackINS_15native_currency8transferEEET_PKcj (param $0 i32) (param $1 i32) (param $2 i32)
  (local $3 i32)
  (local $4 i64)
  (local $5 i32)
  (set_local $4
   (i64.const 0)
  )
  (i64.store offset=24
   (get_local $0)
   (i64.const 0)
  )
  (set_local $5
   (i32.const 0)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 32)
   )
   (i32.const 0)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 36)
   )
   (i32.const 0)
  )
  (call $assert
   (i32.gt_u
    (get_local $2)
    (i32.const 7)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (get_local $0)
    (get_local $1)
    (i32.const 8)
   )
  )
  (call $assert
   (i32.gt_u
    (i32.sub
     (tee_local $3
      (i32.add
       (get_local $1)
       (get_local $2)
      )
     )
     (tee_local $2
      (i32.add
       (get_local $1)
       (i32.const 8)
      )
     )
    )
    (i32.const 7)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 8)
    )
    (get_local $2)
    (i32.const 8)
   )
  )
  (call $assert
   (i32.gt_u
    (i32.sub
     (get_local $3)
     (tee_local $2
      (i32.add
       (get_local $1)
       (i32.const 16)
      )
     )
    )
    (i32.const 7)
   )
   (i32.const 8576)
  )
  (drop
   (call $memcpy
    (i32.add
     (get_local $0)
     (i32.const 16)
    )
    (get_local $2)
    (i32.const 8)
   )
  )
  (set_local $1
   (i32.add
    (get_local $1)
    (i32.const 24)
   )
  )
  (loop $label$0
   (call $assert
    (i32.lt_u
     (get_local $1)
     (get_local $3)
    )
    (i32.const 8704)
   )
   (set_local $4
    (i64.or
     (i64.extend_u/i32
      (i32.shl
       (i32.and
        (tee_local $2
         (i32.load8_u
          (get_local $1)
         )
        )
        (i32.const 127)
       )
       (tee_local $5
        (i32.and
         (get_local $5)
         (i32.const 255)
        )
       )
      )
     )
     (get_local $4)
    )
   )
   (set_local $1
    (i32.add
     (get_local $1)
     (i32.const 1)
    )
   )
   (set_local $5
    (i32.add
     (get_local $5)
     (i32.const 7)
    )
   )
   (br_if $label$0
    (i32.shr_u
     (get_local $2)
     (i32.const 7)
    )
   )
  )
  (call $_ZN5eosio6string6resizeEj
   (i32.add
    (get_local $0)
    (i32.const 24)
   )
   (tee_local $5
    (i32.wrap/i64
     (get_local $4)
    )
   )
  )
  (block $label$1
   (br_if $label$1
    (i32.eqz
     (get_local $5)
    )
   )
   (set_local $2
    (i32.load
     (i32.add
      (get_local $0)
      (i32.const 28)
     )
    )
   )
   (call $assert
    (i32.ge_u
     (i32.sub
      (get_local $3)
      (get_local $1)
     )
     (get_local $5)
    )
    (i32.const 8576)
   )
   (drop
    (call $memcpy
     (get_local $2)
     (get_local $1)
     (get_local $5)
    )
   )
  )
 )
 (func $_ZN5eosio6string6resizeEj (param $0 i32) (param $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (block $label$0
   (block $label$1
    (block $label$2
     (block $label$3
      (block $label$4
       (block $label$5
        (block $label$6
         (block $label$7
          (block $label$8
           (br_if $label$8
            (i32.eqz
             (get_local $1)
            )
           )
           (br_if $label$7
            (i32.le_u
             (tee_local $4
              (i32.load
               (get_local $0)
              )
             )
             (get_local $1)
            )
           )
           (i32.store
            (get_local $0)
            (get_local $1)
           )
           (i32.store8
            (i32.add
             (i32.load offset=4
              (get_local $0)
             )
             (get_local $1)
            )
            (i32.const 0)
           )
           (return)
          )
          (br_if $label$0
           (i32.eqz
            (i32.load8_u offset=8
             (get_local $0)
            )
           )
          )
          (br_if $label$0
           (i32.eqz
            (tee_local $1
             (i32.load
              (i32.add
               (get_local $0)
               (i32.const 12)
              )
             )
            )
           )
          )
          (i32.store
           (get_local $1)
           (tee_local $4
            (i32.add
             (i32.load
              (get_local $1)
             )
             (i32.const -1)
            )
           )
          )
          (br_if $label$6
           (i32.eqz
            (get_local $4)
           )
          )
          (br $label$0)
         )
         (br_if $label$1
          (i32.ge_u
           (get_local $4)
           (get_local $1)
          )
         )
         (drop
          (call $memcpy
           (tee_local $2
            (call $_ZN5eosio14memory_manager6mallocEm
             (i32.const 12)
             (get_local $1)
            )
           )
           (i32.load offset=4
            (get_local $0)
           )
           (i32.load
            (get_local $0)
           )
          )
         )
         (br_if $label$2
          (i32.eqz
           (i32.load8_u offset=8
            (get_local $0)
           )
          )
         )
         (br_if $label$2
          (i32.eqz
           (tee_local $4
            (i32.load
             (i32.add
              (get_local $0)
              (i32.const 12)
             )
            )
           )
          )
         )
         (i32.store
          (get_local $4)
          (tee_local $3
           (i32.add
            (i32.load
             (get_local $4)
            )
            (i32.const -1)
           )
          )
         )
         (br_if $label$5
          (i32.eqz
           (get_local $3)
          )
         )
         (br $label$2)
        )
        (br_if $label$0
         (i32.eqz
          (tee_local $2
           (i32.load offset=4
            (get_local $0)
           )
          )
         )
        )
        (br_if $label$0
         (i32.lt_s
          (tee_local $4
           (i32.load offset=8396
            (i32.const 0)
           )
          )
          (i32.const 1)
         )
        )
        (set_local $1
         (i32.const 8204)
        )
        (set_local $3
         (i32.add
          (i32.mul
           (get_local $4)
           (i32.const 12)
          )
          (i32.const 8204)
         )
        )
        (loop $label$9
         (br_if $label$0
          (i32.eqz
           (tee_local $4
            (i32.load
             (i32.add
              (get_local $1)
              (i32.const 4)
             )
            )
           )
          )
         )
         (block $label$10
          (br_if $label$10
           (i32.gt_u
            (i32.add
             (get_local $4)
             (i32.const 4)
            )
            (get_local $2)
           )
          )
          (br_if $label$4
           (i32.gt_u
            (i32.add
             (get_local $4)
             (i32.load
              (get_local $1)
             )
            )
            (get_local $2)
           )
          )
         )
         (br_if $label$9
          (i32.lt_u
           (tee_local $1
            (i32.add
             (get_local $1)
             (i32.const 12)
            )
           )
           (get_local $3)
          )
         )
         (br $label$0)
        )
       )
       (br_if $label$2
        (i32.eqz
         (tee_local $5
          (i32.load
           (i32.add
            (get_local $0)
            (i32.const 4)
           )
          )
         )
        )
       )
       (br_if $label$2
        (i32.lt_s
         (tee_local $3
          (i32.load offset=8396
           (i32.const 0)
          )
         )
         (i32.const 1)
        )
       )
       (set_local $4
        (i32.const 8204)
       )
       (set_local $6
        (i32.add
         (i32.mul
          (get_local $3)
          (i32.const 12)
         )
         (i32.const 8204)
        )
       )
       (loop $label$11
        (br_if $label$2
         (i32.eqz
          (tee_local $3
           (i32.load
            (i32.add
             (get_local $4)
             (i32.const 4)
            )
           )
          )
         )
        )
        (block $label$12
         (br_if $label$12
          (i32.gt_u
           (i32.add
            (get_local $3)
            (i32.const 4)
           )
           (get_local $5)
          )
         )
         (br_if $label$3
          (i32.gt_u
           (i32.add
            (get_local $3)
            (i32.load
             (get_local $4)
            )
           )
           (get_local $5)
          )
         )
        )
        (br_if $label$11
         (i32.lt_u
          (tee_local $4
           (i32.add
            (get_local $4)
            (i32.const 12)
           )
          )
          (get_local $6)
         )
        )
        (br $label$2)
       )
      )
      (i32.store
       (tee_local $1
        (i32.add
         (get_local $2)
         (i32.const -4)
        )
       )
       (i32.and
        (i32.load
         (get_local $1)
        )
        (i32.const 2147483647)
       )
      )
      (br $label$0)
     )
     (i32.store
      (tee_local $4
       (i32.add
        (get_local $5)
        (i32.const -4)
       )
      )
      (i32.and
       (i32.load
        (get_local $4)
       )
       (i32.const 2147483647)
      )
     )
    )
    (i32.store
     (get_local $0)
     (get_local $1)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 4)
     )
     (get_local $2)
    )
    (i32.store8
     (i32.add
      (get_local $0)
      (i32.const 8)
     )
     (i32.const 1)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 12)
     )
     (i32.const 0)
    )
   )
   (return)
  )
  (i64.store align=4
   (get_local $0)
   (i64.const 0)
  )
  (i32.store8
   (i32.add
    (get_local $0)
    (i32.const 8)
   )
   (i32.const 1)
  )
  (i32.store
   (i32.add
    (get_local $0)
    (i32.const 12)
   )
   (i32.const 0)
  )
 )
 (func $_ZN5eosio14memory_manager6mallocEm (param $0 i32) (param $1 i32) (result i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (local $8 i32)
  (local $9 i32)
  (local $10 i32)
  (local $11 i32)
  (local $12 i32)
  (local $13 i32)
  (block $label$0
   (br_if $label$0
    (i32.eqz
     (get_local $1)
    )
   )
   (block $label$1
    (br_if $label$1
     (tee_local $13
      (i32.load offset=8384
       (get_local $0)
      )
     )
    )
    (set_local $13
     (i32.const 16)
    )
    (i32.store
     (i32.add
      (get_local $0)
      (i32.const 8384)
     )
     (i32.const 16)
    )
   )
   (set_local $2
    (select
     (i32.sub
      (i32.add
       (get_local $1)
       (i32.const 8)
      )
      (tee_local $2
       (i32.and
        (i32.add
         (get_local $1)
         (i32.const 4)
        )
        (i32.const 7)
       )
      )
     )
     (get_local $1)
     (get_local $2)
    )
   )
   (block $label$2
    (block $label$3
     (block $label$4
      (br_if $label$4
       (i32.ge_u
        (tee_local $10
         (i32.load offset=8388
          (get_local $0)
         )
        )
        (get_local $13)
       )
      )
      (set_local $1
       (i32.add
        (i32.add
         (get_local $0)
         (i32.mul
          (get_local $10)
          (i32.const 12)
         )
        )
        (i32.const 8192)
       )
      )
      (block $label$5
       (br_if $label$5
        (get_local $10)
       )
       (br_if $label$5
        (i32.load
         (tee_local $13
          (i32.add
           (get_local $0)
           (i32.const 8196)
          )
         )
        )
       )
       (i32.store
        (get_local $1)
        (i32.const 8192)
       )
       (i32.store
        (get_local $13)
        (get_local $0)
       )
       (drop
        (call $memset
         (get_local $0)
         (i32.const 0)
         (i32.const 8192)
        )
       )
      )
      (set_local $10
       (i32.add
        (get_local $2)
        (i32.const 4)
       )
      )
      (loop $label$6
       (block $label$7
        (br_if $label$7
         (i32.gt_u
          (i32.add
           (tee_local $13
            (i32.load offset=8
             (get_local $1)
            )
           )
           (get_local $10)
          )
          (i32.load
           (get_local $1)
          )
         )
        )
        (i32.store
         (tee_local $13
          (i32.add
           (i32.load offset=4
            (get_local $1)
           )
           (get_local $13)
          )
         )
         (i32.or
          (i32.and
           (i32.load
            (get_local $13)
           )
           (i32.const -2147483648)
          )
          (get_local $2)
         )
        )
        (i32.store
         (tee_local $1
          (i32.add
           (get_local $1)
           (i32.const 8)
          )
         )
         (i32.add
          (i32.load
           (get_local $1)
          )
          (get_local $10)
         )
        )
        (i32.store
         (get_local $13)
         (i32.or
          (i32.load
           (get_local $13)
          )
          (i32.const -2147483648)
         )
        )
        (br_if $label$3
         (tee_local $1
          (i32.add
           (get_local $13)
           (i32.const 4)
          )
         )
        )
       )
       (br_if $label$6
        (tee_local $1
         (call $_ZN5eosio14memory_manager16next_active_heapEv
          (get_local $0)
         )
        )
       )
      )
     )
     (set_local $4
      (i32.sub
       (i32.const 2147483644)
       (get_local $2)
      )
     )
     (set_local $11
      (i32.add
       (get_local $0)
       (i32.const 8392)
      )
     )
     (set_local $12
      (i32.add
       (get_local $0)
       (i32.const 8384)
      )
     )
     (set_local $13
      (tee_local $3
       (i32.load offset=8392
        (get_local $0)
       )
      )
     )
     (loop $label$8
      (call $assert
       (i32.eq
        (i32.load
         (i32.add
          (tee_local $1
           (i32.add
            (get_local $0)
            (i32.mul
             (get_local $13)
             (i32.const 12)
            )
           )
          )
          (i32.const 8200)
         )
        )
        (i32.load
         (tee_local $5
          (i32.add
           (get_local $1)
           (i32.const 8192)
          )
         )
        )
       )
       (i32.const 8720)
      )
      (set_local $13
       (i32.add
        (tee_local $6
         (i32.load
          (i32.add
           (get_local $1)
           (i32.const 8196)
          )
         )
        )
        (i32.const 4)
       )
      )
      (loop $label$9
       (set_local $7
        (i32.add
         (get_local $6)
         (i32.load
          (get_local $5)
         )
        )
       )
       (set_local $1
        (i32.and
         (tee_local $9
          (i32.load
           (tee_local $8
            (i32.add
             (get_local $13)
             (i32.const -4)
            )
           )
          )
         )
         (i32.const 2147483647)
        )
       )
       (block $label$10
        (br_if $label$10
         (i32.lt_s
          (get_local $9)
          (i32.const 0)
         )
        )
        (block $label$11
         (br_if $label$11
          (i32.ge_u
           (get_local $1)
           (get_local $2)
          )
         )
         (loop $label$12
          (br_if $label$11
           (i32.ge_u
            (tee_local $10
             (i32.add
              (get_local $13)
              (get_local $1)
             )
            )
            (get_local $7)
           )
          )
          (br_if $label$11
           (i32.lt_s
            (tee_local $10
             (i32.load
              (get_local $10)
             )
            )
            (i32.const 0)
           )
          )
          (br_if $label$12
           (i32.lt_u
            (tee_local $1
             (i32.add
              (i32.add
               (get_local $1)
               (i32.and
                (get_local $10)
                (i32.const 2147483647)
               )
              )
              (i32.const 4)
             )
            )
            (get_local $2)
           )
          )
         )
        )
        (i32.store
         (get_local $8)
         (i32.or
          (select
           (get_local $1)
           (get_local $2)
           (i32.lt_u
            (get_local $1)
            (get_local $2)
           )
          )
          (i32.and
           (get_local $9)
           (i32.const -2147483648)
          )
         )
        )
        (block $label$13
         (br_if $label$13
          (i32.le_u
           (get_local $1)
           (get_local $2)
          )
         )
         (i32.store
          (i32.add
           (get_local $13)
           (get_local $2)
          )
          (i32.and
           (i32.add
            (get_local $4)
            (get_local $1)
           )
           (i32.const 2147483647)
          )
         )
        )
        (br_if $label$2
         (i32.ge_u
          (get_local $1)
          (get_local $2)
         )
        )
       )
       (br_if $label$9
        (i32.lt_u
         (tee_local $13
          (i32.add
           (i32.add
            (get_local $13)
            (get_local $1)
           )
           (i32.const 4)
          )
         )
         (get_local $7)
        )
       )
      )
      (set_local $1
       (i32.const 0)
      )
      (i32.store
       (get_local $11)
       (tee_local $13
        (select
         (i32.const 0)
         (tee_local $13
          (i32.add
           (i32.load
            (get_local $11)
           )
           (i32.const 1)
          )
         )
         (i32.eq
          (get_local $13)
          (i32.load
           (get_local $12)
          )
         )
        )
       )
      )
      (br_if $label$8
       (i32.ne
        (get_local $13)
        (get_local $3)
       )
      )
     )
    )
    (return
     (get_local $1)
    )
   )
   (i32.store
    (get_local $8)
    (i32.or
     (i32.load
      (get_local $8)
     )
     (i32.const -2147483648)
    )
   )
   (return
    (get_local $13)
   )
  )
  (i32.const 0)
 )
 (func $_ZN5eosio14memory_manager16next_active_heapEv (param $0 i32) (result i32)
  (local $1 i32)
  (local $2 i32)
  (local $3 i32)
  (local $4 i32)
  (local $5 i32)
  (local $6 i32)
  (local $7 i32)
  (set_local $7
   (i32.add
    (tee_local $6
     (i32.add
      (get_local $0)
      (i32.mul
       (tee_local $1
        (i32.load offset=8388
         (get_local $0)
        )
       )
       (i32.const 12)
      )
     )
    )
    (i32.const 8192)
   )
  )
  (block $label$0
   (block $label$1
    (br_if $label$1
     (i32.le_s
      (tee_local $2
       (i32.sub
        (i32.const 1048576)
        (call $sbrk
         (i32.const 0)
        )
       )
      )
      (i32.const 0)
     )
    )
    (br_if $label$0
     (i32.eq
      (tee_local $3
       (call $sbrk
        (tee_local $2
         (select
          (get_local $2)
          (i32.const 65536)
          (i32.lt_u
           (get_local $2)
           (i32.const 65536)
          )
         )
        )
       )
      )
      (i32.add
       (tee_local $4
        (i32.load
         (i32.add
          (get_local $6)
          (i32.const 8196)
         )
        )
       )
       (tee_local $6
        (i32.load
         (get_local $7)
        )
       )
      )
     )
    )
    (block $label$2
     (br_if $label$2
      (i32.eq
       (get_local $6)
       (tee_local $1
        (i32.load
         (tee_local $5
          (i32.add
           (i32.add
            (get_local $0)
            (i32.mul
             (get_local $1)
             (i32.const 12)
            )
           )
           (i32.const 8200)
          )
         )
        )
       )
      )
     )
     (i32.store
      (tee_local $4
       (i32.add
        (get_local $4)
        (get_local $1)
       )
      )
      (i32.or
       (i32.and
        (i32.load
         (get_local $4)
        )
        (i32.const -2147483648)
       )
       (i32.add
        (i32.sub
         (i32.const -4)
         (get_local $1)
        )
        (get_local $6)
       )
      )
     )
     (i32.store
      (get_local $5)
      (i32.load
       (get_local $7)
      )
     )
     (i32.store
      (get_local $4)
      (i32.and
       (i32.load
        (get_local $4)
       )
       (i32.const 2147483647)
      )
     )
    )
    (i32.store
     (tee_local $7
      (i32.add
       (get_local $0)
       (i32.const 8388)
      )
     )
     (tee_local $7
      (i32.add
       (i32.load
        (get_local $7)
       )
       (i32.const 1)
      )
     )
    )
    (i32.store
     (i32.add
      (tee_local $0
       (i32.add
        (get_local $0)
        (i32.mul
         (get_local $7)
         (i32.const 12)
        )
       )
      )
      (i32.const 8196)
     )
     (get_local $3)
    )
    (i32.store
     (tee_local $0
      (i32.add
       (get_local $0)
       (i32.const 8192)
      )
     )
     (get_local $2)
    )
    (drop
     (call $memset
      (get_local $3)
      (i32.const 0)
      (get_local $2)
     )
    )
    (return
     (get_local $0)
    )
   )
   (block $label$3
    (br_if $label$3
     (i32.eq
      (tee_local $3
       (i32.load
        (get_local $7)
       )
      )
      (tee_local $6
       (i32.load
        (tee_local $4
         (i32.add
          (get_local $6)
          (i32.const 8200)
         )
        )
       )
      )
     )
    )
    (i32.store
     (tee_local $2
      (i32.add
       (i32.load
        (i32.add
         (i32.add
          (get_local $0)
          (i32.mul
           (get_local $1)
           (i32.const 12)
          )
         )
         (i32.const 8196)
        )
       )
       (get_local $6)
      )
     )
     (i32.or
      (i32.and
       (i32.load
        (get_local $2)
       )
       (i32.const -2147483648)
      )
      (i32.add
       (i32.sub
        (i32.const -4)
        (get_local $6)
       )
       (get_local $3)
      )
     )
    )
    (i32.store
     (get_local $4)
     (i32.load
      (get_local $7)
     )
    )
    (i32.store
     (get_local $2)
     (i32.and
      (i32.load
       (get_local $2)
      )
      (i32.const 2147483647)
     )
    )
   )
   (i32.store offset=8384
    (get_local $0)
    (tee_local $2
     (i32.add
      (i32.load
       (tee_local $7
        (i32.add
         (get_local $0)
         (i32.const 8388)
        )
       )
      )
      (i32.const 1)
     )
    )
   )
   (i32.store
    (get_local $7)
    (get_local $2)
   )
   (return
    (i32.const 0)
   )
  )
  (i32.store
   (get_local $7)
   (i32.add
    (get_local $6)
    (get_local $2)
   )
  )
  (get_local $7)
 )
)

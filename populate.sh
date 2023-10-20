#!/bin/sh

BUSYBOX_ACCOUNT=2
LUA_ACCOUNT=3
SQLITE_ACCOUNT=4
RICH_SPONSOR_ACCOUNT=5
HACKER_ACCOUNT=6

LUA_LOGO="https://upload.wikimedia.org/wikipedia/commons/c/cf/Lua-Logo.svg"
LUA_BOUNTY_DESC=$(cat <<-END
Lua is a powerful, efficient, lightweight, embeddable scripting language.
The goal of this bounty is to find bugs in Lua.

Submited Lua code will run inside a sanboxed Lua environment, to win the bounty the code must crash its interpreter or escape the sandbox and exit with segmentation fault status (code 139).

The source code of the bounty can be inspected at:
https://github.com/crypto-bug-hunters/bug-less/tree/main/tests/bounties/lua-bounty
END
)

# send DApp address so we can generate vouchers later
go run ./cli send dapp-address

# Busybox 1.36.1
CURR_BOUNTY=$(go run ./cli state | jq '.Bounties | length')
go run ./cli send bounty \
    -a $BUSYBOX_ACCOUNT \
    -n "BusyBox 1.36.1" \
    -i "https://upload.wikimedia.org/wikipedia/commons/3/31/BusyBoxLogo.png" \
    -d "Released on 19 May 20223" \
    -c "./tests/bounties/busybox-bounty/busybox-1.36.1-bounty_riscv64.tar.xz"

go run ./cli send sponsor \
    -a $BUSYBOX_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "BusyBox Sponsor" \
    -v 0.99

go run ./cli send sponsor \
    -a $RICH_SPONSOR_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Rich Crypto Guy" \
    -v 1.337

# Lua 5.4.3
CURR_BOUNTY=$(go run ./cli state | jq '.Bounties | length')
go run ./cli send bounty \
    -a $LUA_ACCOUNT \
    -n "Lua 5.4.3" \
    -i "$LUA_LOGO" \
    -d "$LUA_BOUNTY_DESC" \
    -c "./tests/bounties/lua-bounty/lua-5.4.3-bounty_riscv64.tar.xz"

go run ./cli send sponsor \
    -a $LUA_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Lua Sponsor" \
    -v 0.05

go run ./cli send sponsor \
    -a $RICH_SPONSOR_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Rich Crypto Guy" \
    -v 1.337

go run ./cli send exploit \
    -a $HACKER_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Mike" \
    -e "./tests/bounties/lua-bounty/exploit-lua-5.4.3.lua"

# Lua 5.4.6
CURR_BOUNTY=$(go run ./cli state | jq '.Bounties | length')
go run ./cli send bounty \
    -a $LUA_ACCOUNT \
    -n "Lua 5.4.6" \
    -i "$LUA_LOGO" \
    -d "$LUA_BOUNTY_DESC" \
    -c "./tests/bounties/lua-bounty/lua-5.4.6-bounty_riscv64.tar.xz"

go run ./cli send sponsor \
    -a $LUA_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Lua Sponsor" \
    -v 0.05

go run ./cli send sponsor \
    -a $RICH_SPONSOR_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Rich Crypto Guy" \
    -v 1.337

# SQLite 3.32.2
CURR_BOUNTY=$(go run ./cli state | jq '.Bounties | length')
go run ./cli send bounty \
    -a $SQLITE_ACCOUNT \
    -n "SQLite 3.32.2" \
    -i "https://upload.wikimedia.org/wikipedia/commons/3/38/SQLite370.svg" \
    -d "Released on 4 June 2020" \
    -c "./tests/bounties/sqlite-bounty/sqlite-3.32.2-bounty_riscv64.tar.xz"

go run ./cli send sponsor \
    -a $SQLITE_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "SQLite Sponsor" \
    -v 0.32

go run ./cli send sponsor \
    -a $RICH_SPONSOR_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Rich Crypto Guy" \
    -v 1.337

# SQLite 3.43.2
CURR_BOUNTY=$(go run ./cli state | jq '.Bounties | length')
go run ./cli send bounty \
    -a $SQLITE_ACCOUNT \
    -n "SQLite 3.43.2" \
    -i "https://upload.wikimedia.org/wikipedia/commons/3/38/SQLite370.svg" \
    -d "Released on 10 October 2023" \
    -c "./tests/bounties/sqlite-bounty/sqlite-3.43.2-bounty_riscv64.tar.xz"

go run ./cli send sponsor \
    -a $SQLITE_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "SQLite Sponsor" \
    -v 0.43

go run ./cli send sponsor \
    -a $RICH_SPONSOR_ACCOUNT \
    -b $CURR_BOUNTY \
    -n "Rich Crypto Guy" \
    -v 1.337

Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200101151709.f0FH9vn23739@webber.adilger.net>
Subject: Re: [linux-lvm] hard-lock seems to have caused serious LVM problems
In-Reply-To: <20010115100048.B23471@yendi.dmeyer.net> "from dmeyer@dmeyer.net
 at Jan 15, 2001 10:00:48 am"
Date: Mon, 15 Jan 2001 10:09:57 -0700 (MST)
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dave writes:
> Does the following seem right?

> # pvdata -U /dev/hdb1 /dev/hdb5 /dev/hdb6 /dev/sda1 /dev/sda2
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: --- EMPTY ---
> 002: --- EMPTY ---
> 003: --- EMPTY ---
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: --- EMPTY ---
> 003: --- EMPTY ---
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: 931SNJ6F66g3n3qA9Nts3r4jqe4TOHW8
> 003: --- EMPTY ---
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: 931SNJ6F66g3n3qA9Nts3r4jqe4TOHW8
> 003: m2wuLpJ9AQmzXnbk4sCuQu8hjAev7pax
> 004: --- EMPTY ---
> --- List of physical volume UUIDs ---
> 
> 000: pXMXm8FIECSb7mGPEIX3qVgQFbt21sKd
> 001: efjtqFYhTIqyLO2cBURu5zN7rLJsG4dF
> 002: 931SNJ6F66g3n3qA9Nts3r4jqe4TOHW8
> 003: m2wuLpJ9AQmzXnbk4sCuQu8hjAev7pax
> 004: fdNejQ2DAp9A8KN0UrePxscwoY8vqVSu
> 
> Each PV only has the uuids from the PVs before it.  Should each PV
> have the complete list of uuids in its VG (in which case there's
> something screwy with my PVs)?  Or did pv_read_all_pv_of_vg somehow
> pick the wrong PV to read the uuid list from?  Or something else?

No, this looks wrong.  Each PV should have the UUID from all PVs in the VG.
What you can do in the meantime (if you are confident with such things) is
to copy the UUIDs from /dev/sda2 (or whichever has all 5 UUIDs) to all of
the other disks.  You can do this with "od -Ad -a /dev/sda2" to find where
the UUIDs are stored in the VG (note that each UUID has 32 ASCII characters
and 96 NULs), and "dd" to copy but you obviously need to be careful.

It may also work to change pv_read_all_pv_of_vg() to call pv_read_uuidlist()
for each PV and find the one with the longest list of UUIDs (appropriately
saving uuids_max and pv_uuid_list_max).  However, I'm not sure if that is a
permanent solution - it should really be the same list on all PVs.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

Message-ID: <3B84F850.6030908@inetnow.net>
Date: Thu, 23 Aug 2001 21:34:24 +0900
From: Keith Hopkins <hne@inetnow.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to determine if /dev/... is an LV?
References: <20010822034425.F8742@pc.ilinx> <20010822164325.A1216@dardhal.mired.net> <20010822110154.O8742@pc.ilinx>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com
Cc: dd92f55e6b3d2ae402d737983f92a268@interlinx.bc.ca

>>>Also, is there any relationship between the output from the lvdisplay
>>>and the minor number for the device?
>>>

Yes.

example from lvdisplay for lvol1:
Block device           58:0

   major 58: minor:0

If you look at the devices for, you may notice, hey, they match!

crw-r-----    1 root     disk     109,   0 Aug 23 21:00 group
brw-rw----    1 root     disk      58,   0 Aug 23 21:04 lvol1
brw-rw----    1 root     disk      58,   1 Aug 23 21:03 lvol2

other correlation:
   all minor numbers for char 109 (group files) are unique across the system.
   all minor numbers for block 58 (lvols) are unique across the system.

without looking at the source, when it comes to recovering/rebuilding vg info in the file system, I am assuming that lvm doesn't really care about device files when it is recording info into the vg headers (vgda & such), and since the advent of UUIDs, I doubt if it really cares about minor numbers either.

here is an test layout I created just for the heck of it.

I created vga across /dev/sda1 & sda4, vgb on sda2, vgc on sda3.
I then lvcreated 3 times on vga,vgb,vgc in turn. [lvcreate -l 1 vg(a-c)]
I then lvremoved vga/lvol1.
I then lvcreated 3 times on vga,vgb,vgc in turn. (again)
   the lvcreate makes default names for the lvols.

/dev/vga:
total 46
dr-xr-xr-x    2 root     root          161 Aug 23 21:04 .
drwxr-xr-x   17 root     root        46444 Aug 23 21:01 ..
crw-r-----    1 root     disk     109,   0 Aug 23 21:00 group
brw-rw----    1 root     disk      58,   0 Aug 23 21:04 lvol1
brw-rw----    1 root     disk      58,   1 Aug 23 21:03 lvol2
brw-rw----    1 root     disk      58,   2 Aug 23 21:03 lvol3
brw-rw----    1 root     disk      58,   9 Aug 23 21:04 lvol4
brw-rw----    1 root     disk      58,  10 Aug 23 21:04 lvol5

   interestingly enough, it recreated lvol1 here on the fourth lvcreate and started with the lowest minor number available (0), even though higher numbers had already been used.

/dev/vgb:
total 46
dr-xr-xr-x    2 root     root          182 Aug 23 21:04 .
drwxr-xr-x   17 root     root        46444 Aug 23 21:01 ..
crw-r-----    1 root     disk     109,   1 Aug 23 21:00 group
brw-rw----    1 root     disk      58,   3 Aug 23 21:03 lvol1
brw-rw----    1 root     disk      58,   4 Aug 23 21:03 lvol2
brw-rw----    1 root     disk      58,   5 Aug 23 21:03 lvol3
brw-rw----    1 root     disk      58,  11 Aug 23 21:04 lvol4
brw-rw----    1 root     disk      58,  12 Aug 23 21:04 lvol5
brw-rw----    1 root     disk      58,  13 Aug 23 21:04 lvol6

/dev/vgc:
total 46
dr-xr-xr-x    2 root     root          182 Aug 23 21:04 .
drwxr-xr-x   17 root     root        46444 Aug 23 21:01 ..
crw-r-----    1 root     disk     109,   2 Aug 23 21:00 group
brw-rw----    1 root     disk      58,   6 Aug 23 21:03 lvol1
brw-rw----    1 root     disk      58,   7 Aug 23 21:03 lvol2
brw-rw----    1 root     disk      58,   8 Aug 23 21:03 lvol3
brw-rw----    1 root     disk      58,  14 Aug 23 21:04 lvol4
brw-rw----    1 root     disk      58,  15 Aug 23 21:04 lvol5
brw-rw----    1 root     disk      58,  16 Aug 23 21:04 lvol6

This was all gone on a SuSE 7.1 system with the stock 2.2.18 kernel.
LVM 0.9  13/11/2000 (IOP 10)

Lost in Tokyo,
   Keith

P.S. My, what a big e-mail address you have Grandma!

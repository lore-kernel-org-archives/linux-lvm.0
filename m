From: Koos van den Hout <koos@kzdoos.xs4all.nl>
Message-Id: <20020429112254.A19395@kzdoos.xs4all.nl>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] How to confuse lvm using devfs
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
Date: Mon Apr 29 04:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

It seems the lvm tools get confused when there is devfs compiled into the
kernel but it's not mounted at /dev. Twice I had

lvcreate -l 1024 vghm -n home

fail on me with an error about /dev/vghm/home being inacessible. That's
simply because it was not there.

When I created /dev/vghm/home with the same data as /devices/vghm/home
it wasn't available right away (according to vgdisplay, the extents
were allocated, but lvdisplay did not show the logical volume). When I reran
vgscan (and maybe rebooted in the process, I have rebooted lots of times)
it showed up and worked. The device is formatted with reiserfs now and
mounted.

Now, when I try to display the volume info:

root@NEWgosper:~# lvdisplay /devices/vghm/home 
lvdisplay -- invalid logical volume name "/devices/vghm/home"


root@NEWgosper:~# lvdisplay /dev/vghm/home 
--- Logical volume ---
LV Name                /dev/vghm/home
VG Name                vghm
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                4.00 GB
Current LE             1024
Allocated LE           1024
Allocation             next free
Read ahead sectors     120
Block device           58:1

root@NEWgosper:~# ls -l /dev/vghm/home /devices/vghm/home
brw-r-----    1 root     root      58,   1 Apr 29 01:23 /dev/vghm/home
brw-r-----    1 root     root      58,   1 Jan  1  1970 /devices/vghm/home

Kernel 2.4.18, devfs compiled in but mounted on /devices and not on /dev
(just testing with devfs).

Logical Volume Manager 1.0
Heinz Mauelshagen, Sistina Software  14/08/2001 (IOP 10)

                                     Koos van den Hout

-- 
Koos van den Hout,           PGP keyid RSA/1024 0xCA845CB5 via keyservers
koos@kzdoos.xs4all.nl        or DSS/1024 0xF0D7C263                        -?)
Fax +31-30-2817051               Visit my site about books with reviews    /\\
http://idefix.net/~koos/                http://www.virtualbookcase.com/   _\_V

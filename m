Message-ID: <3DC10F6A.59E982AD@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Input/output error on files on a lvm snapshot
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
Date: Thu Oct 31 05:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm mailinglist <linux-lvm@sistina.com>

Cron Daemon wrote:
> 
> /etc/cron.daily/standard:
> find: /snapshots/opt/week/asic/.aplacedini: Input/output error
> find: /snapshots/opt/week/asic/esy1/esy.src: Input/output error
> find: /snapshots/opt/week/asic/esy1/esy.src: Input/output error
> find: /snapshots/opt/week/asic/esy1/esy.src: Input/output error

Occasionaly I get _LOTS_ of this kind of errors from a LVM
snapshot i have mounted.

dmesg gives these 2 interesting lines:
--------------------------------------
EXT3-fs error (device lvm(58,4)): ext3_readdir: bad entry in directory
#1327138: rec_len % 4 != 0 - offset=0, inode=1922062006, rec_len=43729,
name_len=218
EXT3-fs error (device lvm(58,4)): ext3_readdir: bad entry in directory
#1376515: rec_len % 4 != 0 - offset=0, inode=2932214113, rec_len=4999,
name_len=53


which fits perfectly well with the snapshot:
--------------------------------------------
brw-rw----    1 root     disk      58,   4 Oct 27 07:00
week_snapshot_opt_1035698402

which is mounted:
-----------------
/dev/optVG/week_snapshot_opt_1035698402 on /snapshots/opt/week type ext3
(ro)


lvdisplay:
-----------------------------------------------------------------------------
ve:/sbin# lvdisplay /dev/optVG/week_snapshot_opt_1035698402 
--- Logical volume ---
LV Name                /dev/optVG/week_snapshot_opt_1035698402
VG Name                optVG
LV Write Access        read only
LV snapshot status     active destination for /dev/optVG/opt
LV Status              available
LV #                   5
# open                 1
LV Size                40 GB
Current LE             2560
Allocated LE           2560
snapshot chunk size    64 KB
Allocated to snapshot  57.44% [1.14 GB/1.99 GB]
Allocated to COW-table 8 MB
Allocation             next free
Read ahead sectors     1024
Block device           58:4




lvdisplay of the real LV:
------------------------------------------------------------------------------
ve:/sbin# lvdisplay /dev/optVG/opt 
--- Logical volume ---
LV Name                /dev/optVG/opt
VG Name                optVG
LV Write Access        read/write
LV snapshot status     source of
                       /dev/optVG/week_snapshot_opt_1035698402 [active]
                       /dev/optVG/1hour_snapshot_opt_1036062001 [active]
                       /dev/optVG/8hours_snapshot_opt_1036047601
[active]
                       /dev/optVG/day_snapshot_opt_1036018801 [active]
LV Status              available
LV #                   3
# open                 1
LV Size                40 GB
Current LE             2560
Allocated LE           2560
Allocation             next free
Read ahead sectors     1024
Block device           58:2



The strange part is that some files works, and some doesnt ??
Is this a snapshot error, a filesystem error, or combinations ?
I run EXT3 on all my filesystems, and i only see the problem on
snapshots. They are read only though, so it could be that EXT3
doesnt like read-only. Has anyone experienced anything like this?



JonB

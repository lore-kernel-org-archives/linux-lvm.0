From: Thomas Bader <thomasb@trash.net>
Subject: Re: [linux-lvm] LV not available
Message-ID: <20021227212753.GA16624@trash.net>
References: <20021227135657.GB13292@trash.net> <Pine.LNX.4.44.0212271404030.23297-100000@junior.lunanet.biz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0212271404030.23297-100000@junior.lunanet.biz>
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
Date: Fri Dec 27 15:27:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

* Donald Thompson <dlt@lunanet.biz> [021227 22:12]:
> AFAIK, the PV should never become unavailable unless you specifically set
> it this way or it truly is unavailable, ie. the disk went bad.

The disk is not bad.  /dev/md/4 shares the same disks with
/dev/md/3:

-->-->-->--
fullmoon:~# pvdisplay /dev/md/3
--- Physical volume ---
PV Name               /dev/md/3
VG Name               vg00
PV Size               57.22 GB [120005248 secs] / NOT usable 16.18 MB [LVM: 138 KB]
PV#                   2
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       16384
Total PE              3661
Free PE               0
Allocated PE          3661
PV UUID               3CN6dg-poaj-F5BZ-FbeM-DmWo-K6S2-0RqJmV
fullmoon:~# pvdisplay /dev/md/4
--- Physical volume ---
PV Name               /dev/md/4
VG Name               vg00
PV Size               57.81 GB [121242368 secs] / NOT usable 16.18 MB [LVM: 138 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       16384
Total PE              3699
Free PE               0
Allocated PE          3699
PV UUID               nyoJQM-GYcF-wzWK-H80y-5bgs-UHIs-VhINj6
--<--<--<--

Only /dev/md/4 is unavailable.

According to mtab, there's no error in the RAID arrays:

-->-->-->--
fullmoon:~# cat /proc/mdstat
Personalities : [raid0] [raid1] [raid5]
read_ahead 1024 sectors
md0 : active raid1 ide/host0/bus1/target0/lun0/part1[1] ide/host0/bus0/target0/lun0/part1[0]
      5632064 blocks [2/2] [UU]

md1 : active raid1 ide/host0/bus1/target0/lun0/part2[1] ide/host0/bus0/target0/lun0/part2[0]
      671744 blocks [2/2] [UU]

md2 : active raid1 ide/host0/bus1/target0/lun0/part3[1] ide/host0/bus0/target0/lun0/part3[0]
      33717504 blocks [2/2] [UU]

md3 : active raid1 ide/host2/bus1/target0/lun0/part1[1] ide/host2/bus0/target0/lun0/part1[0]
      60002624 blocks [2/2] [UU]

md4 : active raid1 ide/host2/bus1/target0/lun0/part2[1] ide/host2/bus0/target0/lun0/part2[0]
      60621184 blocks [2/2] [UU]

unused devices: <none>
--<--<--<--

> Try 'pvchange -a -x y' to see if you can set it available.

-->-->-->--
fullmoon:~# pvchange -a -x y
pvchange -- unable to find volume group of "/dev/md/0" (VG not active?)
pvchange -- unable to find volume group of "/dev/md/2" (VG not active?)
pvchange -- unable to find volume group of "/dev/md/3" (VG not active?)
pvchange -- unable to find volume group of "/dev/md/4" (VG not active?)
pvchange -- 0 physical volumes changed / 0 physical volumes already o.k.
--<--<--<--

> Does 'pvscan' pick > it up?

Yes:

-->-->-->--
fullmoon:~# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md/0"  is associated to unknown VG "vg00" (run vgscan)
pvscan -- inactive PV "/dev/md/2"  is associated to unknown VG "vg00" (run vgscan)
pvscan -- inactive PV "/dev/md/3"  is associated to unknown VG "vg00" (run vgscan)
pvscan -- inactive PV "/dev/md/4"  is associated to unknown VG "vg00" (run vgscan)
pvscan -- total: 4 [185.36 GB] / in use: 4 [185.36 GB] / in no VG: 0 [0]
--<--<--<--

> I'm not real familiar with linux software raid, but did you check
> to make sure the array is alright?

It is, since it's marked with [UU] in mdstat.

-- 
<https://trash.net/~thomasb/>   PGP and OpenPGP encrypted mail preferred.
"We can't buy more time, 'cause time won't accept our money."
		-- Bad Religion

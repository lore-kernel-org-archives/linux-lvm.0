From: Thomas Bader <thomas@t-bader.ch>
Message-ID: <20021227135657.GB13292@trash.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LV not available
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
Date: Fri Dec 27 07:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I've got Linux 2.4.20 patched with LVM 1.0.6 up and running.
During a power outage, my system rebooted and my volume
group didn't came up.

One of the PVs in this VG shows like this:

-->-->-->--
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

How can its status changed back to available?  All other PVs
in this VG have status == available.

When I'm running vgscan and vgchange -a y my volume group
cannot be found:

-->-->-->--
fullmoon:~# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "pv_read_all_pv_of_vg(): PV number" can't get data of volume group "vg00" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

fullmoon:~# vgchange -a y
vgchange -- no volume groups found

fullmoon:~#
--<--<--<--

Any hints about how to fix this?

-- 
<https://trash.net/~thomasb/>   PGP and OpenPGP encrypted mail preferred.
"We can't buy more time, 'cause time won't accept our money."
		-- Bad Religion

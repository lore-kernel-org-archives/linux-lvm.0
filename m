From: Donald Thompson <dlt@lunanet.biz>
Subject: Re: [linux-lvm] LV not available
In-Reply-To: <20021227135657.GB13292@trash.net>
Message-ID: <Pine.LNX.4.44.0212271404030.23297-100000@junior.lunanet.biz>
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
Date: Fri Dec 27 15:12:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, 27 Dec 2002, Thomas Bader wrote:

> I've got Linux 2.4.20 patched with LVM 1.0.6 up and running.
> During a power outage, my system rebooted and my volume
> group didn't came up.
>
> One of the PVs in this VG shows like this:
>
> -->-->-->--
> fullmoon:~# pvdisplay /dev/md/4
> --- Physical volume ---
> PV Name               /dev/md/4
> VG Name               vg00
> PV Size               57.81 GB [121242368 secs] / NOT usable 16.18 MB [LVM: 138 KB]
> PV#                   3
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       16384
> Total PE              3699
> Free PE               0
> Allocated PE          3699
> PV UUID               nyoJQM-GYcF-wzWK-H80y-5bgs-UHIs-VhINj6
> --<--<--<--
>
> How can its status changed back to available?  All other PVs
> in this VG have status == available.
>
> When I'm running vgscan and vgchange -a y my volume group
> cannot be found:
>
> -->-->-->--
> fullmoon:~# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- ERROR "pv_read_all_pv_of_vg(): PV number" can't get data of volume group "vg00" from physical volume(s)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume group
>
> fullmoon:~# vgchange -a y
> vgchange -- no volume groups found
>
> fullmoon:~#
> --<--<--<--
>
> Any hints about how to fix this?

AFAIK, the PV should never become unavailable unless you specifically set
it this way or it truly is unavailable, ie. the disk went bad. Try
'pvchange -a -x y' to see if you can set it available. Does 'pvscan' pick
it up? I'm not real familiar with linux software raid, but did you check
to make sure the array is alright?

-Don

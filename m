From: Thomas Bader <thomasb@trash.net>
Subject: Re: [linux-lvm] LV not available
Message-ID: <20021227221750.GA20706@trash.net>
References: <20021227135657.GB13292@trash.net> <Pine.LNX.4.44.0212271404030.23297-100000@junior.lunanet.biz> <20021227212753.GA16624@trash.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021227212753.GA16624@trash.net>
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
Date: Fri Dec 27 16:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

* Thomas Bader <thomasb@trash.net> [021227 22:27]:
> fullmoon:~# pvscan
> pvscan -- reading all physical volumes (this may take a while...)
> pvscan -- inactive PV "/dev/md/0"  is associated to unknown VG "vg00" (run vgscan)
> pvscan -- inactive PV "/dev/md/2"  is associated to unknown VG "vg00" (run vgscan)
> pvscan -- inactive PV "/dev/md/3"  is associated to unknown VG "vg00" (run vgscan)
> pvscan -- inactive PV "/dev/md/4"  is associated to unknown VG "vg00" (run vgscan)
> pvscan -- total: 4 [185.36 GB] / in use: 4 [185.36 GB] / in no VG: 0 [0]

Ouups.... I just saw quite a big error.  /dev/md/0 shouldn't
be part of a VG:

-->-->-->--
fullmoon:~# pvdisplay /dev/md/0
--- Physical volume ---
PV Name               /dev/md/0
VG Name               vg00
PV Size               38.17 GB [80043008 secs] / NOT usable 4.18 MB [LVM: 162 KB]
PV#                   1
PV Status             available
Allocatable           yes (but full)
Cur LV                2
PE Size (KByte)       4096
Total PE              9769
Free PE               0
Allocated PE          9769
PV UUID               55g4wS-tvR6-cu7V-FwnH-JfR7-14ij-HtVqYf
fullmoon:~# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/md/0             5.3G  1.5G  3.5G  30% /
--<--<--<--

There's something really strange with my system.  I never
have done a pvcreate on /dev/md/0... please also note the
different sizes, /dev/md/0 has with pvdisplay and df.

I have uploaded the output of 'pvscan -d', 'vgscan -d',
'vgchange -day' and 'vgcfgrestore -ll' to

  http://trash.net/~thomasb/files/ptmp/lvm/

Maybe, someone can help me...

-- 
<https://trash.net/~thomasb/>   PGP and OpenPGP encrypted mail preferred.
"We can't buy more time, 'cause time won't accept our money."
		-- Bad Religion

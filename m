Date: Mon, 5 Mar 2007 12:31:37 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Questions
In-Reply-To: <20070305115323.GA7635@redhat.com>
Message-ID: <Pine.LNX.4.44.0703051223490.24492-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 5 Mar 2007, Heinz Mauelshagen wrote:

> On Sat, Mar 03, 2007 at 08:59:38PM -0500, Stuart D. Gathman wrote:
> > Which display commands display on-disk metadata, which display 
> > lvmtab/lvmtab.d, and which display kernel data structures?  I'd like to 
> > know if the metadata is trashed on my original two PVs, or just on
> > the new one I tried to add.
> 
> Because you're refering to LVM1, you see kernel metadata unless you
> provide the -D option to the *display commands.

Why did vgdisplay refuse to display anything until I restored
/etc/lvmtab.d/rootvg from the backup (prior to the attempted vgextend)?

What is the relationship between /etc/lvmconf backups and /etc/lvmtab.d?
Are they the same or different format?  I notice that the size is identical,
but there where byte differences when I compared them on the backup of the
working system.

What does this mean?

[root@cmslax root]# vgdisplay -D
vgdisplay -- ERROR: not all physical volumes of volume group "rootvg" online

And sure enough, 
[root@cmslax root]# pvdisplay /dev/md3
--- Physical volume ---
PV Name               /dev/md3
VG Name               rootvg
PV Size               16.87 GB [35374848 secs] / NOT usable 32.19 MB [LVM: 130 KB]
PV#                   3
PV Status             NOT available
Allocatable           yes
Cur LV                1
PE Size (KByte)       32768
Total PE              538
Free PE               481
Allocated PE          57
PV UUID               YfvIpi-x3Cg-xKrR-j1T2-Gutz-u1tp-sl8t01

/dev/md3 is most assuredly available and readable/writable.

> Make sure that your /etc/lvmconf backup is alright for your case
> by running "vgcfgrestore -ll -f ...".
> If so, vgcfgrestore it after initializing the PVs with pvcreate -f.

Why is the pvcreate necessary?  The PVs all have metadata displayable
with pvdisplay.  Pvdisplay has no -D option, so I assume it displays
on disk metadata.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

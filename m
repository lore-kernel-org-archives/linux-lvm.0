Message-ID: <3957705A.85610ACE@icp.siemens.com>
Date: Mon, 26 Jun 2000 11:01:46 -0400
From: Brian Kress <kressb@icp.siemens.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
References: <B45465FD9C23D21193E90000F8D0F3DF6834DF@mailsrv.linkvest.ch>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

I have almost exactly this system.  ( I don't have the
raid0 boot partition)  Works great.


Jean-Eric Cuendet wrote:
> 
> Hi,
> I'd like to build such a system:
> - Kernel + root on non-LVM Raid0/ext2 partition (no problemo)

	This gets a little tricky.  You need both disks BIOS
addressable (preferably hda and hdb or sda and sdb).  You also
need a LILO that speaks Raid0.  I think RH6.2 comes with one.

> A big partition (100Gb) which lokks like:
> - Raid5 (linux md)
> - LVM
> - filesystem
> 
> It's a classic schema, but my question is:
> Does anyone already tried it?

	/dev/md0 is a raid5 of /dev/hdb, /dev/hde, /dev/hdg, and 
/dev/hdl.  /dev/md0 is a PV for a VG that has 7 LVs in it.  I 
even have root in LVM.  (this requires MD autodetect and 
an initrd for LVM) 

> Any success? failure? Drawback?
> Does XFS + LVM or JFS + LVM or ReiserFS + LVM be stable enough for
> production?

	Currently you cannot put journaled filesystems on a software 
raid I believe, because they use the buffer cache in incompatible 
ways.  If I am wrong, someone correct me.  Ext2 (what I use) works
fine. 
	Raid 0.90 and LVM are both quite stable for production use.

> Do they all have resize tools?

	Ext2 has one I think.  I don't generally resize LVs.


	If you'd like any help setting this up, let me know.


Brian Kress
kressb@icp.siemens.com

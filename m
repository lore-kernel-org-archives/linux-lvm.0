Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLFMMr32408
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:22:22 -0500
Received: from ln-bas08.csfb.com (mx-2.csfb.com [198.240.128.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBLFMGaJ022929
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:22:16 -0500
Received: from SLON11P30741.csfb.cs-group.com (slon11p30741.csfb.mail
	[166.12.48.145])
	by ln-bas08.csfb.com (Postfix) with ESMTP id 25801356D
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 15:20:41 +0000 (GMT)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF01AC@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Date: Tue, 21 Dec 2004 15:19:49 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm/fs issue
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
Content-Type: text/plain; charset="us-ascii"
To: "'linux-lvm@redhat.com'" <linux-lvm@redhat.com>

Hi.  Having an odd problem with lvm and/or my file system.  Can anyone offer
any ideas what might be wrong?

Drive is set up as follows:

(parted) print
Disk geometry for /dev/sda: 0.000-38154.375 megabytes
Disk label type: msdos
Minor    Start       End     Type      Filesystem  Flags
1          0.016    244.000  primary   reiserfs    boot
2        244.000   2197.000  primary   linux-swap
3       2197.000  38154.000  extended
5       2197.016  16845.000  logical   reiserfs
6      16845.016  21728.000  logical
7      21728.016  26611.000  logical
8      26611.016  31494.000  logical
9      31494.016  38154.000  logical


/dev/sda3 is an extended partition, with /dev/sda5 through 9 under it.
/dev/sda5 is a standard reiser partition (mounted at /), and /dev/sda6 through
9 make up a logical volume /dev/lvgroup1/lvshare (also using reiserfs) which
gets mounted at /usr/local/share.

All is basically going well, but recently I started to see some odd messages
popping up during various lvm calls:
  /dev/sda3: read failed after 0 of 2048 at 0: Input/output error

This happens at boot time, when my distro does some LVM initialization, as
well as when I issue lvm commands from the command line:

[root@wnyc190562661 ~]# lvm pvs
  /dev/sda3: read failed after 0 of 2048 at 0: Input/output error
  PV         VG       Fmt  Attr PSize PFree
  /dev/sda6  lvgroup1 lvm2 a-   4.77G    0
  /dev/sda7  lvgroup1 lvm2 a-   4.77G    0
  /dev/sda8  lvgroup1 lvm2 a-   4.77G 2.30G
  /dev/sda9  lvgroup1 lvm2 a-   6.50G 6.50G


I'm a bit stumped on what the problem could be or how to go about fixing it.
Since the message occurs during LVM commands (and since I don't see a similar
error when the non-LVM /dev/sda5 gets mounted), I have to assume that the
problem is something wrong on one of my PV partitions /dev/sda6 through 9.
(Doesn't seem like there could be something wrong with /dev/sda3, since
there's no real data held there.)  However, when I umounted /usr/local/share
and did a fsck on the logical volume, nothing showed up.


I'm obviously very concerned, since input/output errors make me wonder whether
my disk is in danger of dying.  On the other hand, though, other than this odd
error message, everything seems to be working fine.  Anyone ever seen anything
like this before?  Is this even an LVM problem?  Any ideas on how to go about
addressing it?  I'm really not sure what else to try at this point.

TIA,

DR


==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================

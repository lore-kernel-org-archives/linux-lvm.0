Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l49GK4k6008502
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 12:20:04 -0400
Received: from mail.wrs.com (mail.windriver.com [147.11.1.11])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l49GJxud013238
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 12:19:59 -0400
Received: from ALA-MAIL03.corp.ad.wrs.com (ala-mail03 [147.11.57.144])
	by mail.wrs.com (8.13.6/8.13.6) with ESMTP id l49GJrMZ028575
	for <linux-lvm@redhat.com>; Wed, 9 May 2007 09:19:53 -0700 (PDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Problems removing snapshots
Date: Wed, 9 May 2007 09:19:52 -0700
Message-ID: <37B62E0F71C9E14B9859FADB1FC3E3E1388C3B@ala-mail02.corp.ad.wrs.com>
In-Reply-To: <20070330082749.GB18888@pion05.tphys.physik.uni-tuebingen.de>
From: "Kottaridis, Chris" <chris.kottaridis@windriver.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I am seeing something similar, did you ever get a resolution to your
problem ?

I unmount my snapshot first and then do the lvremove. I am running and
older version of 2.6.10

Thanks 


Chris Kottaridis
Senior Engineer
Wind River Systems
719-522-9786

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Dominik Epple
Sent: Friday, March 30, 2007 2:28 AM
To: linux-lvm@redhat.com
Subject: [linux-lvm] Problems removing snapshots

Hi list,

I have two snapshot volumes:

# lvs
  LV        VG         Attr   LSize  Origin Snap%  Move Copy%
  home      lvm_share  owi-ao 44.00G
  mail      lvm_share  owi-ao  4.00G
  snap_home lvm_share  swi-a-  6.00G home    63.72
  snap_mail lvm_share  swi-a-  1.00G mail    23.68

When I try to remove one of them...

# lvremove -d -v /dev/lvm_share/snap_mail
    Using logical volume(s) on command line Do you really want to remove
active logical volume "snap_mail"? [y/n]: y
    Archiving volume group "lvm_share" metadata.
    Found volume group "lvm_share"
    Loading lvm_share-mail-real
    Loading lvm_share-snap_mail-cow
    Loading lvm_share-snap_mail

... it seems to take forever (at least it does not complete within
minutes), and the load of the machine goes up very high (larger than 10,
and still increasing), and finally, I need to reboot the machine with
the reset button.

How can I get rid of my snapshots?

The system is debian sarge on amd64 with a custom kernel and standard
debian packages of lvm etc.

# uname -a
Linux hostname 2.6.18.3-k8-smp #1 SMP Wed Nov 22 11:58:25 CET 2006
x86_64 GNU/Linux

Thanks, Dominik.
--
PGP Public Key and contact information available at
http://www.tphys.physik.uni-tuebingen.de/tplist/phonelist.py?uid=epple

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

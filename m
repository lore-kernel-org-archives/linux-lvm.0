Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2U8RrVY026816
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 04:27:53 -0400
Received: from pion19.tphys.physik.uni-tuebingen.de
	(root@pion19.tphys.physik.uni-tuebingen.de [134.2.78.142])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2U8RoQt014773
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 04:27:50 -0400
Received: from pion05.tphys.physik.uni-tuebingen.de
	(root@pion05.tphys.physik.uni-tuebingen.de [134.2.78.200])
	by pion19.tphys.physik.uni-tuebingen.de (8.13.4/8.13.4/Debian-3sarge3)
	with ESMTP id l2U8Rn5u006922
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 10:27:49 +0200
Received: from pion05.tphys.physik.uni-tuebingen.de
	(epple@localhost.localdomain [127.0.0.1])
	by pion05.tphys.physik.uni-tuebingen.de (8.13.8/8.13.8/Debian-3) with
	ESMTP id l2U8Rn5V019095
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 30 Mar 2007 10:27:49 +0200
Received: (from epple@localhost)
	by pion05.tphys.physik.uni-tuebingen.de (8.13.8/8.13.8/Submit) id
	l2U8RnAj019094
	for linux-lvm@redhat.com; Fri, 30 Mar 2007 10:27:49 +0200
From: Dominik Epple <epple@tphys.physik.uni-tuebingen.de>
Date: Fri, 30 Mar 2007 10:27:49 +0200
Message-ID: <20070330082749.GB18888@pion05.tphys.physik.uni-tuebingen.de>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Problems removing snapshots
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

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
    Using logical volume(s) on command line
Do you really want to remove active logical volume "snap_mail"? [y/n]: y
    Archiving volume group "lvm_share" metadata.
    Found volume group "lvm_share"
    Loading lvm_share-mail-real
    Loading lvm_share-snap_mail-cow
    Loading lvm_share-snap_mail

... it seems to take forever (at least it does not complete within
minutes), and the load of the machine goes up very high (larger than
10, and still increasing), and finally, I need to reboot the machine
with the reset button.

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

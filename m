Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1BKk7O22536
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:46:07 -0500
Received: from ln-bas08.csfb.com (mx-2.csfb.com [198.240.128.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1BKk1ks007405
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 15:46:01 -0500
Received: from slon11p30740.csfb.cs-group.com (slon11p30740.csfb.mail
	[166.12.210.47])
	by ln-bas08.csfb.com (Postfix) with ESMTP id 130366FA4
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 20:45:56 +0000 (GMT)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF0489@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Subject: RE: [linux-lvm] waah waah - disaster recovery
Date: Fri, 11 Feb 2005 20:45:07 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>



> Rosenstrauch, David wrote:
> 
> > Basically just dd the data from the partition on the bad 
> disk to the partition
> > on the new disk (e.g., "dd if=/dev/hda2 of=/dev/hdb3").
> 
> dd_rescue.
> 
> http://freshmeat.net/projects/ddrescue/
> http://www.gnu.org/software/ddrescue/ddrescue.html


Wow - cool util!  Wish I had known about this a week ago!  :-)


> The Gentoo LiveCD has LVM2 support.
> 
> http://www.gentoo.org/doc/en/lvm2.xml

>      / Rickard Olsson,IT-Konsult/


Also very good to know.  Thanks for the info, Rickard!

DR

==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================

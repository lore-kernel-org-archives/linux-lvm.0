Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLFn4r08871
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:49:04 -0500
Received: from ln-bas08.csfb.com (mx-2.csfb.com [198.240.128.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBLFmw1U028278
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 10:48:58 -0500
Received: from slon11p30740.csfb.cs-group.com (slon11p30740.csfb.mail
	[166.12.210.47])
	by ln-bas08.csfb.com (Postfix) with ESMTP id C1A811A9B
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 15:48:52 +0000 (GMT)
Message-ID: <0B834CEE3453504B82AB821DFB7047C1FF01B3@enyc11p32003.corpny.csfb.com>
From: "Rosenstrauch, David" <david.rosenstrauch@csfb.com>
Subject: RE: [linux-lvm] lvm/fs issue
Date: Tue, 21 Dec 2004 15:48:41 -0000
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



> On Tue, Dec 21, 2004 at 03:19:49PM -0000, Rosenstrauch, David wrote:
> >   /dev/sda3: read failed after 0 of 2048 at 0: Input/output error
> 
> It's harmless - safe to ignore.
> 
> Which version of LVM2 and what architecture?  
> 
> 2.00.30 started displaying detailed errors like this so we 
> can find out 
> about them and fix them; older versions silently ignored them.
> 
> Alasdair


v2.00.31 (as of a week ago).  I'm using kernel 2.6.9 on an Intel Pentium 4
(with Hyperthreading).

Thanks!

DR

==============================================================================
This message is for the sole use of the intended recipient. If you received
this message in error please delete it and notify us. If this message was
misdirected, CSFB does not waive any confidentiality or privilege. CSFB
retains and monitors electronic communications sent through its network.
Instructions transmitted over this system are not binding on CSFB until they
are confirmed by us. Message transmission is not guaranteed to be secure.
==============================================================================

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6NB4aa27441
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 07:04:36 -0400
Received: from gw.mml.usyd.edu.au (client-101.mml.usyd.edu.au [129.78.188.101])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6NB4TXn006168
	for <linux-lvm@redhat.com>; Fri, 23 Jul 2004 07:04:30 -0400
Date: Fri, 23 Jul 2004 21:04:22 +1000
From: Franc Carter <franc@tech.sirca.org.au>
Subject: Re: [linux-lvm] SAN Storage/mirror/lvm
Message-ID: <20040723110422.GA27318@prog.mml.usyd.edu.au>
References: <4100D1DD.953FD20A@gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4100D1DD.953FD20A@gmx.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: thomas.meller@gmx.net, LVM general discussion and development <linux-lvm@redhat.com>


I setup a similar system on a HDS-9570 but with only one
card in each machine - 'assuming' that the failover in the
driver would cope if a controller on the HDS failed (as
opposed to a QLogic failure)

This worked fine if I disconncected a path in the fabric but
when we took a controller of line the failover failed.

Since then I have used md multipath which has tested fine

On Fri, Jul 23, 2004 at 10:52:45AM +0200, Thomas Meller wrote:
> Maybe everything is all right with what I am doing - maybe not.
> 
> I have heard roumors that my setup may cause troubles.
> Does anybody know something about it?
> 
> I try to set up a cluster on a SAN with shared disks, mirrored over 2 storage controllers.
> 
> Using QLogic HBAs, I have set
> ql2xfailover=1
> to use the multipathing feature.
> 
> We have 2 separate fabrics to connect to the storage and 2 HBAs in each machine.
> 
> Disk layout:
> 
> A           B   (controllers)
> sda        sdf
> sdb        sdg
> sdc mirror sdh -+
> sdd mirror sdi  |
> sde mirror sdj -+
>                 |
>                 +-- volume group
> 
> Also, we do not have much write thruput to the disks.
> I use reiserfs because I could resize it w/o remounting.
> 
> Austin Gonyou has written something about write cache mirroring - what is that?
> Necessary?
> Howto?
> I use LVM1
> 
> Am I in danger?
> 
> Thanks
> 
> Thomas
> 
> -- 
> Thomas Meller
> mailto: thomas.meller@t-systems.ch
> mailto: thomas.meller@gmx.net
> ----
> ...Our continuing mission: To seek out knowledge of C, to explore strange
> UNIX commands, and to boldly code where no man page has ever been seen
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 
Franc Carter     Ph:61-2-9236-9127      Fax: 61-2-9321-5988
Systems Manager, SIRCA Ltd              http://www.sirca.org.au/

DISCLAIMER: The contents of this email, inclusive of attachments, may
be legally privileged and confidential. Any unauthorised use of the
contents is expressly prohibited. If you have received this message in
error or are not the intended recipient, you should destroy the email
message along with any attachment(s).  Unintended recipients of this
email are prohibited from retaining, disclosing, distributing or using
any information contained herein.  This email is also subject to
copyright. No part of it should be reproduced, adapted or transmitted
without the written consent of the copyright owner.

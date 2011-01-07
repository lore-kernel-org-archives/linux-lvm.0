Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p07Ajquh020264
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 05:45:52 -0500
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p07Ajhnr024547
	for <linux-lvm@redhat.com>; Fri, 7 Jan 2011 05:45:44 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id AFD04207E1
	for <linux-lvm@redhat.com>; Fri,  7 Jan 2011 05:45:43 -0500 (EST)
Received: from h2clo7.fastwebnet.it (93-38-169-201.ip71.fastwebnet.it
	[93.38.169.201])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 64E2444698A
	for <linux-lvm@redhat.com>; Fri,  7 Jan 2011 05:45:43 -0500 (EST)
From: Roberto Sassu <roberto.sassu@polito.it>
Date: Fri, 7 Jan 2011 11:45:34 +0100
References: <201101051848.55092.roberto.sassu@polito.it>
	<1294260813.2185.35@raydesk1.bettercgi.com>
	<201101061134.50666.roberto.sassu@polito.it>
In-Reply-To: <201101061134.50666.roberto.sassu@polito.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201101071145.35177.roberto.sassu@polito.it>
Subject: Re: [linux-lvm] LVM over iSCSI
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

Ok, i made some progresses.
First, i can propagate the device mapper configuration for
the created snapshot 'lv_snap2' on other nodes by executing:

1) lvscan
2) lvchange --refresh vg_local

Last command returns these messages:

---
_get_device_info: device not found
_get_device_info: device not found
vg_local/snapshot1: snapshot segment monitoring function failed.
---

However the device mapper configurations seems ok,
because the command 'dmsetup table' shows entries
related to 'lv_snap2'.
Then, i removed the snapshot from the node that created
it and i tried to propagate the change on another node by
executing same commands above.
The command lvchange reports this message:

---
Unable to deactivate open vg_local-lv_origin (253:5)
---

and the device mapper configuration is not changed.
How i can remove device mapper entries on other nodes?

Thanks

Roberto Sassu


On Thursday, January 06, 2011 11:34:50 am Roberto Sassu wrote:
> Hi Ray
> 
> On Wednesday, January 05, 2011 09:53:33 pm Ray Morris wrote:
> > What says lvscan -vv ?
> 
> lvscan tells the 'Original' LV is inactive, 'lv_snap1' is active,
> 'lv_snap2' is inactive.
> Executing 'lvchange -ay lv_origin' does not change the status
> of 'lv_snap2'.
> If i run the command 'vgchange -ay' without 'vgchange -an',
> i get this error message:
> 
> _get_device_info: device not found
> 
> 
> Thanks
> 
> Roberto Sassu
> 
> 
> > --
> > Ray Morris
> > support@bettercgi.com
> > 
> > Strongbox - The next generation in site security:
> > http://www.bettercgi.com/strongbox/
> > 
> > Throttlebox - Intelligent Bandwidth Control
> > http://www.bettercgi.com/throttlebox/
> > 
> > Strongbox / Throttlebox affiliate program:
> > http://www.bettercgi.com/affiliates/user/register.php
> > 
> > On 01/05/2011 11:48:54 AM, Roberto Sassu wrote:
> > > Hi all
> > > 
> > > i configured a LVM volume group using two iSCSI devices as
> > > physical volumes.
> > > I designed one node (A) to create snapshots of a Logical Volume,
> > > called 'lv_origin' and i want other nodes (B, C) access them
> > > exclusively.
> > > I assume that 'lv_origin' is never modified after the first snapshot
> > > is created.
> > > So, A first creates 'lv_origin' and then a snapshot called
> > > 'lv_snap1', which is available for this node.
> > > The node B executes the command 'vgscan' and 'vgchange -ay'.
> > > In this way, 'lv_origin' and 'lv_snap1' become available for B.
> > > Next step, A creates a new snapshot of 'lv_origin' called
> > > 'lv_snap2'. This is not available for B and the only way that i
> > > found to use it is to perform (on the node B) the following
> > > commands:
> > > 
> > > 1) vgscan
> > > 2) vgchange -an
> > > 3) vgchange -ay
> > > 
> > > However this procedure is not applicable if one of created
> > > LVs is in use. How to solve this issue?
> > > 
> > > Thanks in advance for replies
> > > 
> > > Roberto Sassu
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@redhat.com
> > > https://www.redhat.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

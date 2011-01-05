Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p05HnBge005203
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 12:49:11 -0500
Received: from out1.smtp.messagingengine.com (out1.smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p05Hn09W012263
	for <linux-lvm@redhat.com>; Wed, 5 Jan 2011 12:49:01 -0500
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 90F1C20CBC
	for <linux-lvm@redhat.com>; Wed,  5 Jan 2011 12:49:00 -0500 (EST)
Received: from h2clo7.fastwebnet.it (93-38-171-154.ip71.fastwebnet.it
	[93.38.171.154])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 60FD1445B52
	for <linux-lvm@redhat.com>; Wed,  5 Jan 2011 12:49:00 -0500 (EST)
From: Roberto Sassu <roberto.sassu@polito.it>
Date: Wed, 5 Jan 2011 18:48:54 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <201101051848.55092.roberto.sassu@polito.it>
Subject: [linux-lvm] LVM over iSCSI
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

Hi all

i configured a LVM volume group using two iSCSI devices as
physical volumes.
I designed one node (A) to create snapshots of a Logical Volume,
called 'lv_origin' and i want other nodes (B, C) access them
exclusively.
I assume that 'lv_origin' is never modified after the first snapshot
is created.
So, A first creates 'lv_origin' and then a snapshot called
'lv_snap1', which is available for this node.
The node B executes the command 'vgscan' and 'vgchange -ay'.
In this way, 'lv_origin' and 'lv_snap1' become available for B.
Next step, A creates a new snapshot of 'lv_origin' called
'lv_snap2'. This is not available for B and the only way that i
found to use it is to perform (on the node B) the following
commands:

1) vgscan
2) vgchange -an
3) vgchange -ay

However this procedure is not applicable if one of created
LVs is in use. How to solve this issue?

Thanks in advance for replies

Roberto Sassu

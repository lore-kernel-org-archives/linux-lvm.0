Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7O6svV8007417
	for <linux-lvm@redhat.com>; Thu, 24 Aug 2006 02:54:57 -0400
Received: from mail-svr1.cs.utah.edu (mail-svr1.cs.utah.edu [155.98.64.241])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7O6shwr014444
	for <linux-lvm@redhat.com>; Thu, 24 Aug 2006 02:54:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail-svr1.cs.utah.edu (Postfix) with ESMTP id A295565007F
	for <linux-lvm@redhat.com>; Thu, 24 Aug 2006 00:54:37 -0600 (MDT)
Received: from mail-svr1.cs.utah.edu ([127.0.0.1])
	by localhost (mail-svr1.cs.utah.edu [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 22322-04 for <linux-lvm@redhat.com>;
	Thu, 24 Aug 2006 00:54:35 -0600 (MDT)
Received: from trust.cs.utah.edu (trust.cs.utah.edu [155.98.65.28])
	by mail-svr1.cs.utah.edu (Postfix) with ESMTP id E18A8650071
	for <linux-lvm@redhat.com>; Thu, 24 Aug 2006 00:54:35 -0600 (MDT)
Received: from localhost (localhost [127.0.0.1])
	by trust.cs.utah.edu (Postfix) with ESMTP id B58FB3F71
	for <linux-lvm@redhat.com>; Thu, 24 Aug 2006 00:54:35 -0600 (MDT)
Date: Thu, 24 Aug 2006 00:54:35 -0600 (MDT)
From: Prashanth Radhakrishnan <shanth@cs.utah.edu>
Message-ID: <Pine.LNX.4.61.0608240026110.18183@trust.cs.utah.edu>
MIME-Version: 1.0
Subject: [linux-lvm] Snapshot of an LVM snapshots?
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
To: linux-lvm@redhat.com

Hi LVM Gurus,

From what I've read around, it is not possible to take a snapshot of an 
LVM snapshot. Is this something that is worked upon currently as a future 
enhancement? If not, why not?

To give you a background, we're working on a periodic (xen) VM 
checkpointing project, using LVM for VM disk checkpointing. As we take 
several snapshots of the same volume, the write throughput reduces 
drastically. I conjecture this is because, for each write to the (base)
volume, each of the snapshots' mappings is checked to decide whether to 
copy the blocks to the snapshot or not.
It seems that this can be helped by:
- taking a snapshot of the latest snapshot and having the writes go to 
  the new snapshot
or
- making LVM use only the latest snapshot for CoW as writes go to the base 
  volume.

Any suggestions/pointers greatly appreaciated.

thanks,
Prashanth

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j24Me9n08620
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 17:40:09 -0500
Received: from hathawaymix.org (67.107.199.112.ptr.us.xo.net [67.107.199.112])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j24Me37T018365
	for <linux-lvm@redhat.com>; Fri, 4 Mar 2005 17:40:03 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by hathawaymix.org (Postfix) with ESMTP id 71089D72D6
	for <linux-lvm@redhat.com>; Fri,  4 Mar 2005 15:39:39 -0700 (MST)
Message-ID: <4228E41B.5050701@hathawaymix.org>
Date: Fri, 04 Mar 2005 15:41:31 -0700
From: Shane Hathaway <shane@hathawaymix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Using snapshots for transactions
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

My company is working on a system for storing a lot of data, for a long 
time, at low cost.  It will involve thousands of hard drives and error 
correction codes.

One piece we need in this system is a way to impose transaction 
semantics on block devices.  I've been looking everywhere for a good way 
to do this.  I was happy to discover today that the snapshot 
functionality in Linux's device mapper code comes very close to what I 
need.  Now I'm looking for assistance on figuring out how to get the 
rest of the way there.

Using LVM, I'd like to create a logical volume that consumes most of the 
space on a hard drive.  I will create a filesystem on the volume, but I 
will not mount it.  Then I'd like to create a snapshot of that volume 
and mount the snapshot read-write.  LVM and device-mapper do all of this 
well already.

Now here are the parts I'm not sure how to do:

1) Just before committing, I need to freeze the snapshot and read the 
"before" and "after" versions of all blocks changed.  The delta will be 
used to update error correction codes stored on other servers.
2) I need to atomically commit the changes I've made to the snapshot 
back to the original volume.
3) If something goes wrong during commit (power failure, etc.), I need 
to retry the commit.  (If the retry fails, I need to disable the volume.)

It's OK that this strategy results in extra I/Os.  Most of the work of 
committing a transaction can probably be done in user space if I can 
read the internal structures of the snapshot.  Also, I'd like a way to 
clear the snapshot's exception list once the transaction commits; that 
way I don't have to destroy and create snapshots for each transaction.

So, am I going in a good direction?  Does anyone have ideas, hints, or 
advice?  I can hack the kernel if I need to.

Shane

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5BJZw027627
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 15:35:58 -0400
Received: from redline.d2.com (redline.d2.com [66.251.60.228])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5BJZnXn002496
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 15:35:50 -0400
Received: from hermes.d2.com (dmz.d2.com [66.251.60.230])
	by redline.d2.com (8.12.9/8.12.9) with ESMTP id i5BJYt9D012459
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 12:34:55 -0700
Received: from mallet-l (mallet-l [172.16.51.153])
	by hermes.d2.com (8.12.2/8.12.2) with ESMTP id i5BJZhp5003997
	for <linux-lvm@redhat.com>; Fri, 11 Jun 2004 12:35:43 -0700
Date: Fri, 11 Jun 2004 12:35:43 -0700 (PDT)
From: Sebastien Boving <seb@d2.com>
Message-ID: <Pine.LNX.4.55.0406111220100.24071@mallet-l.d2.com>
MIME-Version: 1.0
Subject: [linux-lvm] cluster questions
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com



I know LVM does not support clusters.  The HOWTO makes a good job in
explaining how it is not, and how you could use it at your own risk, at:

http://tldp.org/HOWTO/LVM-HOWTO/sharinglvm1.html

I realize nothing protects an in-use LV to be mounted by another host,
which can severely corrupt non-clustered filesystems.

i still have a few questions in this regard though:


1) What are my advantages of running LVM2 instead of LVM?

LVM does all i need, i think, part from being cluster-enabled.  LVM2 is
also not clustered enabled, though it is the basis of CLVM (which is on
its way?).  Any advantages in this regard to already go to LVM2 now, even
if only cause the upgrade to CLVM will go smoother?  The only reason i
wouldn't go to LVM2 is cause my RHES3.0 supports LVM out of the box, not
LVM2, and i rather stick to included software / kernel modules / ...
unless i have a valid reason not to.

Or should i really go to EVMS?


2) Can snapshots safely be used by other nodes on the cluster?

Say a 'master node' owns the LVM config of a particular node.  It mounts
all (non-snapshot) LV's in there.  Can i have it create a snapshot on one
of its LV's, mount this on another node to perform a backup (sparing the
first node's cpu and network resources), then delete the snapshot on the
master mode, all this while observing the 'Other Nodes' procedure on the
above mentionned FAQ page?  Is this a 100% safe & supported way of doing
things?



thanks,
-seb.

Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.8])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2BJr9c0008818
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2010 14:53:09 -0500
Received: from EXHUB016-4.exch016.msoutlookonline.net
	(exhub016-4.exch016.msoutlookonline.net [207.5.72.225])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2BJqskZ031979
	for <linux-lvm@redhat.com>; Thu, 11 Mar 2010 14:52:54 -0500
Message-ID: <4B994A11.3020304@cfl.rr.com>
Date: Thu, 11 Mar 2010 14:52:49 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Is it possible to convert a snapshot to a normal volume?
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I notice that lvm now has the ability to merge the snapshot changes back
into the origin effectively throwing out the old volume and keeping the
new, but I was wondering if it is possible to decide to keep BOTH?  In
other words, try out some experimental changes to the snapshot, then
decide to keep it, without throwing out the origin?  In other words,
finish copying all of the blocks not already on the exception list so
you have two complete volumes.

Also I noticed that the man page for lvconvert says it can convert a
regular volume into a snapshot of another.  This does not make sense to
me.  Is this this the same as deleting the volume to free up space then
creating a new snapshot of the origin using that free space?

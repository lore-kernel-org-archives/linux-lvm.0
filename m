Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0OIj9114740
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 13:45:09 -0500
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.16.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0OIj2S7026434
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 13:45:02 -0500
Date: Tue, 24 Jan 2006 13:45:00 -0500 (EST)
Message-Id: <200601241845.NAA24824@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <3CBC4C64-B672-4468-A493-7192234BA001@terrascale.net> (message
	from AJ Lewis on Tue, 24 Jan 2006 08:55:41 -0600)
Subject: [linux-lvm] pvcreate can't use entire disk?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: aj@terrascale.net
Cc: linux-lvm@redhat.com, f-lvm@media.mit.edu

    Date: Tue, 24 Jan 2006 08:55:41 -0600
    From: AJ Lewis <aj@terrascale.net>

    Well, LVM1 would complain about the partition table.  I guess lvm2  
    does not, but that doesn't change the fact that neither would let you  
    write to a whole disk with a partition table on it.  I can update the  
    howto to say that is the error to expect for lvm2 when trying to use  
    a whole disk with a partition table on it.

Thanks.  I've also filed a bug report with Ubuntu (since that's the
distribution I tested this under) asking if the error message can be
made less misleading; we'll see if they fix it, push it upstream, or
whatever.  (After all, running pvcreate on a disk with a partition
table on it---whether by accident or not---has to be the single most
common non-succeeding case; it'd be nice if the error message didn't
lie about it.  If I hadn't been so cautious [and if I hadn't realized
that pvcreate's error message is wrong in LVM2] I've had just wiped
the partition table to begin with and never been mislead in the first
place.)

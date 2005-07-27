Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6R8icV00419
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 04:44:38 -0400
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.207])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6R8iWNE029881
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 04:44:32 -0400
Received: by wproxy.gmail.com with SMTP id i25so133562wra
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 01:44:27 -0700 (PDT)
Message-ID: <ca4f7e300507270144720cef7b@mail.gmail.com>
Date: Wed, 27 Jul 2005 01:44:27 -0700
From: Fury <furiosod@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Mirroring a Drive for load-balancing AND failover
Reply-To: Fury <furiosod@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: linux-lvm@redhat.com

I've racked my brain on this one, so hopefully someone will be of some help.

I'm trying to set up two servers which share a drive and do not have a
Single Point of Failure.  They are on a local network with each other.
 The best solution would be to have /dev/sda1 on one server mirrored
with /dev/sda1 on the second server.

I've looked into a few solutions.  One was DRBD.  This would work
great if I was using the second server as a hot spare, but since both
server's can't have read-write access to the drbd device
simultaneously, this won't work.

A second solution was to use GFS/GNBD.  I can export each drive to the
other server, and do RAID 1 (on both servers) between the local
/dev/sda1 and the remote gnbd device.  I then format the raid device
with GFS so both servers can mount it.

Surprisingly, this last system works.  Both systems can mount the
drive and read-write to it.  However, if either server in this
configuration drops dead, the other server cannot deal with the dead
gnbd device, and the raid device and mount point are no longer usable.
 I'm sure there are numerous other problems with this setup, also.

So I'm looking for ideas.  With two servers, how can I mirror a drive
in real-time, and allow for failover?

Thanks,
Derek

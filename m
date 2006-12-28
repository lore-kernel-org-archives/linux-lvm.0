Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBSBDFub005782
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 06:13:15 -0500
Received: from server2.dragonhold.org (server2.dragonhold.org [217.147.93.117])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBSBDElL013102
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 06:13:14 -0500
Received: from zair.dragonhold.org ([217.147.93.119])
	by server2.dragonhold.org with esmtp (Exim 4.63)
	(envelope-from <gwood@dragonhold.org>) id 1GztCA-0007BK-BD
	for linux-lvm@redhat.com; Thu, 28 Dec 2006 11:13:13 +0000
Received: from www-data by zair.dragonhold.org with local (Exim 4.63)
	(envelope-from <gwood@dragonhold.org>) id 1Gzt8r-0006re-6b
	for linux-lvm@redhat.com; Thu, 28 Dec 2006 11:09:45 +0000
Message-ID: <20061228110944.5gxv84tcg8ggg08w@www.dragonhold.org>
Date: Thu, 28 Dec 2006 11:09:44 +0000
From: Graham Wood <gwood@dragonhold.org>
Subject: RE: [linux-lvm] Mirror between different SAN fabrics
References: <OF00509E1D.6C564DF2-ONC1257252.003B531C-C1257252.003C0B39@schering.de>
In-Reply-To: <OF00509E1D.6C564DF2-ONC1257252.003B531C-C1257252.003C0B39@schering.de>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


> I haven't tried it in a cluster yet. I was planning on using HP's
> MC-ServiceGuard to deal with HA clustering. I don't see why the LUNs that
> are used on one system with mdadm can't be used another, since the RAID
> block is on the disk and is readable even on a system upon which it wasn't
> created on. /etc/mdadm.conf will ofcourse need to be copied and kept
> current on all cluster nodes, but with the config file and the RAID block
> on the disk, an "mdadm --assemble" should work. Importing the LVM
> structures should then also not be a problem.
Assuming that the underlying devices are "clean" this may indeed  
work... Sometimes.

However, things like the dirty region log are going to be a mess.

Imagine that you've got apache running on node 1 using one GFS volume,  
and mysql on the second using another - both backed onto the same md  
physical volume.  They will each be writing to the same DRL their  
dirty regions, and trampling all over each other's status information.

Then node2 crashes with some IO in progress.  In the time taken for it  
to reboot, the DRL could have been totally over-written by node1 - at  
this point there may be differences between the two underlying devices  
that you don't know about, and you've just caused data corruption.

Even if the devices were clean when the second node came up, the first  
has it open, and the fact that it's not in a clean/shutdown state is  
likely to be recorded too, and node2 is going to be unhappy about that  
too.

All in all, unless md is cluster "aware", it's likely to cause you  
trouble down the line....

Graham

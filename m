Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8EKfvr13856
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:41:57 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8EKftSa001769
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 16:41:56 -0400
Received: from [172.16.129.47] (helo=spamaps.org)
	by bedevere.spamaps.org with esmtp (Exim 3.35 #1 (Debian))
	id 1C7K7f-000533-00
	for <linux-lvm@redhat.com>; Tue, 14 Sep 2004 13:41:55 -0700
Date: Tue, 14 Sep 2004 13:41:53 -0700
Subject: Re: [linux-lvm] massive LV corruption
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <20040914200624.GE13649@copilotconsulting.com>
Message-Id: <8313B5F5-068E-11D9-BB02-000A95730E92@spamaps.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Tuesday, September 14, 2004, at 01:06 PM, Tracy R Reed wrote:

> On Tue, Sep 14, 2004 at 07:49:45AM -0700, Clint Byrum spake thusly:
>> Hans Reiser has stated that this is because each filesystem has a lock
>> on it, so while writing to, say, /home/cvs, anybody else who wants to
>> write to /home/cvs will have to wait. We have a CVS server where the
>
> That's odd given that each hard drive can only physically write to one
> place on the disk at a time anyhow due to head movement and that the
> kernel caches the writes and lays them back out on the disk with some 
> sort
> of elevator algorithm.
>

You're assuming that programs actually wait for disks! One process is 
creating a file at /home/cvs/dir1/#lockfile the other at 
/home/cvs/dir2/#lockfile. Until they run fsync, the physical disk isn't 
necessarily involved. The problem lies in the fact that with other 
filesystems, like XFS, the kernel will happily modify (at the VFS 
layer) two different dirs at one time, as they lock by meta-object (I 
won't say inode, because I don't think XFS has inodes). With ReiserFS, 
the entire partition is locked while things are modified. With a cvs 
lock file, you might not even want to call fsync() to send it to the 
disk, as the VFS layer will already have it there, and thats all you 
care about. This is one reason why using a secondary device as a 
journalling device can be so beneficial.. as you won't have to seek 
around the disk with every meta data update.

Somebody who knows what they're talking about.. feel free to shoot all 
of this down. I feel like I'm talking out of my arse a bit. ;-)

-cb

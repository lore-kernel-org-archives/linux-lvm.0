Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8PGKcr08161
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 12:20:38 -0400
Received: from bedevere.spamaps.org (ip-65-77-168-70-muca.aerosurf.net
	[65.77.168.70])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8PGKWZe027764
	for <linux-lvm@redhat.com>; Sat, 25 Sep 2004 12:20:33 -0400
Date: Sat, 25 Sep 2004 09:20:20 -0700
Subject: Re: [linux-lvm] which files, which physical volumes?
Mime-Version: 1.0 (Apple Message framework v553)
From: Clint Byrum <cbyrum@spamaps.org>
Content-Transfer-Encoding: 7bit
In-Reply-To: <4153BF33.6030008@myself.gen.nz>
Message-Id: <CB8795BC-0F0E-11D9-AF91-000A95730E92@spamaps.org>
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
To: steve@myself.gen.nz, LVM general discussion and development <linux-lvm@redhat.com>


On Thursday, September 23, 2004, at 11:31 PM, Steve Wray wrote:

> Luca Berra wrote:
>
>> On Fri, Sep 24, 2004 at 02:29:37PM +1200, Steve Wray wrote:
>>> Or maybe pvmove is *still* broken, in which case I need to find the 
>>> files which occupy that physical volume, move them to a different 
>>> logical volume altogether and then forcibly remove that physical 
>>> volume without regard to the files that are no longer on it... and 
>>> hopefuly this won't cause corruption on the filesystem on that 
>>> logical volume.
>> this will certainly cause corruption.
>
> So is there any other way to decomission that physical volume that 
> doesn't involve pvmove?
>
> Actually, this just got more interesting because after the last
> pvmove --abort I now get this error out of pvmove -tv;
>
> Insufficient contiguous allocatable extents (780) for logical volume 
> pvmove0: 1292 required
> Allocation for temporary pvmove LV failed
>
> which is new.
>
> I am guessing here, but if I moved some of the larger files out of 
> that logical volume, might pvmove be able to work around this?
>

LVM knows nothing of your files. It knows blocks, and it allocates them 
to Volume Groups and Logical Volumess without regard to whether or not 
the filesystem will use them.

Yours seems to be telling you that you can't move 1292 physical extents 
into 780. You'll have to add physical volumes (NFS mounted loopback? 
External USB harddrive?), or remove other logical volumes.

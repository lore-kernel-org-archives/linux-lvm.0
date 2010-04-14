Message-ID: <4BC5D58F.2030809@cfl.rr.com>
Date: Wed, 14 Apr 2010 10:47:43 -0400
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4BC58DF3.608@redhat.com>
In-Reply-To: <4BC58DF3.608@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems resizing physical volume
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Avi Kivity <avi@redhat.com>

On 4/14/2010 5:42 AM, Avi Kivity wrote:
> (resending, first try didn't seem to make it to the archives)
> 
> Due to dracut creating huge initrds, I now need a larger /boot.  So I'd
> like to reduce my lvm physical volume on the same disk in order to make
> room.

This doesn't directly address your issue, but I'd point out that if
/boot were itself an lv instead of a normal partition, resizing it would
be easy ;)

Personally I just leave /boot on the root lv.

> Looks like all extents are already allocated (that's the 'a', right?).
> But it claims that 10G are free!  And sure, if I create a new volume,
> space is found at extent 4384:

The output is kind of silly in that it shows the free extents too
without any indication that they are free.

>> [root@violet-regb ~]# pvmove /dev/sda2:4704-4765 /dev/sda2:4384-4445
>>   No extents available for allocation
> 
> At this point I gave up.  Is there any way to accomplish this?

pvmove normally is used to move segments off the pv to other pvs in
order to free up that pv for removal.  So it is failing since it can not
find space on other disks, since you limited its search to specific
extents on the same disk.  You need to add --alloc anywhere to stop it
from excluding the current disk from its search.  The need for this is
kind of silly given that you explicitly tell it where to move to, it
should probably be assumed, but isn't.

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1FI0Vi25831
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 13:00:31 -0500
Received: from ecstasy.winternet.com (CPE-65-25-248-192.mn.rr.com [65.25.248.192])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1FI0Vb23586
	for <linux-lvm@redhat.com>; Sun, 15 Feb 2004 13:00:31 -0500
Message-Id: <200402151809.i1FI9k224391@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040214101848.GE22753@redhat.com> (message from Heinz
	Mauelshagen on Sat, 14 Feb 2004 11:18:48 +0100)
Subject: Re: [linux-lvm] LVM Problems :)
References: <402CD9E4.8070402@demonlord.de> <20040213143846.GB10943@redhat.com> <200402132123.i1DLNfS26985@ecstasy.winternet.com> <20040214101848.GE22753@redhat.com>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Feb 15 12:59:03 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Heinz Mauelshagen wrote:

>the missing task was to shrink the LV.

Yes, I know.  The following does that (indirectly):

# resize_ext2 /<LV path>

Without the size argument this command resizes the ext2 or ext3
filesystem to fit the LV (obviating the need to calculate a new size of
the LV that fits the filesystem size which may not even be optimal if
the filesystem size is not a multiple of the extent size).

# e2fsadm --size <desired size> /<LV path>

or 

# e2fsadm --extents <desired size in extents> /<LV path>

Used to resize the LV and ext2 or ext3 filesystem in a single step.

The whole point of the above two step sequence is to avoid the
possibility of miscalculating the new size of the LV when using
lvreduce(8).  It is a safer, though longer way to effectively do a
lvreduce(8) or lvextent(8) when the contained filesystem is ext2 or
ext3.

In my opinion, this is a better solution when one is uncertain about the
correct size to use with lvreduce(8) to shrink the LV to fit either an
ext2 or ext3 filesystem.

The previous message is quoted below.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>


>On Fri, Feb 13, 2004 at 03:23:41PM -0600, Ken Fuchs wrote:
>> Heinz Mauelshagen wrote:
>> 
>> >the size of your filesystem and logical volume differs already.
>> >That's why e2fsadm fails.
>> >Did you eventually run resize2fs in order to shrink the filesystem ?
>> 
>> >Your logical volume size is 1091456MB (32MB/PE * 34108 PE) but your
>> >filesystem size is 963584GB (941GB * 1024MB/GB; check with
>> >"tune2fs -l" and look for the block count and block size to calculate
>> >this correctly).
>> 
>> >In case the result shows, that your filesystem is already smaller than the LV,
>> >lvreduce the logical volume appropriately.
>> 
>> >Use the block count * block size result and round it up to the next PE!
>> 
>> To avoid an error in calculating the correct number of logical extents,
>> and possibly doing an lvreduce(8) to a size smaller than the filesystem:
>> 
>> Use resize_ext2(8) without a size argument.  This will resize the ext2
>> or ext3 filesystem to be the same size as the logical volume containing
>> it.  After doing this, e2fsadm(8) can be used to resize the filesystem
>> and logical volume "simultaneously" to any desired size (that can
>> contain the filesystem's data).
>> 
>> Sincerely,
>> 
>> Ken Fuchs <kfuchs@winternet.com>
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>-- 
>
>Regards,
>Heinz    -- The LVM Guy --
>
>*** Software bugs are stupid.
>    Nevertheless it needs not so stupid people to solve them ***
>
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>Heinz Mauelshagen                                 Red Hat, Inc.
>Consulting Development Engineer                   Am Sonnenhang 11
>                                                  56242 Marienrachdorf
>                                                  Germany
>Mauelshagen@RedHat.com                            +49 2626 141200
>                                                       FAX 924446
>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

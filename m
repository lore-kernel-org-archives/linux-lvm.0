Return-Path: <jlundell@pobox.com>
Mime-Version: 1.0
Message-Id: <p05100307b7762dc5d8ad@[207.213.214.37]>
In-Reply-To: <E15LL3Y-0000yJ-00@the-village.bc.nu>
References: <E15LL3Y-0000yJ-00@the-village.bc.nu>
Date: Sat, 14 Jul 2001 10:33:44 -0700
From: Jonathan Lundell <jlundell@pobox.com>
Subject: [linux-lvm] Re: [PATCH] 64 bit scsi read/write
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Alan Cox <alan@lxorguk.ukuu.org.uk>, Andrew Morton <andrewm@uow.edu.au>
Cc: Andreas Dilger <adilger@turbolinux.com>, "Albert D. Cahalan" <acahalan@cs.uml.edu>, Ben LaHaise <bcrl@redhat.com>, Ragnar Kjxrstad <kernel@ragnark.vestdata.no>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, mike@bigstorage.com, kevin@bigstorage.com, linux-lvm@sistina.com

At 9:45 AM +0100 2001-07-14, Alan Cox wrote:
>  > If, after a power outage, the IDE disk can keep going for long enough
>>  to write its write cache out to the reserved vendor area (which will
>>  only take 20-30 milliseconds) then the data may be considered *safe*
>>  as soon as it hits writecache.
>
>Hohohoho.
>
>>  In which case it is perfectly legitimate and sensible for the drive
>>  to ignore flush commands, and to ack data as soon as it hits cache.
>
>Since the flushing commands are 'optional' it can legitimately ignore them
>
>>  If I'm right then the only open question is: which disks do and
>>  do not do the right thing when the lights go out.
>
>As far as I can tell none of them at least in the IDE world

It's not so great in the SCSI world either. Here's a bit from the 
Ultrastar 73LZX functional spec (this is the current-technology 
Ultra160 73GB family):

>5.0 Data integrity
>The drive retains recorded information under all non-write operations.
>No more than one sector will be lost by power down during write 
>operation while write cache is
>disabled.
>If power down occurs before completion of data transfer from write 
>cache to disk while write cache is
>enabled, the data remaining in write cache will be lost. To prevent 
>this data loss at power off, the
>following action is recommended:
>* Confirm successful completion of SYNCHRONIZE CACHE (35h) command.

What's worse, though the spec is not explicit on this point, it 
appears that the write cache is lost on a SCSI reset, which is 
typically used by drivers for last-resort error recovery. And of 
course a SCSI bus reset affects all the drives on the bus, not just 
the offending one.
-- 
/Jonathan Lundell.

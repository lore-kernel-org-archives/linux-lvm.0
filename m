Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s545dcxF023207
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2014 01:39:38 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s545da5e024589
	for <linux-lvm@redhat.com>; Wed, 4 Jun 2014 01:39:37 -0400
Message-ID: <538EB108.8020704@tlinx.org>
Date: Tue, 03 Jun 2014 22:39:20 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <CAPrERe1-+T+PpQ1gTBUSKzCjKn498TbH45Jnsrf5hrLLHgUiqA@mail.gmail.com>
	<20140507152757.GA30839@redhat.com>
In-Reply-To: <20140507152757.GA30839@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Alignment: XFS + LVM2
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Marc Caubet <mcaubet@pic.es>

Mike Snitzer wrote:
> On Tue, May 06 2014 at 11:54am -0400,
> Marc Caubet <mcaubet@pic.es> wrote:
>
>   
>> Hi all,
>>
>> I am trying to setup a storage pool with correct disk alignment and I hope
>> somebody can help me to understand some unclear parts to me when
>> configuring XFS over LVM2.
>>
>> Actually we have few storage pools with the following settings each:
>>
>> - LSI Controller with 3xRAID6
>> - Each RAID6 is configured with 10 data disks + 2 for double-parity.
>> - Each disk has a capacity of 4TB, 512e and physical sector size of 4K.
>> - 3x(10+2) configuration was considered in order to gain best performance
>> and data safety (less disks per RAID less probability of data corruption)
>>     
----
I have a similar setup and am almost certain I have 2 of them wrong as
shown below:


Model: LSI MR9280DE-8e (scsi)
Disk /dev/sda: 24.0TB
Sector size (logical/physical): 512B/512B
Partition Table: gpt_sync_mbr

Number  Start   End     Size    File system  Name       Flags
 1      17.4kB  24.0TB  24.0TB               home+shar  lvm

Model: LSI MR9280DE-8e (scsi)
Disk /dev/sdb: 12.0TB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start   End     Size    File system  Name     Flags
 1      1049kB  12.0TB  12.0TB               Backups  lvm


Model: DELL PERC 6/i (scsi)
Disk /dev/sdd: 7999GB
Sector size (logical/physical): 512B/512B
Partition Table: gpt_sync_mbr

Number  Start   End     Size    File system  Name      Flags
 1      17.4kB  7999GB  7999GB               Media      lvm

pvs says:
# pvs
  PV         VG      Fmt  Attr PSize  PFree
  /dev/sda1  HnS     lvm2 a--  21.83t 2.73t
  /dev/sdb1  Backups lvm2 a--  10.91t 3.15g
  /dev/sdd1  Media   lvm2 a--   7.28t    0
-----

Notice how each of them are starting at some weird offset.

I thought I started /dev/sdb @ 1MB, which comes out to 1048576..  so sdb 
might
be aligned on a sector boundary.....but has 6 data disks x 64K stripe, = 
384K, which
doesn't divide into 1MB evenly. 

/dev/sda has a strip-size of 768K, BUT since it is a RAID50 (3 RAID5's in a
RAID0 config), I can use 256K as a strip-size for writes, as a write of
any aligned 256K chunk will only affect 4 data disks (+ 1 parity).
>
>   
>>
>> And here is my first question: How can I check if the storage and the LV
>> are correctly aligned?
>>
>> On the other hand, I have formatted XFS as follows:
>>
>> mkfs.xfs -d su=256k,sw=10 -l size=128m,lazy-count=1 /dev/dcvg_a/dcpool
>>
>> So my second question is, are the above 'su' and 'sw' parameters correct on
>> the current LV configuration? If not, which values should I have and why?
>> AFAIK su is the stripe size configured in the controller side, but in this
>> case we have a LV. Also, sw is the number of data disks in a RAID, but
>> again, we have a LV with 3 stripes, and I am not sure if the number of data
>> disks should be 30 instead.
>>     
>
> Newer versions of mkfs.xfs _should_ pick up the hints exposed (as
> minimum_io_size and optimal_io_size) by the striped LV.
>   
----
    But mkfs.xfs won't pick up the io_size optimal inside the LSI 
controller.
That's underlying all of this.  LVM didn't try to align space to even 
some even amount
based on starting at 17.4k (i.e. would hve to round up to nearest 256 or 
384 or 768K depending
on subsystem. 
> But if not you definitely don't want to be trying to pierce through the
> striped LV config to establish settings of the underlying RAID6.
----
You have to. 
>   Each
> layer in the stack should respect the layer beneath it.
They don't.  LV doesn't determine optimal start based on partition 
start, so all of its
alignments are off.

My writes are noticeably slower than my reads sometimes by close to 10x 
(5x in more general
case). 


I hope to get another disk subsystem so I can dump those partitions and 
align them, but
also, follow Stan Hoepper's advice from the xfs list -- go with a RAID 
1+0... Then each
pair of RAID1 is independent of every other.  The worst has to be that 
768K.  It triggers a bug
in the gnu database format which assumes the optimal I/O size will be a 
power of 2
(which it is not, in my case).

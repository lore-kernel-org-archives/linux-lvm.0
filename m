Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q943kNkR023608
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2012 23:46:23 -0400
Received: from qmta14.emeryville.ca.mail.comcast.net
	(qmta14.emeryville.ca.mail.comcast.net [76.96.27.212])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q943kMo4028203
	for <linux-lvm@redhat.com>; Wed, 3 Oct 2012 23:46:22 -0400
Message-ID: <506D055E.901@mohawksoft.com>
Date: Wed, 03 Oct 2012 23:41:18 -0400
From: Mark Woodward <markw@mohawksoft.com>
MIME-Version: 1.0
References: <mailman.18903.1349274978.3548.linux-lvm@redhat.com>
	<506C5CD8.2070502@mohawksoft.com> <506CFA0B.4000006@tlinx.org>
In-Reply-To: <506CFA0B.4000006@tlinx.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] access or interface to list of blocks that have,
 changed	via C.O.W.?
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
To: Linda Walsh <lvm@tlinx.org>
Cc: linux-lvm@redhat.com

On 10/03/2012 10:52 PM, Linda Walsh wrote:
> Mark Woodward wrote:
>> There are a couple projects that do this. They are pretty much based 
>> on ddsnap. You can google it.
>> In LVM2 world, it is fairly trivial to do what you want to do.
> ---
>    I figured it was likely -- I as LVM2 has to to know what blocks
> change to make realtime snapshots.  I just am trying to figure out how
> to get a list of those blocks -- can I query some util and get the blocks
> that are different at that point?   I was figuring on using that with
> a blockmap of the fs, to get files that have changed, as I'm wanting 
> to export
> the files for smb(win client ) usage.
Well, I can honestly say that you are doing it the hard way. If you are 
connecting to a Linux box through samba, you can log the file changes.

>>
>> (1) create a virtual disk.
>> (2) take the "old" snapshot.
>> (3) write to lvdisk
>> (4) take the "new" snapshot.
>>
>>
>> At this stage the COW device of the "old" snapshot has all the data 
>> that has changed up to and including the "new" snapshot. You can back 
>> that up. As a differential. Then delete the "old" snapshot. The "new" 
>> snapshot is now renamed to the old snapshot.
> ----
>    Now here's a confusion -- back it up as a differential?  Do you
> mean from a backup utility or going from some list of blocks that have 
> changed?
I was talking about backing up the raw block level device.
>
>
>>
>> Take the next "new" snapshot. The renamed "old" snapshot has the 
>> changes since the previous snapshot up to and including the latest 
>> "new" snapshot. Just repeat this process, and you can do incremental 
>> backups of your LVM disks.
> ----
>    I'm sorta already doing the above -- it's just that I'm doing my 
> 'diff'
> with 'rsync' and it's dog-slow.  100-120 minutes for ~800GB resulting in
> about 2.5G of diff.  Then I shuffle that off to another static vol 
> sized for
> the content -- and the 'cp' usually takes about 60-70 seconds.
>
>    What's hurting me is that "incremental backup" by having to scan 
> the file
> system.
The file system is the hard way.
>>
>> The biggest issue with performance is the COW aspect of snapshots. I 
>> have found using 64K chunk sizes greatly increase performance by 
>> reducing COW to snapshots. The default size if 4K.
> ----
>    I didn't know it was that low as a default -- but am using 64K 
> already --
> as that's my RAID's 'chunksize' (I thought about experimenting with 
> larger sizes, but would like it to run in a reasonable time first.
>
>    Also I a relevant question 0-- when I do a dmsetup list, I see a 
> bunch of
> cow volumes for drives that I **had** snaps going from at one point.  
> Seems like
> the COW volumes didn't go away when halted...though it looks like, 
> from the dates, that maybe they get cleaned up at a boot(?)
>
> I only have 1 snapshot going but I see 14 cow partitions....looking like
>
> VG-Home (254, 3)
> VG-Home--2012.09.30--00.52.54   (254, 50)
> VG-Home--2012.09.30--00.52.54-cow       (254, 51)
> VG-Home--2012.10.01--04.58.11   (254, 52)
> VG-Home--2012.10.01--04.58.11-cow       (254, 53)
> VG-Home--2012.10.02--07.22.14   (254, 54)
> VG-Home--2012.10.02--07.22.14-cow       (254, 55)
> VG-Home--2012.10.03--09.08.27   (254, 56)
> VG-Home--2012.10.03--09.08.27-cow       (254, 57)
> VG-Home-real    (254, 2)
>
> So would those be the list of blocks that changed upto the point they
> were halted?
>
> Do I need to worry about those "cow" vols taking up space?
>
If they are active, not only are they taking up space, but they are also 
being updated with every write.
>
>

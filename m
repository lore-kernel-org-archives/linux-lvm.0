Message-ID: <493E7FB1.2090403@redhat.com>
Date: Tue, 09 Dec 2008 14:24:49 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] shift PV from disk to raid device?
References: <VA.000034ec.0056c987@news.conactive.com>	<493E48DE.3070705@redhat.com>
	<VA.000034ed.033a3e5f@news.conactive.com>
In-Reply-To: <VA.000034ed.033a3e5f@news.conactive.com>
Content-Transfer-Encoding: 7bit
Reply-To: bmr@redhat.com,
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: maillists@conactive.com, LVM general discussion and development <linux-lvm@redhat.com>

Kai Schaetzl wrote:
> Bryn M. Reeves wrote on Tue, 09 Dec 2008 10:30:54 +0000:
> 
> I notice that I wrote "/dev/sda" where I should have written "/dev/sda3", 
> of course. But I guess this doesn't make a difference.
> 
>> pvmove
> 
> thank you. I remember this command from reading the LVM how-to some months 
> ago, but had forgotten by now. I had checked the pvchange command, but not 
> this one. After reading man pvmove I'm not sure if using that would really 
> be helpful. If I understand correctly using it will still copy a lot of 
> data (all the data on the LVs). Basically it seems to move out all data 
> from dev/sdan to a temporary lv, then move them back in to /dev/mdn. From 

No, that's not correct. The pvmove command works entirely at the level 
of PVs - no LVs involved and no temporary LVs are created. There is a 
temporary mirror created between the source PV region and destination PV 
region and this is then synced. Once the two regions are in sync, the 
mirror is removed.

This is then repeated for each segment to be moved that is allocated on 
the source PV. The operation is checkpointed after each segment, so if 
there is a crash or sudden power failure the operation will 
automatically re-start from the beginning of segment that was being 
moved at the time of the failure.

> my non-expert view this might create a quite "unfavorable" data layout as 
> it is all happening within the same "data location" on the disk. And all 

It will use the same allocation policies as any LVM command. If you 
don't like the default you can override it via the --alloc option or 
specify explicit lists of destination PV ranges - see the man page.

> in all it might also take longer than a brute-force approach. I had hoped 

Maybe, but it's a lot less likely to wreck your data. In practice, I've 
rarely had performance problems with pvmove.

> there's some way to just move lvm metadata so that it knows it belongs to 
> /dev/mdn and not /dev/sdan anymore.

No need. Once the pvmove has completed you can remove the (now unused) 
source PV using the vgreduce command.

> So, I wonder if it isn't as good or even better if I do the following:
> 
> - break the raid array md2 
>    (made from /dev/sda3 and /dev/sdb3 with duplicate PVs)
> - remove the PV on /dev/sda3
> - recreate it and all LVs on /dev/md2
> - copy over the data from the LVs on /dev/sdb3

Up to you, I have no experience doing it this way, but this is still 
going to copy the same volume of data around. I also don't really 
understand why you want to do all this if the data is already on md2.

Regards,
Bryn.

Message-ID: <493EB3A0.6020306@redhat.com>
Date: Tue, 09 Dec 2008 18:06:24 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] shift PV from disk to raid device?
References: <VA.000034ec.0056c987@news.conactive.com>	<493E48DE.3070705@redhat.com>	<Pine.LNX.4.64.0812091146560.16428@bmsred.bmsi.com>
	<VA.000034f2.04473327@news.conactive.com>
In-Reply-To: <VA.000034f2.04473327@news.conactive.com>
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
> Stuart D. Gathman wrote on Tue, 9 Dec 2008 11:54:08 -0500 (EST):
> 
> Hallo, thanks for the suggestions. I'll try to follow that logically and with 
> possible commands, see below with comments/questions.
> 
>> 1) remove sda from md2 array
> 
> mdadm /dev/md2 --fail /dev/sda3 --remove /dev/sda3
> 
>> 2) use dd or pvremove to clear PV info in md2.  This should not
>>    affect sda since sda is removed from md2
> 
> md2 shouldn't have PV info. do you mean sdb3? (this would destroy my data on 
> sdb3 then), so:

Are you sure? If the MD array is a straightforward RAID1 mirror of two 
SD devices then the PV data should also be visible on the MD device - 
see my other post.

> vgchange dom0 -an (deactivate the LVs on sdb3)
> pvremove /dev/sdb3 ?
> After this point a pvdisplay should show /dev/sda3 as the active PV for dom0.
> (At the moment I get: "using /dev/sdb3 not /dev/sda3")
> 
>> 3) pvcreate md2 as a new PV and add to volume group
> 
> pvcreate /dev/md2
> I fear I will get "device busy", not? (just a feeling from recent experience 
> with juggling with md and lvm that are on top of each other)
> vgextend dom0 /dev/md2
> (dom0 then consists of sda3 and md2)

If there are still active LVs (or if the LVM2 tools recognise md2 as a 
PV) then you will get an error here - either that the device could not 
be opened exclusively (LVs present) or that you can't initialise the new 
PV without '-ff' as it is already part of a volume group.

Regards,
Bryn.

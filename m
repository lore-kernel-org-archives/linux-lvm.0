Received: from [10.34.131.42] (dhcp131-42.brq.redhat.com [10.34.131.42])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8K841fl013520
	for <linux-lvm@redhat.com>; Tue, 20 Sep 2016 04:04:02 -0400
References: <7e54ddf6638609d4e521287b51964ebd@dds.nl>
	<20160917134936.GF3302@soda.linbit>
	<122228b22984be95a8978ee34307176d@dds.nl>
	<20160917180224.GG3302@soda.linbit>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8442be16-d9a5-2684-5f59-a01a0da43f81@redhat.com>
Date: Tue, 20 Sep 2016 10:04:01 +0200
MIME-Version: 1.0
In-Reply-To: <20160917180224.GG3302@soda.linbit>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] creating DD copies of disks
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

Dne 17.9.2016 v 20:02 Lars Ellenberg napsal(a):
> On Sat, Sep 17, 2016 at 04:40:36PM +0200, Xen wrote:
>> Lars Ellenberg schreef op 17-09-2016 15:49:
>>> On Sat, Sep 17, 2016 at 09:29:16AM +0200, Xen wrote:
>>>> I want to ask again:
>>>>
>>>> What is the proper procedure when duplicating a disk with DD?
>>>
>>> depends on what you define as "proper",
>>> what the desired outcome is supposed to look like.
>>>
>>> What exactly are you trying to do?
>>>
>>> If you intend to "clone" PVs of some LVM2 VG,
>>> and want to be able to activate that on the same system
>>> without first deactivating the "original",
>>> I suggest:
>>>
>>> 1) create consistent snapshot(s) or clone(s) of all PVs
>>> 2) import them with "vgimportclone",
>>> which is a shell script usually in /sbin/vgimportclone,
>>> that will do all the neccessary magic for you,
>>> creating new "uuid"s and renaming the vg(s).
>>
>> Right so that would mean first duplicating partition tables etc.
>>
>> I will check that out some day. At this point it is already done, mostly. I
>> didn't yet know you could do that, or what a "clone" would be, so thank you.
>
> No. You check that out *now*.
> It does not matter how you create your "duplicates" "clones" "snapshots"
> whatever you name them. If you want, use dd. No one really cares.
> What matters is that they are consistent.
>
> Then, if you want to attach them, both original and "duplicate",
> you need to change uuids of PV and VG, and the VG name.
>
> And vgimportclone is a script that does all necessary steps for you.
>
> So no, you don't have to write scripts,
> or figure out the necessary steps.
>
> Someone else did that for you already.
> Just use it.

Hi

It might be worth to mention here -  lvm2  is your LEAST problem when you have 
duplicate device in your system.

Udevd  nor  systemd can cope with those device AT ALL.
(you will actually hardly find tool which can handle them).

So once a duplicated identifier appears in your system - all related symlinks
in /dev/by*  or  related attached systemd services  becomes just a random 
unpredictable 'garbage'.

In general user-space tools are unprepared to deal with 'identical' devices.
So IMHO lvm2 is still 'lighting years' ahead here.

You could prepare device filters to actually make your 'duplicate' device 
invisible to lvm2  (as I always HIGHLY recommend to use 'white-list' filter
and let lvm2 process only  'expected' device).
Recent version of lvm2 also do try to 'smartly' guess which one of duplicated 
device is actually in use to further increase protection of a user...

However lvmetad is yet not fully equipped for this - but at least it will 
automatically turn itself off now...

Regards

Zdenek

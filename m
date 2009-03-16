Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GLwq0Q015602
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:58:52 -0400
Received: from mckesson.com (mailgw01.mckesson.com [143.112.144.27])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2GLwcDq018335
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:58:38 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: urn:content-classes:message
In-Reply-To: <87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
References: <49BA9BF9.3070507@esiway.net><7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com><Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com><49BC511E.5040402@esiway.net><Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com><49BE9F73.8050109@gmail.com><87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com><49BEB683.7020209@gmail.com><87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com><49BEC1CC.5050900@gmail.com>
	<87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] fsync() and LVM
Date: Mon, 16 Mar 2009 16:57:27 -0500
Message-ID: <4905EFD192EEDF4A9A19EEE98C32B7F7101AEEB2@DBQV3005.na.corp.mckesson.com>
In-Reply-To: <87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
References: <49BA9BF9.3070507@esiway.net><7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com><Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com><49BC511E.5040402@esiway.net><Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com><49BE9F73.8050109@gmail.com><87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com><49BEB683.7020209@gmail.com><87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com><49BEC1CC.5050900@gmail.com>
	<87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Greg Freemyer
Sent: Monday, March 16, 2009 5:36 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] fsync() and LVM

On Mon, Mar 16, 2009 at 5:17 PM, Les Mikesell <lesmikesell@gmail.com> wrote:
> Greg Freemyer wrote:
>>
>>>> Those are some very significant subsystems. �I have to believe
>>>> filesystems have another way to implement fsync if barriers are not
>>>> supported in the stack of block susbsystems.
>>>
>>> If you can't get the completion status from the underlying layer, how can
>>> a
>>> filesystem possibly implement it?
>>
>> Barriers is a specific technology and they were just implemented in
>> linux around 2005 I think. �(see documentation/barriers.txt)
>>
>> Surely there was a mechanism in place before that.
>
> I'm not sure that's a reasonable assumption.
>
>>>> Maybe this discussion needs to move to a filesystem list, since it is
>>>> the filesystem that is responsible for making fsync() work even in the
>>>> absence of barriers.
>>>
>>> I though linux ended up doing a sync of the entire outstanding buffered
>>> data
>>> for a partition with horrible performance, at least on ext3.
>>
>> Yes, I understand fsync is horribly slow in ext3 and that may be the
>> reason. �Supposedly much better in ext4. �Still if a userspace app
>> calls fsync and in turn the filesystem does something really slow due
>> to the lack of barriers, then this conversation should be about the
>> poor performance of fsync() when using lvm (or mdraid, or drdb), not
>> the total lack of fsync() support.
>
> I haven't seen anyone claim yet that there is support for fsync(), which
> must return the status of the completion of the operation to the
> application. �If it does, then the discussion could turn to performance.
>
> --
> �Les Mikesell
> � lesmikesell@gmail.com

Is your specific interest to ext3?  If so, I suggest you post a
question there along the lines of:

Device Mapper does not support barriers if more than one physical
device is in use by the LV.  If I'm using ext3 on a LV and I call
fsync() from user space, how is fsync() implemented.  Or is it not?

The ext4 list is <linux-ext4@vger.kernel.org>.  I see some ext3 stuff
posted there, or it may have its own list.

Greg
-- 

========================================
So what happens if there is a database implemented directly on a Logical Volume, not File System involved at all?

Should the fsync man page describe what happens when used on each type of File System, Logical Volume, disk partition and /or combination?

-----
Thanks:
Jack Allen

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GLakIe004543
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:36:46 -0400
Received: from mail-qy0-f103.google.com (mail-qy0-f103.google.com
	[209.85.221.103])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2GLaS7O001105
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 17:36:28 -0400
Received: by qyk1 with SMTP id 1so1378080qyk.23
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 14:36:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49BEC1CC.5050900@gmail.com>
References: <49BA9BF9.3070507@esiway.net>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
	<49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<49BEB683.7020209@gmail.com>
	<87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>
	<49BEC1CC.5050900@gmail.com>
Date: Mon, 16 Mar 2009 17:36:27 -0400
Message-ID: <87f94c370903161436y40eddb3pe162bfa64a90e371@mail.gmail.com>
Subject: Re: [linux-lvm] fsync() and LVM
From: Greg Freemyer <greg.freemyer@gmail.com>
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
Greg Freemyer
Head of EDD Tape Extraction and Processing team
Litigation Triage Solutions Specialist
http://www.linkedin.com/in/gregfreemyer
First 99 Days Litigation White Paper -
http://www.norcrossgroup.com/forms/whitepapers/99%20Days%20whitepaper.pdf

The Norcross Group
The Intersection of Evidence & Technology
http://www.norcrossgroup.com

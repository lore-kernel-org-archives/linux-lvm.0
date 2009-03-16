Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GKtwJl011406
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:55:58 -0400
Received: from mail-qy0-f103.google.com (mail-qy0-f103.google.com
	[209.85.221.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2GKslFk023297
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 16:54:47 -0400
Received: by qyk1 with SMTP id 1so1357513qyk.23
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 13:54:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49BEB683.7020209@gmail.com>
References: <49BA9BF9.3070507@esiway.net>
	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
	<49BE9F73.8050109@gmail.com>
	<87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
	<49BEB683.7020209@gmail.com>
Date: Mon, 16 Mar 2009 16:54:47 -0400
Message-ID: <87f94c370903161354v2e43f13ci914f45175ca6af6f@mail.gmail.com>
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

On Mon, Mar 16, 2009 at 4:28 PM, Les Mikesell <lesmikesell@gmail.com> wrote:
> Greg Freemyer wrote:
>>
>>>>> you can't use LVM for anything that needs fsync(), including mail
>>>>> queues
>>>>> (sendmail), mail storage (imapd), as such. So I'd really like to know.
>>>>
>>>> fsync() is a file system call that writes dirty buffers, and then waits
>>>> for the physical writes to complete. �It is only the waiting part that
>>>> is broken.
>>>
>>> It's a yes or no question... �Fsync() either guarantees that the write is
>>> committed to physical media so the application can continue knowing that
>>> it's own transactional expectations are met (i.e. you can crash and
>>> recover
>>> that piece of data), or it is broken. �If it doesn't wait for completion,
>>> it
>>> can't possibly report the correct status.
>>>
>>
>> This discussion seems a bit bizarre to me.
>
> You can't avoid a discussion of expected but missing functionality.
>
>> Many apps require data get
>> to stable memory in a well defined way. �Barriers is certainly one way
>> to do that, but I don't think barriers are supported by LVM, mdraid,
>> or drbd.
>>
>> Those are some very significant subsystems. �I have to believe
>> filesystems have another way to implement fsync if barriers are not
>> supported in the stack of block susbsystems.
>
> If you can't get the completion status from the underlying layer, how can a
> filesystem possibly implement it?

Barriers is a specific technology and they were just implemented in
linux around 2005 I think.  (see documentation/barriers.txt)

Surely there was a mechanism in place before that.

>> Maybe this discussion needs to move to a filesystem list, since it is
>> the filesystem that is responsible for making fsync() work even in the
>> absence of barriers.
>
> I though linux ended up doing a sync of the entire outstanding buffered data
> for a partition with horrible performance, at least on ext3.

Yes, I understand fsync is horribly slow in ext3 and that may be the
reason.  Supposedly much better in ext4.  Still if a userspace app
calls fsync and in turn the filesystem does something really slow due
to the lack of barriers, then this conversation should be about the
poor performance of fsync() when using lvm (or mdraid, or drdb), not
the total lack of fsync() support.

> --
> �Les Mikesell
> � lesmikesell@gmail.com

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

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2GJanTr015981
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 15:36:50 -0400
Received: from qw-out-2122.google.com (qw-out-2122.google.com [74.125.92.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2GJaXT3017963
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 15:36:33 -0400
Received: by qw-out-2122.google.com with SMTP id 3so1671447qwe.39
	for <linux-lvm@redhat.com>; Mon, 16 Mar 2009 12:36:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <49BE9F73.8050109@gmail.com>
References: <49BA9BF9.3070507@esiway.net>
	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
	<20090313203812.GK7445@agk.fab.redhat.com>
	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>
	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>
	<49BC511E.5040402@esiway.net>
	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>
	<49BE9F73.8050109@gmail.com>
Date: Mon, 16 Mar 2009 15:36:33 -0400
Message-ID: <87f94c370903161236y197edd7ehef3dc8eefc6d617b@mail.gmail.com>
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

On Mon, Mar 16, 2009 at 2:50 PM, Les Mikesell <lesmikesell@gmail.com> wrote:
> Stuart D. Gathman wrote:
>>
>>> No, it's more than that. PostgreSQL gurus say LVM doesn't honor fsync(),
>>
>> That is clearly wrong - since fsync() isn't LVM's responsibility.
>> I think they mean that fsync() can't garrantee that any writes are
>> actually on the platter.
>>
>>> that data doesn't even get to the controller, and it doesn't matter
>>> if the disks have write caches enabled or not. Or if they have battery
>>> backed
>>> caches. Please read the thread I linked. If what they say it's true,
>>
>> That is clearly wrong. �If writes don't work, nothing works.
>>
>>> you can't use LVM for anything that needs fsync(), including mail queues
>>> (sendmail), mail storage (imapd), as such. So I'd really like to know.
>>
>> fsync() is a file system call that writes dirty buffers, and then waits
>> for the physical writes to complete. �It is only the waiting part that
>> is broken.
>
> It's a yes or no question... �Fsync() either guarantees that the write is
> committed to physical media so the application can continue knowing that
> it's own transactional expectations are met (i.e. you can crash and recover
> that piece of data), or it is broken. �If it doesn't wait for completion, it
> can't possibly report the correct status.
>

This discussion seems a bit bizarre to me.  Many apps require data get
to stable memory in a well defined way.  Barriers is certainly one way
to do that, but I don't think barriers are supported by LVM, mdraid,
or drbd.

Those are some very significant subsystems.  I have to believe
filesystems have another way to implement fsync if barriers are not
supported in the stack of block susbsystems.

Maybe this discussion needs to move to a filesystem list, since it is
the filesystem that is responsible for making fsync() work even in the
absence of barriers.

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

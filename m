Received: from [10.34.131.216] (dhcp131-216.brq.redhat.com [10.34.131.216])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u43BgmW6015387
	for <linux-lvm@redhat.com>; Tue, 3 May 2016 07:42:49 -0400
References: <929635034.3140318.1461840230292.JavaMail.yahoo.ref@mail.yahoo.com>
	<929635034.3140318.1461840230292.JavaMail.yahoo@mail.yahoo.com>
	<445afc4b9ae3fbf477f8f66db9d28580@dds.nl> <57234421.5040902@redhat.com>
	<CALm7yL05s2BrFL=C_r_BEP3jDkUgKWhRFgHSwhYNreEj9AgLNQ@mail.gmail.com>
	<57287A50.5020506@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57288EB8.9020303@redhat.com>
Date: Tue, 3 May 2016 13:42:48 +0200
MIME-Version: 1.0
In-Reply-To: <57287A50.5020506@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin handling of available space
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

On 3.5.2016 12:15, Gionatan Danti wrote:
>
> On 02/05/2016 16:32, Mark Mielke wrote:
>> The WARNING is a cover-your-ass type warning that is showing up
>> inappropriately for us. It is warning me something that I should already
>> know, and it is training me to ignore warnings. Thinp doesn't have to be
>> the answer to everything. It does, however, need to provide a block
>> device visible to the file system layer, and it isn't invalid for the
>> file system layer to be able to query about the nature of the block
>> device, such as "how much space do you *really* have left?"
>
> As this warning appears on snapshots, it is quite annoying in fact. On the
> other hand, I fully understand that the developers want to avoid "blind"
> overprovisioning. A commmand-line (or a lvm.conf) option to override the
> warning would be welcomed, though.

Since number of reports from people who used thin-pool without realizing what 
they could do wrong was too high - rather 'dramatic'  WARNING approach is 
used. Advised usage is with dmeventd & monitoring.

Danger with having 'disable' options like this is many distros do decide 
themselves about best defaults for their users, but Ubuntu with their 
issue_discards=1 shown us to be more careful as then it's not Ubuntu but lvm2 
which is blamed for dataloss.

Options are evaluated...


>
>> This seems to be a crux of this debate between you and the other people.
>> You think the block storage should be as transparent as possible, as if
>> the storage was not thin. Others, including me, think that this theory
>> is impractical, as it leads to edge cases where the file system could
>> choose to fail in a cleaner way, but it gets too far today leading to a
>> more dangerous failure when it allocates some block, but not some other
>> block.
>>
>> ...
>>
>>
>> It is your opinion that extending thin volumes to allow the file system
>> to have more information is breaking some fundamental law. But, in
>> practice, this sort of thing is done all of the time. "Size", "Read
>> only", "Discard/Trim Support", "Physical vs Logical Sector Size", ...
>> are all information queried from the device, and used by the file
>> system. If it is a general concept that applies to many different device
>> targets, and it will help the file system make better and smarter
>> choices, why *shouldn't* it be communicated? Who decides which ones are
>> valid and which ones are not?
>
> This seems reasonable. After all, a simple "lsblk" already reports plenty of
> information to the upper layer, so adding a "REAL_AVAILABLE_SPACE" info should
> not be infeasible.


What's wrong with  'lvs'?
This will give you the available space in thin-pool.

However combining this number with number of free-space in filesystem - that 
needs magic.

When you create file with hole in your filesystem - how much free space do you 
have ?

If you have 2 filesystem in a single thin-pool - each takes 1/2 ?
It's all about lying....


Regards

Zdenek

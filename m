References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
	<73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
	<CAODnkUCkbfvyq8mUpK1OEx5C1jgfmjyYauHzjcA12aGnY6kLGA@mail.gmail.com>
	<c675a85e-9739-cda9-5588-654337783182@redhat.com>
	<CAODnkUDFLBsbhCOHcqza=mDagOR7HQ1GVCoVGr2pfM6v2h3wjQ@mail.gmail.com>
	<a5d9f6e1-ae4e-845f-f1d2-a119959b6548@redhat.com>
	<CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f09e1927-e44c-a1c6-757f-ffe1c0e6a0d5@redhat.com>
Date: Thu, 24 Sep 2020 19:54:17 +0200
MIME-Version: 1.0
In-Reply-To: <CAODnkUDWBtOUkwOKSpqjh2Jguc9K9+KQfnK_w7j=EVXKgOfuVQ@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin: pool target too small
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
To: Duncan Townsend <duncancmt@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 23. 09. 20 v 21:54 Duncan Townsend napsal(a):
> On Wed, Sep 23, 2020 at 2:49 PM Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>
>> Dne 23. 09. 20 v 20:13 Duncan Townsend napsal(a):
>>> On Tue, Sep 22, 2020, 5:02 PM Zdenek Kabelac <zkabelac@redhat.com
>>> I have encountered a further problem in the process of restoring my thin pool
>>> to a working state. After using vgcfgrestore to fix the mismatching metadata
>>> using the file Zdenek kindly provided privately, when I try to activate my
>>> thin LVs, I'm now getting the error message:
>>>
>>> Thin pool <THIN POOL LONG NAME>-tpool transaction_id (MAJOR:MINOR)
>>> transaction_id is XXX, while expected YYY.
>> Set the transaction_id to the right number in the ASCII lvm2 metadata file.
> 
> I apologize, but I am back with a related, similar problem. After
> editing the metadata file and replacing the transaction number, my
> system became serviceable again. After making absolutely sure that
> dmeventd was running correctly, my next order of business was to
> finish backing up before any other tragedy happens. Unfortunately,
> taking a snapshot as part of the backup process has once again brought
> my system to its knees. The first error message I saw was:

Hi

And now you've hit an interesting bug inside lvm2 code - I've opened new BZ

https://bugzilla.redhat.com/show_bug.cgi?id=1882483

This actually explains few so far not well understood problems I've
seen before without good explanation how to hit them.

>    WARNING: Sum of all thin volume sizes (XXX TiB) exceeds the size of
> thin pool <VG>/<THIN POOL LV> and the size of whole volume group (YYY
> TiB).
>    device-mapper: message ioctl on  (MAJOR:MINOR) failed: File exists
>    Failed to process thin pool message "create_snap 11 4".
>    Failed to suspend thin snapshot origin <VG>/<THIN LV>.
>    Internal error: Writing metadata in critical section.
>    Releasing activation in critical section.
>    libdevmapper exiting with 1 device(s) still suspended.

So I've now quite simple reproducer for unhanded error case.
It's basically exposing mismatch between kernel (_tmeta) and lvm2
metadata content.  And lvm2 can handle this discovery better
than what you see now,

> There were further error messages as further snapshots were attempted,
> but I was unable to capture them as my system went down. Upon reboot,
> the "transaction_id" message that I referred to in my previous message
> was repeated (but with increased transaction IDs).

For better fix it would need to be better understood what has happened
in parallel while 'lvm' inside dmeventd was resizing pool data.

It looks like the 'other' lvm managed to create another snapshot
(and thus the DeviceID appeared to already exists - while it should not
according to lvm2 metadata before it hit problem with mismatch of
transaction_id.

> I will reply privately with my lvm metadata archive and with my
> header. My profuse thanks, again, for assisting me getting my system
> back up and running.

So the valid fix would be to take 'thin_dump' of kernel metadata
(aka content of _tmeta device)
Then check what you have in lvm2 metadata and likely you will
find some device in kernel - for which you don't have match
in lvm2 metadata -  these devices would need to be copied
from your other sequence of lvm2 metadata.

Other maybe more simple way could be to just remove devices
from xml thin_dump and thin_restore those metadata that should should
now match lvm2.

The last issue is then to match 'transaction_id' with the number
stored in kernel metadata.

So not sure which way you want to go and how important those
snapshot (that could be dropped) are ?

Zdenek

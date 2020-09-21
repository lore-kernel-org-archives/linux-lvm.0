References: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <73d0ffcd-4ed5-38b1-0d17-a4b16c7863d6@redhat.com>
Date: Mon, 21 Sep 2020 11:23:31 +0200
MIME-Version: 1.0
In-Reply-To: <CAODnkUDhzOudB_5C+esDfLp+SAm6fa9bZ+ZLFwW4ep0eG0a6Fg@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Duncan Townsend <duncancmt@gmail.com>

Dne 21. 09. 20 v 1:48 Duncan Townsend napsal(a):
> Hello!
> 
> I think the problem I'm having is a related problem to this thread:
> https://www.redhat.com/archives/linux-lvm/2016-May/msg00092.html
> continuation https://www.redhat.com/archives/linux-lvm/2016-June/msg00000.html
> . In the previous thread, Zdenek Kabelac fixed the problem manually,
> but there was no information about exactly what or how the problem was
> fixed. I have also posted about this problem on the #lvm on freenode
> and on Stack Exchange
> (https://superuser.com/questions/1587224/lvm2-thin-pool-pool-target-too-small),
> so my apologies to those of you who are seeing this again.


Hi

At first it's worth to remain which version of  kernel, lvm2, thin-tools 
(d-m-p-d package on RHEL/Fedora-   aka  thin_check -V) is this.


> I had a problem with a runit script that caused my dmeventd to be
> killed and restarted every 5 seconds. The script has been fixed, but

Kill dmeventd is always BAD plan.
Either you do not want monitoring (set to 0 in lvm.conf) - or
leave it to it jobs - kill dmeventd in the middle of its work
isn't going to end well...)


> 
> device-mapper: thin: 253:10: reached low water mark for data device:
> sending event.
> lvm[1221]: WARNING: Sum of all thin volume sizes (2.81 TiB) exceeds
> the size of thin pools and the size of whole volume group (1.86 TiB).
> lvm[1221]: Size of logical volume
> nellodee-nvme/nellodee-nvme-thin_tdata changed from 212.64 GiB (13609
> extents) to <233.91 GiB (14970 extents).
> device-mapper: thin: 253:10: growing the data device from 13609 to 14970 blocks
> lvm[1221]: Logical volume nellodee-nvme/nellodee-nvme-thin_tdata
> successfully resized.

So here was successful resize -

> lvm[1221]: dmeventd received break, scheduling exit.
> lvm[1221]: dmeventd received break, scheduling exit. > lvm[1221]: WARNING: Thin pool
> nellodee--nvme-nellodee--nvme--thin-tpool data is now 81.88% full.
> <SNIP> (lots of repeats of "lvm[1221]: dmeventd received break,
> scheduling exit.")
> lvm[1221]: No longer monitoring thin pool
> nellodee--nvme-nellodee--nvme--thin-tpool.
> device-mapper: thin: 253:10: pool target (13609 blocks) too small:
> expected 14970

And now we can see the problem - the thin-pool was already upsized to bigger
size (13609 -> 14970 as seen above) - yet something has tried to activate 
thin-pool with smaller metadata volume.


> device-mapper: table: 253:10: thin-pool: preresume failed, error = -22

This is correct - it's preventing further damage of thin-pool to happen.

> lvm[1221]: dmeventd received break, scheduling exit.
> (previous message repeats many times)
> 
> After this, the system became unresponsive, so I power cycled it. Upon
> boot up, the following message was printed and I was dropped into an
> emergency shell:
> 
> device-mapper: thin: 253:10: pool target (13609 blocks) too small:
> expected 14970
> device-mapper: table: 253:10: thin-pool: preresume failed, error = -22


So the primary question is - how the LVM could have got 'smaller' metadata
back - have you played with  'vgcfgrestore' ?

So when you submit version of tools - also provide  /etc/lvm/archive
(eventually lvmdump archive)

> I have tried using thin_repair, which reported success and didn't
> solve the problem. I tried vgcfgrestore (using metadata backups going
> back quite a ways), which also reported success and did not solve the
> problem. I tried lvchange --repair. I tried lvextending the thin


'lvconvert --repair' can solve only very basic issues - it's not
able to resolve badly sized metadata device ATM.

For all other case you need to use manual repair steps.


> I am at a loss here about how to proceed with fixing this problem. Is
> there some flag I've missed or some tool I don't know about that I can
> apply to fixing this problem? Thank you very much for your attention,

I'd expect in your /etc/lvm/archive   (or in the 1st. 1MiB of your device 
header) there can be seen a history of changes of your lvm2 metadata and you 
should be able ot find when then _tmeta LV was matching your new metadata size
and maybe see when it's got previous size.

Without knowing more detail it's hard to give precise answer - but before you
will try to do some next steps of your recovery be sure you know what you
are doing - it's better to ask here the be sorry later.

Regards

Zdenek

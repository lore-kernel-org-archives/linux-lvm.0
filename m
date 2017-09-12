Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5FD586267E
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 12:37:43 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3F5304E4C6
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 12:37:40 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 3719F4062A51
	for <linux-lvm@redhat.com>; Tue, 12 Sep 2017 14:37:38 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Tue, 12 Sep 2017 14:37:38 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
Message-ID: <5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 12-09-2017 13:46:

> What's wrong with BTRFS....

I don't think you are a fan of it yourself.

> Either you want  fs & block layer tied together - that the btrfs/zfs 
> approach

Gionatan's responses used only Block layer mechanics.

> or you want
> 
> layered approach with separate 'fs' and block layer  (dm approach)

Of course that's what I want or I wouldn't be here.

> If you are advocating here to start mixing 'dm' with 'fs' layer, just
> because you do not want to use 'btrfs' you'll probably not gain main
> traction here...



You know Zdenek, it often appears to me your job here is to dissuade 
people from having any wishes or wanting anything new.

But if you look a little bit further, you will see that there is a lot 
more possible within the space that you define, than you think in a 
black & white vision.

"There are more things in Heaven and Earth, Horatio, than is dreamt of 
in your philosophy" ;-).

I am pretty sure many of the impossibilities you cite spring from a 
misunderstanding of what people want, you think they want something 
extreme, but it is often much more modest than that.

Although personally I would not mind communication between layers in 
which providing layer (DM) communicates some stuff to using layer (FS) 
but 90% of the time that is not even needed to implement what people 
would like.

Also we see ext4 being optimized around 4MB block sizes right? To create 
better allocation.

So that's example of "interoperation" without mixing layers.

I think Gionatan has demonstrated that pure block layer functionality, 
is possible to have more advanced protection ability that does not need 
any knowledge about filesystems.






> We  need to see EXACTLY which kind of crash do you mean.
> 
> If you are using some older kernel - then please upgrade first and
> provide proper BZ case with reproducer.

Yes apologies here, I responded to this thing earlier (perhaps a year 
ago) and the systems I was testing on was 4.4 kernel. So I cannot 
currently confirm and probably is already solved (could be right).

Back then the crash was kernel messages on TTY and then after some 20-30 
seconds total freeze. After I copied too much data to (test) thin pool.

Probably irrelevant now if already fixed.

> BTW you can imagine an out-of-space thin-pool with thin volume and
> filesystem as a FS, where some writes ends with 'write-error'.
> 
> 
> If you think there is OS system which keeps running uninterrupted,
> while number of writes ends with 'error'  - show them :)  - maybe we
> should stop working on Linux and switch to that (supposedly much
> better) different OS....

I don't see why you seem to think that devices cannot be logically 
separated from each other in terms of their error behaviour.

If I had a system crashing because I wrote to some USB device that was 
malfunctioning, that would not be a good thing either.

I have said repeatedly that the thin volumes are data volumes. Entire 
system should not come crashing down.

I am sorry if I was basing myself on older kernels in those messages, 
but my experience dates from a year ago ;-).

Linux kernel has had more issues with USB for example that are 
unacceptable, and even Linus Torvalds himself complained about it. 
Queues filling up because of pending writes to USB device and entire 
system grinds to a halt.

Unacceptable.

> You can have different pools and you can use rootfs  with thins to
> easily test i.e. system upgrades....

Sure but in the past GRUB2 would not work well with thin, I was basing 
myself on that...

I do not see real issue with using thin rootfs myself but grub-probe 
didn't work back then and OpenSUSE/GRUB guy attested to Grub not having 
thin support for that.

> Most thin-pool users are AWARE how to properly use it ;)  lvm2 tries
> to minimize (data-lost) impact for misused thin-pools - but we can't
> spend too much effort there....

Everyone would benefit from more effort being spent there, because it 
reduces the problem space and hence the burden on all those maintainers 
to provide all types of safety all the time.

EVERYONE would benefit.

> But if you advocate for continuing system use of out-of-space
> thin-pool - that I'd probably recommend start sending patches...  as
> an lvm2 developer I'm not seeing this as best time investment but
> anyway...

Not necessarily that the system continues in full operation, 
applications are allowed to crash or whatever. Just that system does not 
lock up.

But you say these are old problems and now fixed...

I am fine if filesystem is told "write error".

Then filesystem tells application "write error". That's fine.

But it might be helpful if "critical volumes" can reserve space in 
advance.

That is what Gionatan was saying...?

Filesystem can also do this itself but not knowing about thin layer it 
has to write random blocks to achieve this.

I.e. filesystem may guess about thin layout underneath and just write 1 
byte to each block it wants to allocate.

But feature could more easily be implemented by LVM -- no mixing of 
layers.

So number of (unallocated) blocks are reserved for critical volume.

When number drops below "needed" free blocks for those volumes, system 
starts returning errors for volumes not that critical volume.

I don't see why that would be such a disturbing feature.

You just cause allocator to error earlier for non-critical volumes, and 
allocator to proceed as long as possible for critical volumes.

Only think you need is runtime awareness of available free blocks.

You said before this is not efficiently possible.

Such awareness would be required, even if approximately, to implement 
any such feature.

But Gionatan was only talking about volume creation in latest messages.


>> However, from both a theoretical and practical standpoint being able 
>> to just shut down whatever services use those data volumes -- which is 
>> only possible
> 
> Are you aware there is just one single page cache shared for all 
> devices
> in your system ?

Well I know the kernel is badly designed in that area. I mean this was 
the source of the USB problems. Torvalds advocated lowering the size of 
the write buffer.

Which distributions then didn't do and his patch didn't even make it 
through :p.

He said "50 MB write cache should be enough for everyone" and not 10% of 
total memory ;-).

> Again do you have use-case where you see a crash of data mounted volume
> on overfilled thin-pool ?

Yes, again, old experiences.

> On my system - I could easily umount such volume after all 'write' 
> requests
> are timeouted (eventually use thin-pool with --errorwhenfull y   for
> instant error reaction.

That's good, I didn't have that back then (and still not).

It is Debian 8 / Kubuntu 16.04 systems.

> So please can you stop repeating overfilled thin-pool with thin LV
> data volume kills/crashes machine - unless you open BZ and prove
> otherwise -  you will surely get 'fs' corruption  but nothing like
> crashing OS can be observed on my boxes....

But when I talked about this a year ago you didn't seem to comprehend I 
was talking about an older system (back then not so old) or acknowledged 
that these problems had (once) existed, so I also didn't know they would 
now already be solved.

Sometimes if you just acknowledge problems were there before but not 
anymore, makes it a lot easier.

We spoke about this topic a year ago as well, and perhaps you didn't 
understand me because for you the problems were already fixed (in your 
LVM).

> We are here really interested in upstream issues - not about missing
> bug fixes  backports into every distribution  and its every released
> version....

I understand. But it's hard for me to know which is which.

These versions are in widespread use.

Compiling your own packages is also system maintenance burden etc.

So maybe our disagreement back then came from me experiencing something 
that was already solved upstream (or in later kernels).

>> He might be able to recover his system if his system is still allowed 
>> to be logged into.
> 
> There is no problem with that as long as  /rootfs has consistently 
> working fs!

Well I guess it was my Debian 8 / kernel 4.4 problem then...

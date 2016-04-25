Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3PDJkG3017498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 09:19:46 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DC84E627C4
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 13:19:43 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 130957FBB9
	for <linux-lvm@redhat.com>; Mon, 25 Apr 2016 15:19:41 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Mon, 25 Apr 2016 13:19:41 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <CAFDa5Q2qAxQDzCRLaepjijJDinG6QzUHZo-7BVDscC06R-mZzw@mail.gmail.com>
References: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
	<CAFDa5Q2qAxQDzCRLaepjijJDinG6QzUHZo-7BVDscC06R-mZzw@mail.gmail.com>
Message-ID: <de72d0e2d247be3d0e8caedda2c600ea@dds.nl>
Subject: Re: [linux-lvm] is lvmcache really ready?
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

Dax Kelson schreef op 23-04-2016 18:10:
> I don't always write emails, but when I do, it's a stream of
> consciousness.

;-).

> We use LVM Cache in production in the infrastructure hosting our
> online classroom environment. The read requests hitting our origin LV
> dropped by 90%. We're pretty happy with it.
> 
> I wish you could have multiple origin LVs using the same cache pool.

Thanks. Yeah that's what the article said bcache supports. Now you may 
need to cache an LV that is itself an LVM container ;-) (PV).

Regards.



> 
> Dax Kelson
> 
> On Apr 23, 2016 10:54 AM, "Xen" <list@xenhideout.nl> wrote:
> 
>> Attempting to join this list, but the web interface is down.
>> 
>> I am interested in using lvmcache but I hear the performance is very
>> meagre, that was a thread from 2014 that I was reading. But a recent
>> blog post said the same:
>> 
>> https://www.rath.org/ssd-caching-under-linux.html
>> 
>> This guy tries first lvmcache and performance is not noticable. Then
>> he uses bcache and it works like a charm.
>> 
>> He was using regular partitions on regular disks. Nothing raid going
>> on. But he tried to increase boot speeds and did not notice
>> anything.
>> 
>> Setting the promote adjustments to zero made no difference.
>> 
>> Is this feature defunct? I mean, is this really a usable and
>> functional thing? From what it seems, I think not.
>> 
>> I'll have a small mSATA SSD to test with shortly, but... if this
>> thing is so bugged that it keeps reading from the origin device
>> anyway, there's not much point to it.
>> 
>> The reason I'm wanting to use it at this point is to speed up
>> booting (although unimportant) but mostly to make a more snappy
>> system while running, ie. for instance just application startup.
>> 
>> At the same time that would decouple my system from my data by using
>> that small SSD for the system (by way of the cache) such that system
>> seeks do not any longer effect the performance of other operations
>> on the device (that also holds that 'data').
>> 
>> It don't mind having writeback for this because any (small) delay in
>> writing to the origin would work well with this strategy.
>> 
>> Some IO is buffered anyway and you might think with 8GB of RAM you
>> could have some IO buffering normally, but a cache is something that
>> buffers between reboots, so to speak.
>> 
>> I'm simply trying to see what improvements I can get with LVM.
>> 
>> That aside, I think it is annoying that on Debian systems and Ubuntu
>> and Kubuntu, thin-provisioning-tools is still not included by
>> default, and you also need to create that initramfs hook to have the
>> files included into the initramfs. Then, Grub2 also does not support
>> thin LVM volumes at all and although you can boot fine on a thin
>> root, grub-probe will not be able to process these volumes,
>> complain, and exit.
>> 
>> Personally I think snapshotting on thin is much more usable, if
>> that's what you want to use. No necessity to allocate
>> sufficiently-sized volumes in advance. I tried to ask on #lvm but
>> they were not helpful.
>> 
>> I don't really get why LVM is being so neglected other than the
>> popularity of btrfs these days.
>> 
>> LVM is much more modular and very easy to work with normally.
>> Commands make sense for the most part and the only thing that is
>> missing is a nice gui.
>> 
>> (I was even writing... some snapshot to incremental backup script at
>> some point).
>> 
>> LVM is one of the saner things still existing in Linux from my
>> perspective, even if it doesn't feel perfect, but that is more due
>> to the fact that you are using software emulation of partitions in a
>> way that kinda tries to "avoid" having to do it in "firmware" -- in
>> that sense that you are trying to do what regular partitions can't.
>> 
>> Someone called this "deferred design" I believe.
>> 
>> Because of this fact I believe it cannot really actually fully work
>> out (for me) I believe particularly when it comes to
>> cross-platformness and encryption as, in the same way, I prefer a
>> firmware/bios environment for managing RAID arrays rather than just
>> software.
>> 
>> At the same time with UEFI et al. my opinion is just the reverse:
>> let the boot loader please be software in some way. Even if it's a
>> menu. At least you can adjust your software, the firmware you might
>> not have a say about.
>> 
>> Deferred design, when Linux tools do everything a regular computer
>> firmware environment should. And then they created UEFI and tried to
>> take stuff away that does belong to the operating system.
>> 
>> While not creating anything that would work better except for GPT
>> disks.
>> 
>> I just want to ask a question though about thin LVM, but I will ask
>> in another email.
>> 
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

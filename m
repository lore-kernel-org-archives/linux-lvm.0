Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r1S8gjrk019021
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2013 03:42:45 -0500
Received: from mail-vc0-f176.google.com (mail-vc0-f176.google.com
	[209.85.220.176])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r1S8gicA000810
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2013 03:42:44 -0500
Received: by mail-vc0-f176.google.com with SMTP id fk10so1032272vcb.35
	for <linux-lvm@redhat.com>; Thu, 28 Feb 2013 00:42:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAEZ+n-gv=9Gdg8b3xKW5JraNVvRhc3fqiYUvL+6vt4Wrdda02A@mail.gmail.com>
References: <CAEZ+n-hGcgRPvc+Rx1co3G_Bd-n8mC+5LUhdkSqiz9PRdtt27Q@mail.gmail.com>
	<20130227100446.GB2459@raspberrypi>
	<CAEZ+n-gv=9Gdg8b3xKW5JraNVvRhc3fqiYUvL+6vt4Wrdda02A@mail.gmail.com>
Date: Thu, 28 Feb 2013 21:42:43 +1300
Message-ID: <CAEHxbC0Z2t+BknBqEfPU-05MSiZGgdEUNbHTbORBea5LncpOwA@mail.gmail.com>
From: Greg Zapp <greg.zapp@gmail.com>
Subject: Re: [linux-lvm] How does LVM-Cache work?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I see reference of another dm-cache from ming zhao as far back as
2007.  Found a link here https://github.com/mingzhao/dm-cache.  Does
anybody know the history behind this stuff?  I would have expected one
of these solutions to be pushed upstream by now considering how much
interest is around tiered storage..

On Thu, Feb 28, 2013 at 7:30 AM, Leo Antonio <heiligerstein@gmail.com> wrote:
> Thanks for answers.
>
>
> I take a look in dm-cache-target, I really dont knew this project.
>
> Joe, what is the best way to continue this discussion?
>
> Do you have some documentation besides what is into kernel source, like
> Papers, Architecture Projects etc?
> What is the best way to start to understand this?
>
>
> Thanks!
>
>
> 2013/2/27 <thornber@redhat.com>
>
>> On Tue, Feb 26, 2013 at 03:44:43PM -0300, Leo Antonio wrote:
>> > Hello, everyone.
>> >
>> > I'm willing to do research about second-level cache using SSDs and I
>> > think
>> > that the best way to do this is using LVM/Device Mapper, because other
>> > implementations are based on FUSE, virtualization layers, and others.
>> >
>> > What I'm trying to do is to develop a subsystem that will put hot
>> > blocks/PEs on SSDs-Cache, as well as group related blocks/PEs on cache
>> > automatically. Not simply put on SSD the most  used files or
>> > directories.
>> >
>> > The problem is that I could not find any documentation about DM or LVM
>> > to
>> > help my research and development.
>> >
>> > Could you point me to some documentation or what's the best way to
>> > accomplish this?
>>
>> See my dm-cache target in this branch of my tree:
>>
>> https://github.com/jthornber/linux-2.6/tree/thin-dev
>>
>>
>> https://github.com/jthornber/linux-2.6/blob/thin-dev/drivers/md/dm-cache-target.c
>>
>> There's still a lot of work to do on the policy plug-ins, so if you
>> like to get involved that would be great.
>>
>> - Joe
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

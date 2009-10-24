Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9OKt4L0008312
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 16:55:04 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.155])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9OKsjxo009324
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 16:54:46 -0400
Received: by fg-out-1718.google.com with SMTP id d23so562723fga.9
	for <linux-lvm@redhat.com>; Sat, 24 Oct 2009 13:54:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910241216t4cd9d0d9j6e3ccfa6db4c4137@mail.gmail.com>
References: <c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com>
	<a5a956f70910211203l62dc17e6nfa727804bdd1d1cb@mail.gmail.com>
	<20091023065219.GA8733@maude.comedia.it>
	<a5a956f70910231206g725675e2r8ede59194cd08600@mail.gmail.com>
	<4AE20E43.2060006@worldspice.net>
	<a5a956f70910231341t249fd149h79685dadd91d2303@mail.gmail.com>
	<20091024000642.GA30974@bdmcc-us.com>
	<a5a956f70910240943u3558a466je5c9a0073ed5f8fa@mail.gmail.com>
	<29ae894c0910241004k327b0ff8w6577b83af3701753@mail.gmail.com>
	<a5a956f70910241216t4cd9d0d9j6e3ccfa6db4c4137@mail.gmail.com>
Date: Sat, 24 Oct 2009 22:54:44 +0200
Message-ID: <29ae894c0910241354k67768707je61a9d25d3c14f6@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
From: brem belguebli <brem.belguebli@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Lou,

Who is talking about unmounting root ?

I'm just saying shrinking should be possible online as long as some
conditions are met (FS usage less than X %, reduced fragmentation ...)

Of course, this kind of procedure requiring a max of caution because
of the high risk of data loss, I'm not sure it'll get implemented in
the current tools.



2009/10/24, Lou Arnold <larnolda1@gmail.com>:
> Hahaha. Brem, you and I think alike. If you can do it let me know. I don't
> think people can think of a way to keep the system on-line and yet dismount
> root so that LVM commands can work on it. If you can make it work, I'll buy
> you a virtual beer.
> Regards,
> Lou.
>
> On Sat, Oct 24, 2009 at 10:04 AM, brem belguebli
> <brem.belguebli@gmail.com>wrote:
>
>> It's non sense arguing that LVM is not intended for root due to the
>> fact that you cannot shrink it  (growing online is operational and
>> works fine).
>>
>> This is the only thing that is not allowed, though technically could
>> it be possible.
>>
>>
>>
>> 2009/10/24, Lou Arnold <larnolda1@gmail.com>:
>>  > Haha, Yes, it would have been nice for someone to have told me about
>> LVM and
>> > root. It would have saved literally days of time. But my work is
>> > experimental and never with production system. In any case, now I know
>> > better.
>> >
>> > As for the LiveCD suggestion, I did not intend to discount it. I had in
>> fact
>> > tried it several times, but with  some success. It probably just a
>> > matter
>> of
>> > finger problems for the failures. But I truly expected a graceful
>> > dismantling process without the need of shutting down the system.
>> >
>> > This was in fact a good experience. When you have to dig into things to
>> > understand why something works or doesn't work, you are always luckier
>> than
>> > if things go perfectly right from the beginning.
>> >
>> > Thanks to everyone for your help.
>> > Lou.
>> >
>> >
>> >
>> > On Fri, Oct 23, 2009 at 5:06 PM, Brian McCullough <bdmc@bdmcc-us.com>
>> wrote:
>> >
>> >> On Fri, Oct 23, 2009 at 01:41:23PM -0700, Lou Arnold wrote:
>> >> > Ryan, Thanks for your suggestion. I know it works, but I had hoped to
>> >> have a
>> >> > solution that didn't stop the whole system while I fixed it.
>> >> >
>> >> > To Drew:
>> >> > I think you were quite right when you spoke about planning the file
>> >> system.
>> >> > I've come to realize that my question is somewhat naive. One simply
>> >> doesn't
>> >> > do what I wanted to exactly because there is no easy way to dismantle
>> >> > it.
>> >> It
>> >> > would be better to partition off some part of the OS drive and add
>> that
>> >> to a
>> >> > new volume group (or a new logical volume group) and mount that under
>> >> > "/mnt", and then add whatever partitions on new drives to that
>> >> > logical
>> >> > volume. That logical volume could be dismounted and worked on,
>> >> > whereas
>> >> > whatever is under root cannot be worked on easily.
>> >>
>> >>
>> >> Lou,
>> >>
>> >> I'm surprised that you haven't yet been told that one of the first
>> >> rules
>> >> of
>> >> LVM is "don't use it for root!"  Actually, I don't really hold with
>> that,
>> >> but it is MUCH more important to plan what you are doing when you do
>> have
>> >> an
>> >> LVM root partition.  As you have found, you can not manipulate an LVM
>> >> partition while it is mounted. ( I know, there are ways for certain
>> types
>> >> of
>> >> filesystems, but in general, the rule holds. )  That is especially true
>> >> when
>> >> the partition that you want to manipulate is root ( / ).
>> >>
>> >> My general practice is to set up the following list of Logical Volumes
>> >> (
>> >> the minimum which serves for most general purpose machines ): root,
>> swap,
>> >> home, usr, var.  I generally allocate somewhere around 1G for the root
>> >> partition.  The others are sized appropriately for the environment.
>>  That
>> >> usually leaves me a lot of free space on modern drives for "data"
>> >> space.
>> >>
>> >> The recommendation that you should find a LiveCD at this point is
>> probably
>> >> one that you should respect.  Playing with mounted filesystems,
>> >> particularly
>> >> root, can rapidly lead you down a very nasty path.
>> >>
>> >>
>> >> Brian
>> >>
>> >> _______________________________________________
>> >> linux-lvm mailing list
>> >> linux-lvm@redhat.com
>> >> https://www.redhat.com/mailman/listinfo/linux-lvm
>> >> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>> >>
>> >
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>

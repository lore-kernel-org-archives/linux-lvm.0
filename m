Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2278JK21479
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 02:08:19 -0500
Received: from mail02.malor.com (host.malor.com [69.93.140.74] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2278DjR019679
	for <linux-lvm@redhat.com>; Wed, 2 Mar 2005 02:08:13 -0500
Received: from vanish (mail02.malor.com [127.0.0.1])
	by mail02.malor.com (Postfix) with SMTP id 96D414A00C
	for <linux-lvm@redhat.com>; Wed,  2 Mar 2005 01:08:00 -0600 (CST)
Message-ID: <000301c51ef6$9541e940$32dcdc0a@vanish>
From: "Ron Watkins" <rwatkins@malor.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAAjSM60k4xEkucgZ6Kc849MwEAAAAA@echohome.org>
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
Date: Wed, 2 Mar 2005 02:08:06 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: LVM general discussion and development <linux-lvm@redhat.com>

Unfortunately, RAID5 just isn't very flexible.   In exchange, you get to use 
most of your purchased drive space, you don't have to spend a mountain of 
money, and you get pretty reasonable speed.  (slow on writes, quite fast on 
reads).  RAID-10 is faster, and can often take more drives failing (small 
chance of up to half), but costs you 50% of your storage space.

It's a bit suboptimal, but you can, using LVM, expand a RAID-5, by adding 
more discrete RAID-5 PVs.  Each individual RAID array should be made from 
similar drives, but you can stripe across multiple physical RAIDs that way. 
This is, however, less reliable.  Whenever you stripe across multiple 
volumes, if any of the volumes fail, you lose everything.  RAID5 volumes are 
less likely to fail, but whatever that risk is, you're taking multiples of 
that risk by striping across multiple volumes.

I'm sorry I was so annoyed-sounding, I don't normally flame too much.  That 
last question I asked was actually somewhat serious... what is your data 
WORTH?  If it's just stuff you can easily recreate, like video files off 
Usenet, then you may not need a RAID at all.  Just join all your existing 
disks together.  You have a high chance of failure that way, but if you 
don't care about the data, big deal.  A failure just costs you some 
rebuilding time.

If you do care about the data, and it sounds like you do, think about how 
much it would cost you to replace, and budget accordingly.  My pointed words 
were coming from a background of 'data loss is a catastrophe!'.  If it's not 
unique/irreplaceable, maybe just burning it to CD every once in awhile would 
be enough.

If you really do want the data protection of a RAID, your design won't get 
you there. Do it right... spend enough money to do a good job.  Otherwise, 
just back up stuff you care about.

You can often save money by being clever, but RAID itself is already 
exceedingly clever.  No matter how much thinking time you do, you're not 
likely to improve on it much.

----- Original Message ----- 
From: "Erik Ohrnberger" <erik@echohome.org>
To: "'LVM general discussion and development'" <linux-lvm@redhat.com>
Sent: Tuesday, March 01, 2005 11:27 PM
Subject: RE: [linux-lvm] Building up a RAID5 LVM home server (long)


> Ron,
>    Well, there is no mistaking this feedback  ;-)
>
>    Thanks for the direct, succinct feedback.  I think you are right in 
> your
> points.
>
>    The search goes on to balance flexibility, cost, and benefits, as
> always.
>
>    Erik.
>
>> -----Original Message-----
>> From: linux-lvm-bounces@redhat.com
>> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Ron Watkins
>> Sent: Tuesday, March 01, 2005 11:10 PM
>> To: Erik@echohome.org; LVM general discussion and development
>> Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
>>
>>
>> This is absolutely insane.   It is among the dumbest designs
>> I've ever seen.
>> You are using HDA as a component in MD0 and MD1, and then
>> using HDA AGAIN as
>> part of MD2 directly, while using it indirectly via MD0 and
>> MD1.   You're
>> going to A) bottleneck on HDA, B) you're going to beat that
>> drive to death,
>> and C) if that drive goes, you are HOSED.  Plus, you are just
>> begging for
>> problems with potential bugs in the RAID driver code.  This
>> whole setup is
>> an INCREDIBLY bad idea.  You're trying to 'be clever' to save
>> yourself some
>> money, and all you're doing is buying trouble.
>>
>> The way RAID5 is meant to work is with disks of approximately
>> the same size.
>> RAID5 is not expandable, unless you have a very expensive hardware
>> controller.  There are algorithms that will let you expand
>> the size of a
>> RAID5 volume, but they have not, to my knowledge, been
>> implemented in open
>> source.   You CANNOT do what you want to do, cheaply.  You
>> can spend a great
>> deal of money to satisfy most of your design parameters, but
>> NOT cheaply.
>> If you want it cheap, use fixed drives of about the same
>> size, and don't
>> think about expansion.  When you're ready to expand, hook up
>> another, bigger
>> RAID and copy your data.   In NO case can you use that
>> hodgepodge of junk
>> drives you've collected.
>>
>> Most of your drives are obsolete.  Keep the biggest one, buy
>> at least two
>> more of the same size, and set up a RAID5 using that.  All
>> this monkeying
>> around to try to extract some last value from drives totally
>> ill-suited for
>> the purpose is going to cost you far, far more than new
>> drives ever could.
>>
>> Hell, keep the smaller ones around, put them into a concatenated LVM2
>> volume, and use them as a backup.  It's not the best backup
>> in the world,
>> but it's better than nothing.
>>
>> Do it right.  This is your data you're trying to save.  You
>> can get very
>> nice 250-gig PATA Western Digital drives for $165 from
>> www.newegg.com.  They
>> are specifically designed for RAID.  Buy 4 and save yourself
>> this massive
>> headache.  If you don't need that much space, buy smaller drives.
>>
>> Or, you can persist in trying to be clever, but it's a
>> virtual *certainty*
>> you're going to lose data if you go this route.  Pay now, or
>> pay later.
>> What's your data worth?
>>
>> <<RON>>
>>
>> ----- Original Message ----- 
>> From: "Erik Ohrnberger" <erik@echohome.org>
>> To: "'LVM general discussion and development'" <linux-lvm@redhat.com>
>> Sent: Tuesday, March 01, 2005 10:27 PM
>> Subject: RE: [linux-lvm] Building up a RAID5 LVM home server (long)
>>
>>
>> >
>> > ... SNIP ...
>> >> >What if the I broke everything into 10 GB pieces, and
>> >> created multiple
>> >> >raid5 sets?  Then I could LVM2 them together and have a large
>> >> >filesystem that way.
>> >> >
>> >> >a=20GB, b=30GB, c=40GB
>> >> >
>> >> >a-1 + b-1 + c-1 = md0 (approx 30 GB storage)
>> >> >a-2 + b-2 + c-2 = md1 (approx 30 GB storage)
>> >> >      b-3 + c-3 = md2 (waiting for one more drive)
>> >> >            c-4 = md3 (waiting for two more drives)
>> >> >
>> >> >
>> >> This is sorta what I do.  But in my opinion the gain of
>> having RAID5
>> >> (over RAID1) is when you get over 3 disks...  at 3 disks you are
>> >> burning 33% for redudnacy... 25% or 20% or  17% sounds
>> better to me.
>> >> I guess if
>> >> you go too far it costs in calculating the parity.
>> >
>> > Overhead: Yea, OK. Nothing is without a price.
>> > I fooled around with various ideas, and came up with this for my
>> > particulars:
>> > (Note, rounded to nearest GB)
>> >
>> > 80 GB /dev/hda 60 GB /dev/hdb 40 GB /dev/hdc 45 GB
>> > /dev/hdd
>> >
>> > GB /dev/md0 (RAID0)
>> > 40 /dev/hdc
>> > 15 /dev/hda1
>> > 55
>> >
>> > /dev/md1 (RAID0)
>> > 45 /dev/hdd
>> > 10 /dev/hda2
>> > 55
>> >
>> > /dev/md2 (RAID5)
>> > 55 /dev/md0
>> > 55 /dev/md1
>> > 55 /dev/hda3
>> > 55 /dev/hdb
>> > 220
>> >
>> > Yea, OK, so like the 220 is a bit optimistic, but should get pretty
>> > close
>> > to
>> > that.
>> >
>> > What do you think?
>> >
>> >
>> > _______________________________________________
>> > linux-lvm mailing list
>> > linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-> lvm
>> > read the
>> LVM HOW-TO at
>> http://tldp.org/HOWTO/LVM-HOWTO/
>> >
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

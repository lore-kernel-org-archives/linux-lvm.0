Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j224AHK27711
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 23:10:17 -0500
Received: from mail02.malor.com (host.malor.com [69.93.140.74] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j224ABxj028453
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 23:10:11 -0500
Message-ID: <000301c51edd$bc175aa0$32dcdc0a@vanish>
From: "Ron Watkins" <linux-lvm@malor.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAADVBIY9BxK0+ae0nwI98IewEAAAAA@echohome.org>
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
Date: Tue, 1 Mar 2005 23:10:13 -0500
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
To: Erik@echohome.org, LVM general discussion and development <linux-lvm@redhat.com>

This is absolutely insane.   It is among the dumbest designs I've ever seen. 
You are using HDA as a component in MD0 and MD1, and then using HDA AGAIN as 
part of MD2 directly, while using it indirectly via MD0 and MD1.   You're 
going to A) bottleneck on HDA, B) you're going to beat that drive to death, 
and C) if that drive goes, you are HOSED.  Plus, you are just begging for 
problems with potential bugs in the RAID driver code.  This whole setup is 
an INCREDIBLY bad idea.  You're trying to 'be clever' to save yourself some 
money, and all you're doing is buying trouble.

The way RAID5 is meant to work is with disks of approximately the same size. 
RAID5 is not expandable, unless you have a very expensive hardware 
controller.  There are algorithms that will let you expand the size of a 
RAID5 volume, but they have not, to my knowledge, been implemented in open 
source.   You CANNOT do what you want to do, cheaply.  You can spend a great 
deal of money to satisfy most of your design parameters, but NOT cheaply. 
If you want it cheap, use fixed drives of about the same size, and don't 
think about expansion.  When you're ready to expand, hook up another, bigger 
RAID and copy your data.   In NO case can you use that hodgepodge of junk 
drives you've collected.

Most of your drives are obsolete.  Keep the biggest one, buy at least two 
more of the same size, and set up a RAID5 using that.  All this monkeying 
around to try to extract some last value from drives totally ill-suited for 
the purpose is going to cost you far, far more than new drives ever could.

Hell, keep the smaller ones around, put them into a concatenated LVM2 
volume, and use them as a backup.  It's not the best backup in the world, 
but it's better than nothing.

Do it right.  This is your data you're trying to save.  You can get very 
nice 250-gig PATA Western Digital drives for $165 from www.newegg.com.  They 
are specifically designed for RAID.  Buy 4 and save yourself this massive 
headache.  If you don't need that much space, buy smaller drives.

Or, you can persist in trying to be clever, but it's a virtual *certainty* 
you're going to lose data if you go this route.  Pay now, or pay later. 
What's your data worth?

<<RON>>

----- Original Message ----- 
From: "Erik Ohrnberger" <erik@echohome.org>
To: "'LVM general discussion and development'" <linux-lvm@redhat.com>
Sent: Tuesday, March 01, 2005 10:27 PM
Subject: RE: [linux-lvm] Building up a RAID5 LVM home server (long)


>
> ... SNIP ...
>> >What if the I broke everything into 10 GB pieces, and
>> created multiple
>> >raid5 sets?  Then I could LVM2 them together and have a large
>> >filesystem that way.
>> >
>> >a=20GB, b=30GB, c=40GB
>> >
>> >a-1 + b-1 + c-1 = md0 (approx 30 GB storage)
>> >a-2 + b-2 + c-2 = md1 (approx 30 GB storage)
>> >      b-3 + c-3 = md2 (waiting for one more drive)
>> >            c-4 = md3 (waiting for two more drives)
>> >
>> >
>> This is sorta what I do.  But in my opinion the gain of having RAID5
>> (over RAID1) is when you get over 3 disks...  at 3 disks you
>> are burning
>> 33% for redudnacy... 25% or 20% or  17% sounds better to me.
>> I guess if
>> you go too far it costs in calculating the parity.
>
> Overhead: Yea, OK. Nothing is without a price.
> I fooled around with various ideas, and came up with this for my
> particulars:
> (Note, rounded to nearest GB)
>
> 80 GB /dev/hda 60 GB /dev/hdb 40 GB /dev/hdc 45 GB
> /dev/hdd
>
> GB /dev/md0 (RAID0)
> 40 /dev/hdc
> 15 /dev/hda1
> 55
>
> /dev/md1 (RAID0)
> 45 /dev/hdd
> 10 /dev/hda2
> 55
>
> /dev/md2 (RAID5)
> 55 /dev/md0
> 55 /dev/md1
> 55 /dev/hda3
> 55 /dev/hdb
> 220
>
> Yea, OK, so like the 220 is a bit optimistic, but should get pretty close 
> to
> that.
>
> What do you think?
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

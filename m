Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1SKe5K09361
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 15:40:05 -0500
Received: from mail02.malor.com (host.malor.com [69.93.140.74] (may be forged))
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1SKdxkP011272
	for <linux-lvm@redhat.com>; Mon, 28 Feb 2005 15:39:59 -0500
Message-ID: <001301c51dd5$abc80860$32dcdc0a@vanish>
From: "Ron Watkins" <linux-lvm@malor.com>
References: <002101c51c41$f6bcfdc0$32dcdc0a@vanish>
	<a3558a98050228031544d8f8c6@mail.gmail.com>
Subject: Re: [linux-lvm] Having duplicate PV problems,
	think there's a bug in LVM2 md component detection
Date: Mon, 28 Feb 2005 15:39:59 -0500
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
To: go0ogl3 <go0ogl3@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Yes, I have two PVs with the same UUID.  The problem is that these PVs are 
COMPONENTS OF an MD device.  So when pvcreate writes its superblock to md0, 
it gets mirrored onto all the components of md0.  Later runs elicit much 
complaining because /dev/hda and several /dev/sd devices now have the 'same' 
UUID.   They're SUPPOSED to, they're components of a RAID.

LVM is supposed to detect this situation and not do that, but it doesn't 
seem to be working for me.

<<RON>>

----- Original Message ----- 
From: "go0ogl3" <go0ogl3@gmail.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Monday, February 28, 2005 6:15 AM
Subject: Re: [linux-lvm] Having duplicate PV problems,think there's a bug in 
LVM2 md component detection


> I'm anly a begginer at lvm but...
>
> On Sat, 26 Feb 2005 15:30:08 -0500, Ron Watkins <linux-lvm@malor.com> 
> wrote:
>> I'm sorry if this is a FAQ or if I'm being stupid.  I saw some mentions 
>> to
>> this problem on the old mailing list, but it didn't seem to quite cover 
>> what
>> I'm seeing, and I don't see an archive for this list yet.  (and what on
>> earth happened to the old list, anyway?)
>>
>> My problem is this:  I'm setting up a software RAID5 across 5 IDE drives.
>> I'm running Debian Unstable, using kernel 2.6.8-2-k7.   I HAVE set
>> md_component_detection to 1 in lvm.conf, and I wiped the drives after
>> changing this setting.
>>
>> I originally set it up as a four-drive RAID, via a 3Ware controller, so 
>> my
>> original devices were sdb, sdc, sdd, and sde. (the machine also has a
>> hardware raid on an ICP Vortex SCSI controller: this is sda.)    In this
>> mode, it set up and built perfectly.  LVM worked exactly as I expected it
>> to.  I had a test volume running.  All the queries and volume management
>> worked exactly correctly.  All was well.
>>
>> So then I tried to add one more drive via the motherboard IDE controller, 
>> on
>> /dev/hda.  (note that I stopped the array, wiped the first and last 100 
>> megs
>> on the drives, and rebuilt. ).  That's when the problems started.  The 
>> RAID
>> itself seems to build and work just fine, although I haven't waited for 
>> the
>> entire 6 or so hours it will take to completely finish.  Build speed is
>> good, everything seems normal.  But LVM blows up badly in this
>> configuration.
>>
>> When I do a pvcreate on /dev/md0, it succeeds... but if I do a pvdisplay 
>> I
>> get a bunch of complaints:
>>
>> jeeves:/etc/lvm# pvdisplay
>>  Found duplicate PV y8pYTtAg0W703Sc8Wiy79mcWU3gHmCFc: using /dev/sde not
>> /dev/hda
>>  Found duplicate PV y8pYTtAg0W703Sc8Wiy79mcWU3gHmCFc: using /dev/sde not
>> /dev/hda
>
> I think you have 2 PV's with the same UUID and that's the problem. You
> can even move the drives letters around (hda or sda) as I think it
> does not matter for lvm. The only thing it counts it's the "UUID"  of
> the PV.
>
> You should use pvcreate again on /dev/hda so your last added drive
> should have different UUID.
>
>>  --- NEW Physical volume ---
>>  PV Name               /dev/hda
>>  VG Name
>>  PV Size               931.54 GB
>>  Allocatable           NO
>>  PE Size (KByte)       0
>>  Total PE              0
>>  Free PE               0
>>  Allocated PE          0
>>  PV UUID               y8pYTt-Ag0W-703S-c8Wi-y79m-cWU3-gHmCFc
>>
>> It seems to think that /dev/hda is where the PV is, rather than /dev/md0.
>>
>> (Note, again, I *HAVE* turned the md_component_detection to 1 in 
>> lvm.conf!!)
>>
>> I have erased, using dd, the first and last 100 megs or so on every 
>> drive,
>> and I get exactly the same results every time... even with all RAID and 
>> LVM
>> blocks erased, if I use this list of drives:
>>
>> /dev/hda
>> /dev/sdb
>> /dev/sdc
>> /dev/sdd
>> /dev/sde
>>
>> with the linux MD driver, LVM does not seem to work properly.  I think 
>> the
>> component detection is at least a little buggy.  This is what my
>> /proc/mdstat looks like:
>>
>> jeeves:/etc/lvm# cat /proc/mdstat
>> Personalities : [raid5]
>> md0 : active raid5 sde[5] sdd[3] sdc[2] sdb[1] hda[0]
>>      976793600 blocks level 5, 128k chunk, algorithm 2 [5/4] [UUUU_]
>>      [=>...................]  recovery =  6.2% (15208576/244198400)
>> finish=283.7min speed=13448K/sec
>> unused devices: <none>
>>
>> I realize that using both IDE and SCSI drives in the same array is
>> unusual... but I'm not really using SCSI drives, they just look like that
>> because of the 3Ware controller.
>>
>> Again, this works FINE as long as I just use the (fake) SCSI devices.. it
>> doesn't wonk out until I add in /dev/hda.
>>
>> Any suggestions?  Is this a bug?
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

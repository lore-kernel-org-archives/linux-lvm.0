Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DI3gpQ005568
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 14:03:42 -0400
Received: from will.fastenal.com (will.fastenal.com [205.243.112.23])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6DI3dGC015769
	for <linux-lvm@redhat.com>; Thu, 13 Jul 2006 14:03:39 -0400
Message-ID: <44B68AF6.30004@fastenal.com>
Date: Thu, 13 Jul 2006 13:03:34 -0500
From: Kelly Sauke <ksauke@fastenal.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] SAN setup with host mirrored disks
References: <7CA7BBF7F95AA245ACAB8E28A6285EB905191D94@s01edv50.warema.de>
	<ACF82DA558D73398BEAA7814@dhcp-2-206.wgops.com>
In-Reply-To: <ACF82DA558D73398BEAA7814@dhcp-2-206.wgops.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>



Michael Loftis wrote:
>
>
> --On July 13, 2006 12:04:01 AM +0200 "Fiederling, Daniel" 
> <daniel.fiederling@warema.de> wrote:
>
>>
>> Hi,
>>
>> I'm relatively new to SAN setup with linux boxes, so maybe this is a 
>> very
>> easy question. Today I set up a linux box with two qlogic hbas, each one
>> is connected to a EMC Clarion. So I got two disks (/dev/sda and 
>> /dev/sdb)
>> from my storages that I have to mirror on the host system. There is on
>> mirror set up in the san environment!
>
> Uhhhmm...Clariion Can and does do RAID 0,1,5, as well as any 
> combination of the three.  Depending on the model of Clariion and your 
> specific setup (esp depending on if you're using powerpath or not) 
> you'll see one or two 'copies' of each LUN.
>
> In fact I'd highly recomment using the Clariion to do all of your real 
> RAID stuff, and if you can't use powerpath, then use md *just* for 
> failover. You do not need MD for actual RAID with a Clariion.  
> Navisphere will allow you to configure mirrors of sets of drives.
>
>
Do the Raiding on the Clariion.  Then use either PowerPath or mpio (on 
RHEL 4 U3 or newer) to do your failover.  If you use md for your 
failover layer you may get IO errors on the non-active paths.  You need 
something that is aware of the clariion setup and that would be 
PowerPath or the shipped mpio.


>
>
> -- 
> "Genius might be described as a supreme capacity for getting its 
> possessors
> into trouble of all kinds."
> -- Samuel Butler
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

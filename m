Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j2C6n4Y01043
	for <linux-lvm@redhat.com>; Sat, 12 Mar 2005 01:49:04 -0500
Received: from server.echohome.org (s233-64-29-217.try.wideopenwest.com
	[64.233.217.29])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j2C6mvnc001460
	for <linux-lvm@redhat.com>; Sat, 12 Mar 2005 01:48:58 -0500
Received: from echo (echo.echohome.org [192.168.2.254])
	by server.echohome.org (8.12.8/8.12.8) with ESMTP id j2C6mohS012868
	for <linux-lvm@redhat.com>; Sat, 12 Mar 2005 01:48:51 -0500
From: "Erik Ohrnberger" <erik@echohome.org>
Subject: RE: [linux-lvm] Building up a RAID5 LVM home server (long)[0x05B52F13]
Date: Sat, 12 Mar 2005 01:49:27 -0500
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAiKro/zVEU02Xw5blW4RJy8KAAAAQAAAA+n58x6G5jEO2amEm6MlYuwEAAAAA@echohome.org>
MIME-Version: 1.0
In-Reply-To: <001301c52589$978d1500$32dcdc0a@vanish>
Content-Transfer-Encoding: 8bit
Reply-To: Erik@echohome.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Ron,
    All your conclusions are very true.  

    The machine is a 2 GHz AMD Althorn with 512 MB RAM running SuSE 9.1.
The local network is very small.  Only 5 or 6 devices (laptop) at most, and
is serviced by two 100 Mb hubs quite well.  Hardly ever see collisions, and
then only when there is a large file transfer going on.

    At some point in time, I may be fooling around with MythTV or KnoppMyth,
which would generate a lot of data, and I figure that I could NFS mount the
large disk space across the network.  In addition, all the stuff that I
download from the net is on there too, patches for programs (mostly MS) and
other software install sets.

    Has LVM2 been upgraded to handle an LVM size larger than before?  Last I
recall, it was limited to 256 PVs, and 250 GB or so usable space.

    Thanks for all your ideas and contributions.

    Erik.

> -----Original Message-----
> From: linux-lvm-bounces@redhat.com 
> [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Ron Watkins
> Sent: Thursday, March 10, 2005 10:56 AM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] Building up a RAID5 LVM home server 
> (long)[0x05B52F13]
> 
> 
> Remember, this is for a HOME SERVER, not a corporate 
> database.  Assuming he 
> doesn't have Gigabit Ethernet, and assuming the CPU in his server is 
> reasonably beefy (at least a gigahertz), the extra speed in 
> RAID 1 or 10 
> will be entirely wasted.   For almost any home application, 
> RAID5 is going 
> to be exactly what folks want.... cheap, reliable, and more 
> than fast enough 
> to saturate the wire.
> 
> Doing RAID 10 properly would cost a great deal for disks, a lot for 
> motherboards with proper, non-PCI choked Gigabit ports (need 
> them on both 
> server and client, mind you), and would take a significant amount of 
> learning on the part of the home admin to get really running 
> properly.... 
> how many people want to learn about jumbo frames and cat5e 
> wiring to set up 
> a video server that will only be serving one or two videos at a time?
> 
> Yes, your solution would run faster in some circumstances, 
> but it would be a 
> LOT more expensive.   After investing all that money, he'd see it run 
> somewhat faster on writes, and the server wouldn't be 
> speed-impaired during 
> a rebuild.   But he's a HOME USER.  It doesn't MATTER if the 
> server is slow 
> for a night or two.  Everything will be sluggish for a couple 
> nights, once a 
> year or so.  So what?  Since when is this is worth spending a 
> couple grand 
> to avoid?
> 
> It would often make sense for a business to do that, but from 
> a home user 
> perspective, it seems like following this specific advice would be a 
> gigantic waste of money.
> 
> For nearly all home users with reasonably modern hardware, 
> RAID5 is the 
> right way to go for servers, at least for now.
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

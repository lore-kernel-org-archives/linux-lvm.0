Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LJ2up27631
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:02:56 -0400
Received: from smtp.doruk.net.tr (smtp.doruk.net.tr [212.58.5.248])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LJ2sMc007756
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:02:55 -0400
Received: from VAHOXP (vahric.doruk.net.tr [212.58.13.17])
	by smtp.doruk.net.tr (8.12.8/8.12.8) with ESMTP id i3LJ82cJ003525
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 22:08:02 +0300
Message-Id: <200404211908.i3LJ82cJ003525@smtp.doruk.net.tr>
From: "Vahric MUHTARYAN" <vahric@doruk.net.tr>
Subject: RE: [linux-lvm] About Extending LVM size with Hardware Raid
Date: Wed, 21 Apr 2004 22:05:15 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4086BAC6.2080604@stercomm.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

	Okey you mean create a new raid5 with new disks and add it to volume
group okey you right . 

	But My question is , Think that I have raid5 array with 3 disk ( I'm
using ICP Raid controller card )  then I add 4.th disk to my raid array ( I
know clearly that I can extend raid5 ) at this I have more disk space but I
have to intorduce it to system , and I can't imagine How ?! it's easy if I
have free partiton but I can't show this extended array like a free
partition  :( 

Thanks For your answer 
Vahric 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Chris Cox
Sent: Wednesday, April 21, 2004 9:18 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid

Vahric MUHTARYAN wrote:
> Hi Everybody ?! 
> 
> 	Maybe everybody know Raid5 can extend easily. I'm using hardware
> raid and I wonder What extend utulity I have to use for system . resize or
> LVM .. 
> Because with hardware raid system looks all disks like a one logical disk
at
> this moment How can I intorduce extended array to system ... 

Uh... you don't generally extend RAID 5.  But if your hardware
raid solution has unutilized disks (or disks you can add), you can
create a new logical hw raid disk and easily add that disk into existing
volume groups.

If you have left over space on your existing logical disk, that
too can be added quite easily.  You need to provide more info.



_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

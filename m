Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LJCip31411
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:12:44 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LJChMc009902
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:12:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id C9ACACB3C
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:12:41 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13756-07 for <linux-lvm@redhat.com>;
	Wed, 21 Apr 2004 15:12:41 -0400 (EDT)
Received: from localhost (salusa.poochiereds.net [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 09FB9C53D
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:12:40 -0400 (EDT)
Subject: RE: [linux-lvm] About Extending LVM size with Hardware Raid
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <200404211908.i3LJ82cJ003525@smtp.doruk.net.tr>
References: <200404211908.i3LJ82cJ003525@smtp.doruk.net.tr>
Message-Id: <1082574761.30148.20.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Wed, 21 Apr 2004 15:12:41 -0400
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2004-04-21 at 15:05, Vahric MUHTARYAN wrote:
> 	Okey you mean create a new raid5 with new disks and add it to volume
> group okey you right . 
> 
> 	But My question is , Think that I have raid5 array with 3 disk ( I'm
> using ICP Raid controller card )  then I add 4.th disk to my raid array ( I
> know clearly that I can extend raid5 ) at this I have more disk space but I
> have to intorduce it to system , and I can't imagine How ?! it's easy if I
> have free partiton but I can't show this extended array like a free
> partition  :( 
> 

This is not so much a LVM thing, as a question for your controller card
manufacturer. Linux software RAID5 can extend a software RAID5 array, by
shuffling data around on the existing and new disks, and recalculating
the checksums (see the raidreconf command).

With hardware RAID5, however, unless your hardware vendor has provided a
tool to do this, you're stuck with saving off the data to another
location, rebuilding the array, and copying the data back.

Maybe the ICP folks can help you,
Jeff

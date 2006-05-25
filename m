Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4PLI8Xf031553
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 17:18:08 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4PLHYhE016507
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 17:17:50 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 3B86C1F4235
	for <linux-lvm@redhat.com>; Thu, 25 May 2006 23:17:25 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 15913-02 for <linux-lvm@redhat.com>;
	Thu, 25 May 2006 23:16:47 +0200 (CEST)
Message-ID: <44761EB9.2000901@conterra.de>
Date: Thu, 25 May 2006 23:16:41 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] booting from an LV
References: <4472E235.6020707@neuroweave.nl>	<20060523105821.GA6491@percy.comedia.it>	<4472EE4E.9050208@neuroweave.nl>	<4473ED42.1060702@wanadoo.fr>	<4474B6E8.9010106@neuroweave.nl>	<4474D256.8080603@chaos.ao.net>
	<4474D94B.7010504@neuroweave.nl>
In-Reply-To: <4474D94B.7010504@neuroweave.nl>
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

Joep Blom wrote:
> Harik,
> I couldn't agree more. IMHO it's a bloody shame we still have to work 
> with a misconcept of over 25 years to start any OS (I'm not familiar 
> with the Mac but I presume it's equally oldfashioned).
> Joep

be careful:
precisely Apple is a step further than most Linux systems today:
they already use EFI, the next generation BIOS, see:
http://en.wikipedia.org/wiki/Extensible_Firmware_Interface
EFI even defines an enhanced partitioning concept called GPT.

But I still fail to see, why I have to create any partition on my
disks if I have LVM instead. It should make partitions obsolete!
On the other hand I don't see neither Lilo nor Grub will provide
a solution without any DOS partition table, soon. As I refuse to turn
back booting from floppy disks, I currently think about booting from
a cheap USB Stick instead. It may hold my /boot system with an LVM
aware kernel and may even carry a small rescure system. 

Dieter

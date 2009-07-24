Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6O1ctS1015127
	for <linux-lvm@redhat.com>; Thu, 23 Jul 2009 21:38:55 -0400
Received: from eastrmmtao106.cox.net (eastrmmtao106.cox.net [68.230.240.48])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6O1cekt014538
	for <linux-lvm@redhat.com>; Thu, 23 Jul 2009 21:38:41 -0400
Received: from eastrmimpo01.cox.net ([68.1.16.119]) by eastrmmtao106.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090724013841.NAFI28892.eastrmmtao106.cox.net@eastrmimpo01.cox.net>
	for <linux-lvm@redhat.com>; Thu, 23 Jul 2009 21:38:41 -0400
Message-ID: <4A69109F.7000703@cox.net>
Date: Thu, 23 Jul 2009 20:38:39 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
	<20090721200728.GA30327@esri.com>	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
	<20090721210705.GA31479@esri.com>	<2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
	<20090721215913.GA32225@esri.com>
	<2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
In-Reply-To: <2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
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
To: linux-lvm@redhat.com

On 2009-07-21 17:09, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 3:59 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
>>  vgcfgrestore -l storage
> 
> Hrmm, getting a lot of this:
> 
>   File:		/etc/lvm/archive/storage_00033.vg
>   Couldn't find device with uuid 'MSeHHn-Tcol-GROd-541H-8wcS-3cqv-QBqL4m'.
>   Couldn't find device with uuid 'WtsE6d-UpqB-l3vo-um3o-0qO9-k4xl-HcJ0eM'.
>   Couldn't find device with uuid 'zVilO7-5ioi-6c9W-ZEnp-uXpP-p1rR-WiwE3M'.
>   VG name:    	storage
>   Description:	Created *before* executing 'vgscan'
>   Backup Time:	Tue Jul 21 13:19:21 2009
> 
> What is this stuff about can't find device with uuid?

I got that today with a new mobo that didn't originally see all my 
hard drives.  A little BIOS fiddling, a reboot and all back to normal.

That's probably not your problem, though...

-- 
Scooty Puff, Sr
The Doom-Bringer

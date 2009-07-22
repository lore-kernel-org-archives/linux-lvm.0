Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6MD2bTR027858
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 09:02:37 -0400
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
	<20090721210705.GA31479@esri.com>
	<2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
	<20090721215913.GA32225@esri.com>
	<2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
Date: Wed, 22 Jul 2009 14:08:41 +0100
Message-Id: <1248268121.14407.125.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2009-07-21 at 16:09 -0600, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 3:59 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> >  vgcfgrestore -l storage
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

Do you get those messages when running other commands or just when
looking at archived metadata?

The message in this case is telling you that the named metadata archive
includes references to PV UUIDs that could not be found on the system at
this time.

You can view all PVs and their UUIDs by running:

pvs -o+uuid

Regards,
Bryn.

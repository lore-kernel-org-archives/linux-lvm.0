Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LMLXG7031214
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:21:33 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LMLJun007873
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:21:20 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id n6LMLIc28485
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:21:18 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LMLI5t001125
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:21:18 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LMLI6U001122
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 15:21:18 -0700
Date: Tue, 21 Jul 2009 15:21:18 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721222118.GA755@esri.com>
References: <20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
	<20090721210705.GA31479@esri.com>
	<2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
	<20090721215913.GA32225@esri.com>
	<2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@redhat.com

On Tue, Jul 21, 2009 at 03:09:27PM -0700, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 3:59 PM, Ray Van Dolson<rvandolson@esri.com> wrot=
e:
> > =EF=BF=BDvgcfgrestore -l storage
>=20
> Hrmm, getting a lot of this:
>=20
>   File:		/etc/lvm/archive/storage_00033.vg
>   Couldn't find device with uuid 'MSeHHn-Tcol-GROd-541H-8wcS-3cqv-QBqL4m'.
>   Couldn't find device with uuid 'WtsE6d-UpqB-l3vo-um3o-0qO9-k4xl-HcJ0eM'.
>   Couldn't find device with uuid 'zVilO7-5ioi-6c9W-ZEnp-uXpP-p1rR-WiwE3M'.
>   VG name:    	storage
>   Description:	Created *before* executing 'vgscan'
>   Backup Time:	Tue Jul 21 13:19:21 2009
>=20
> What is this stuff about can't find device with uuid?
>=20

It appears that sometime during the 33 and 34 files in archive/ the
UUID's on your PV's changed.

Do you see the above errors for storage_00034.vg?

What about for vgcfgrestore -l -f /etc/lvm/backup/storage storage ?

I'm not sure which one of these backup files I'd use to restore to.
You can also re-run pvcreate with the --uuid and --restorefile argument
if you want to recreate a "lost" uuid...

Still wondering how in the world this happened :)

Ray

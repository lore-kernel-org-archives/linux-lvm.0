Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LMA8dx024929
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:10:08 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.245])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LM9mfJ018770
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 18:09:48 -0400
Received: by an-out-0708.google.com with SMTP id d14so2120782and.36
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:09:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090721215913.GA32225@esri.com>
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
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 16:09:27 -0600
Message-ID: <2473b43f0907211509w2385d916p3fd9511a60ab778a@mail.gmail.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
Content-Transfer-Encoding: quoted-printable
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 21, 2009 at 3:59 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> =EF=BF=BDvgcfgrestore -l storage

Hrmm, getting a lot of this:

  File:		/etc/lvm/archive/storage_00033.vg
  Couldn't find device with uuid 'MSeHHn-Tcol-GROd-541H-8wcS-3cqv-QBqL4m'.
  Couldn't find device with uuid 'WtsE6d-UpqB-l3vo-um3o-0qO9-k4xl-HcJ0eM'.
  Couldn't find device with uuid 'zVilO7-5ioi-6c9W-ZEnp-uXpP-p1rR-WiwE3M'.
  VG name:    	storage
  Description:	Created *before* executing 'vgscan'
  Backup Time:	Tue Jul 21 13:19:21 2009

What is this stuff about can't find device with uuid?


--=20
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic

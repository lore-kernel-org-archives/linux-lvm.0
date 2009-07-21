Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LLxW19017944
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 17:59:32 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LLxEj6013268
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 17:59:14 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id n6LLxDc26732
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 14:59:13 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LLxDwU000464
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 14:59:13 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LLxDH9000463
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 14:59:13 -0700
Date: Tue, 21 Jul 2009 14:59:13 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721215913.GA32225@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com>
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com>
	<20090721210705.GA31479@esri.com>
	<2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jul 21, 2009 at 02:24:26PM -0700, Adam Olsen wrote:
> On Tue, Jul 21, 2009 at 3:07 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> > Very strange... a few more commands:
> >
> > vgs -P -o +devices
> > lvs -P -a -o +devices
> 
> imgserv:/storage/# vgs -P -o +devices
>   Partial mode. Incomplete volume groups will be activated read-only.
>   VG      #PV #LV #SN Attr   VSize VFree Devices
>   storage   3   1   0 wz--n- 3.62T 4.98G /dev/sda3(0)
>   storage   3   1   0 wz--n- 3.62T 4.98G /dev/sdb1(0)
>   storage   3   1   0 wz--n- 3.62T 4.98G /dev/sdc1(0)
> imgserv:/storage/# lvs -P -a -o +devices
>   Partial mode. Incomplete volume groups will be activated read-only.
>   LV      VG      Attr   LSize Origin Snap%  Move Log Copy%  Convert
> Devices
>   storage storage -wi-i- 3.62T
> /dev/sda3(0)
>   storage storage -wi-i- 3.62T
> /dev/sdb1(0)
>   storage storage -wi-i- 3.62T
> /dev/sdc1(0)
> 
> > If you want, post the lvmdump tarball somewhere...
> 
> http://www.exaile.org/lvmdump.tar.gz

Maybe someone else could take a look as well.  Some of the LVM metadata
files in the archive directory appear to be missing logical_volumes {}
sections.

I wonder if this could be fixed with a simple 

  vgcfgrestore -f /etc/lvm/backup/storage storage
  vgscan
  vgchange -ay storage

Also it looks like some of the older archived versions would be valid
as well.

  vgcfgrestore -l storage

Should give a list...

> 
> > When did this start happening?
> 
> This morning.  5am MST.

Ray

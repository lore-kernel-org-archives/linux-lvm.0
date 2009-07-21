Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LLP5RD031967
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 17:25:05 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.172])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n6LLOks6014321
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 17:24:46 -0400
Received: by wf-out-1314.google.com with SMTP id 28so940788wfa.6
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 14:24:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20090721210705.GA31479@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com> 
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com> 
	<20090721200728.GA30327@esri.com>
	<2473b43f0907211329u3f8c4dbbv43b4ecefde827b2c@mail.gmail.com> 
	<20090721203532.GA30997@esri.com>
	<2473b43f0907211347h5cad6d77se2dda5f779953f81@mail.gmail.com> 
	<20090721210705.GA31479@esri.com>
From: Adam Olsen <arolsen@gmail.com>
Date: Tue, 21 Jul 2009 15:24:26 -0600
Message-ID: <2473b43f0907211424o209e52ccj9223295a328220d3@mail.gmail.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
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

On Tue, Jul 21, 2009 at 3:07 PM, Ray Van Dolson<rvandolson@esri.com> wrote:
> Very strange... a few more commands:
>
> vgs -P -o +devices
> lvs -P -a -o +devices

imgserv:/storage/# vgs -P -o +devices
  Partial mode. Incomplete volume groups will be activated read-only.
  VG      #PV #LV #SN Attr   VSize VFree Devices
  storage   3   1   0 wz--n- 3.62T 4.98G /dev/sda3(0)
  storage   3   1   0 wz--n- 3.62T 4.98G /dev/sdb1(0)
  storage   3   1   0 wz--n- 3.62T 4.98G /dev/sdc1(0)
imgserv:/storage/# lvs -P -a -o +devices
  Partial mode. Incomplete volume groups will be activated read-only.
  LV      VG      Attr   LSize Origin Snap%  Move Log Copy%  Convert
Devices
  storage storage -wi-i- 3.62T
/dev/sda3(0)
  storage storage -wi-i- 3.62T
/dev/sdb1(0)
  storage storage -wi-i- 3.62T
/dev/sdc1(0)

> If you want, post the lvmdump tarball somewhere...

http://www.exaile.org/lvmdump.tar.gz

> When did this start happening?

This morning.  5am MST.

-- 
Adam Olsen
SendOutCards.com
http://www.vimtips.org
http://last.fm/user/synic

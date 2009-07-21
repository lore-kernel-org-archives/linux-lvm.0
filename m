Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6LJwjNW031386
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:58:45 -0400
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6LJwVPl011142
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 15:58:31 -0400
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id n6LJwUc14447
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 12:58:30 -0700 (PDT)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id n6LJwU13030232
	for <linux-lvm@redhat.com>; Tue, 21 Jul 2009 12:58:30 -0700
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n6LJwUxp030231
	for linux-lvm@redhat.com; Tue, 21 Jul 2009 12:58:30 -0700
Date: Tue, 21 Jul 2009 12:58:30 -0700
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical
	volume, help!
Message-ID: <20090721195830.GA30206@esri.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
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

On Tue, Jul 21, 2009 at 12:55:50PM -0700, Adam Olsen wrote:
> This pretty much sums it up:
> 
> imgserv:/storage/# lvscan
>   ACTIVE            '/dev/storage/storage' [3.62 TB] inherit
> imgserv:/storage/# fdisk /dev/storage/storage
> 
> Unable to read /dev/storage/storage
> 
> I can't mount it, access it with fdisk.  Here's the lvdisplay output:
> 
> imgserv:/storage/# lvdisplay
>   --- Logical volume ---
>   LV Name                /dev/storage/storage
>   VG Name                storage
>   LV UUID                Cw8aAr-YHsR-oVfH-7AAx-2ppa-Zm3M-U9z1eA
>   LV Write Access        read/write
>   LV Status              available
>   # open                 0
>   LV Size                3.62 TB
>   Current LE             948962
>   Segments               3
>   Allocation             inherit
>   Read ahead sectors     auto
>   - currently set to     256
>   Block device           254:0
> 
> This is on debian etch.   This is what I see at the end of dmesg:
> 
> cdrom: open failed.
> hdc: packet command error: status=0x51 { DriveReady SeekComplete Error }
> hdc: packet command error: error=0x54
> 
> Which I don't think has anything to do with this problem, as hdc is
> NOT one of the physical volumes... it's a cdrom drive.
> 
> Is there anything I can do to debug this?
> 

You've already done a vgchange -ay on the volgroup?  What's the output
of pvs/pvdisplay?

Ray

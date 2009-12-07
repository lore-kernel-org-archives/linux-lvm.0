Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nB72MUkv000711
	for <linux-lvm@redhat.com>; Sun, 6 Dec 2009 21:22:30 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nB72MEpK002850
	for <linux-lvm@redhat.com>; Sun, 6 Dec 2009 21:22:14 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id nB72MD1e002386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 6 Dec 2009 21:22:13 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id nB72MDLn026652
	for <linux-lvm@redhat.com>; Sun, 6 Dec 2009 21:22:13 -0500
Date: Sun, 6 Dec 2009 21:22:13 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Problems with dissapearing PV when mounting
In-Reply-To: <691e2b620912061047i13bd740eq947dc2a67086e439@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0912062114210.24919@bmsred.bmsi.com>
References: <691e2b620912061047i13bd740eq947dc2a67086e439@mail.gmail.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 6 Dec 2009, Johan Gardell wrote:

> But the problems appear when:
> vgchange -ay gardin
>   device-mapper: reload ioctl failed: Invalid argument
>   device-mapper: reload ioctl failed: Invalid argument
>   2 logical volume(s) in volume group "gardin" now active
> 
> Where dmesg shows:
> [31936.135588] device-mapper: table: 254:1: linear: dm-linear: Device
> lookup failed
> [31936.135592] device-mapper: ioctl: error adding target to table
> [31936.150572] device-mapper: table: 254:2: linear: dm-linear: Device
> lookup failed
> [31936.150576] device-mapper: ioctl: error adding target to table
> [31940.024525] end_request: I/O error, dev fd0, sector 0

The fd0 error means you need to exclude /dev/fd0 from the vgscan in
/etc/lvm/lvm.conf (or wherever Debian puts it).  Start to worry
if you get I/O errors on sdb or sdc.

> And trying to mount the vg:
> mount /dev/mapper/gardin-root /mnt/tmp
>   mount: you must specify the filesystem type

You need to show us the output of 'lvs'.  (Even if it just spits out an error.)

Is there an LV named "root"?  I think so, since it would say "special device
does not exist" if not.  But what kind of filesystem did it have
on it?  Maybe it is not an auto-detected one, or you need to load
the filesystem driver.  Does mount report I/O error if it gets one
trying to identify the filesystem?

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

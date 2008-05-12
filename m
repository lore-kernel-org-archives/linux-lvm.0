Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4CKJ29r010030
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:19:02 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m4CKIpI5022710
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:18:52 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m4CKIkUW028623
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:18:46 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m4CKIk2U022335
	for <linux-lvm@redhat.com>; Mon, 12 May 2008 16:18:46 -0400
Date: Mon, 12 May 2008 16:18:46 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Re: lvm partition on ramdisk
In-Reply-To: <1c748a490805121305h242bd495u321b728756229d56@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0805121616190.22122-100000@bmsred.bmsi.com>
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

On Mon, 12 May 2008, Larry Dickson wrote:

>   Device /dev/ram0 not found (or ignored by filtering).
> 
> I know /dev/ram0 is there; fdisk sees it. Is there any way to turn off the
> filtering?

It is filtered by default to prevent shooting yourself in the foot.
You can change /etc/lvm/lvm.conf (on EL5) to allow a ramdisk as PV.
However, you really need to understand the problems that will result from
a crash/reboot while a ramdisk is part of the VG before you do this.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.

Received: from fentible.pjc.net (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k058hHV3023545
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 08:43:17 GMT
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1EuQiM-0003tb-10
	for linux-lvm@redhat.com; Thu, 05 Jan 2006 08:43:18 +0000
Message-ID: <43BCDC23.9010100@redhat.com>
Date: Thu, 05 Jan 2006 08:43:15 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Use lvcreart -m to make a mirror
References: <43BC8CF9.1080901@redhat.com>
In-Reply-To: <43BC8CF9.1080901@redhat.com>
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

Fang,Dongyu wrote:
> When I use `lvcreate -l 4 --mirrors 1 -n mirror1 /dev/vg1` want to
> create  mirror LV, I got four LV:
>  ACTIVE            '/dev/vg1/mirror1' [16.00 MB] inherit
>  ACTIVE            '/dev/vg1/mirror1_mlog' [4.00 MB] inherit
>  ACTIVE            '/dev/vg1/mirror1_mimage_0' [16.00 MB] inherit
>  ACTIVE            '/dev/vg1/mirror1_mimage_1' [16.00 MB] inherit
> I think the LV mirror1 is the origin LV, mirror1_mlog is log, the two
> others should be images LV, so why there are two images(in my opinion,
> it should be only one), and I how to use then? Can I mount it?

/dev/vg1/mirror1 is the device you mount, the _mimage_ are internal devices
for LVM. You have the "original" (mimage_0) and the mirror (mimage_1).

The later revisions of LVM will hide these from the lvscan & lvs commands.
-- 

patrick

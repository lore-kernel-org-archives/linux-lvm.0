Received: from fentible.pjc.net (vpn-68-1.surrey.redhat.com [10.32.68.1])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id k059lhV3028162
	for <linux-lvm@redhat.com>; Thu, 5 Jan 2006 09:47:43 GMT
Received: from jeltz.pjc.net ([192.168.1.2])
	by fentible.pjc.net with esmtp (Exim 4.50) id 1EuRih-0004Hk-RX
	for linux-lvm@redhat.com; Thu, 05 Jan 2006 09:47:43 +0000
Message-ID: <43BCEB3D.5090400@redhat.com>
Date: Thu, 05 Jan 2006 09:47:41 +0000
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Use lvcreart -m to make a mirror
References: <43BC8CF9.1080901@redhat.com> <43BCDC23.9010100@redhat.com>
	<43BCE669.8050702@redhat.com>
In-Reply-To: <43BCE669.8050702@redhat.com>
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
> Thanks your replay.
> How can I mount the "original" (mimage_0) or the "mirror" (mimage_1)
> single?
> Because I want to verify it write/read data in both LV indeed.

Because of internal cacheing I don't know whether that's a sensible thing to do.

> And how can I remove the mirror relation between the two LV(let the
> "original" and "mirror" become two singe LV)?   (I use `lvconvert -m 0
> vg1/mirror1`  then LVs become one.)

With current RPMs you currently can't. The code is in CVS but it needs lots of
testing.
-- 

patrick

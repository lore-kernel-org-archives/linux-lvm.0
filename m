Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA7J4YV16180
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 14:04:34 -0500
Received: from omx3.sgi.com (omx3-ext.sgi.com [192.48.171.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA7J4SsL004568
	for <linux-lvm@redhat.com>; Mon, 7 Nov 2005 14:04:28 -0500
Received: from larry.melbourne.sgi.com (larry.melbourne.sgi.com
	[134.14.52.130])
	by omx3.sgi.com (8.12.11/8.12.9/linux-outbound_gateway-1.1) with SMTP
	id jA7JwdDY005932
	for <@external-mail-relay.sgi.com:linux-lvm@redhat.com>;
	Mon, 7 Nov 2005 11:58:40 -0800
Received: from wobbly.melbourne.sgi.com (wobbly.melbourne.sgi.com
	[134.14.55.135]) by larry.melbourne.sgi.com
	(950413.SGI.8.6.12/950213.SGI.AUTOCF) via ESMTP id GAA20424 for
	<linux-lvm@redhat.com>; Tue, 8 Nov 2005 06:04:20 +1100
Received: from wobbly.melbourne.sgi.com (localhost [127.0.0.1])
	by wobbly.melbourne.sgi.com (SGI-8.12.5/8.12.5) with ESMTP id
	jA7J4Xkt6425848
	for <linux-lvm@redhat.com>; Tue, 8 Nov 2005 06:04:34 +1100 (EST)
Received: (from nathans@localhost)
	by wobbly.melbourne.sgi.com (SGI-8.12.5/8.12.5/Submit) id
	jA7J4VLP6431745
	for linux-lvm@redhat.com; Tue, 8 Nov 2005 06:04:31 +1100 (EST)
Date: Tue, 8 Nov 2005 06:04:31 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] Failed xfs_growfs after lvextend
Message-ID: <20051108060431.B6400775@wobbly.melbourne.sgi.com>
References: <436CFA6E.5000607@svs.gsfc.nasa.gov>
	<20051107085843.B6401970@wobbly.melbourne.sgi.com>
	<436F7927.5080404@svs.gsfc.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <436F7927.5080404@svs.gsfc.nasa.gov>;
	from rajones@svs.gsfc.nasa.gov on Mon, Nov 07, 2005 at 10:56:23AM
	-0500
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Nov 07, 2005 at 10:56:23AM -0500, Randall A. Jones wrote:
> 
> Ok.  I looked at the things you suggested.  It seems that everything is 
> in order with the device mapper and it sees the 12.28TB device size. 
> Your getdevicesize.c code verified this with a BLKGETSIZE64 ioctl call.

Ah, excellent, sounds like that issue I had seen has been resolved.

> So, back to xfs.  Is it possible xfs_growfs is not working properly? 

Anythings possible, its unlikely though as we run it through
regression tests every day - the core functionality is sound,
its usually the interaction with drivers that gets fun.

> The result after running xfs_growfs was that the primary superblock on 
> the LV filesystem was corrupt or missing.

Do you know for sure that it wasn't corrupt/missing before running
xfs_growfs (iow, did you run repair vefore and after the extend)?

> Is there a workaround? 

Hard to say, without knowing what the problem is.

> A 12.28TB LV with xfs filesystem should work, yes?

Oh, definately.

> One idea for a workaround is to relocate the data on the misbehaving 
> LV/filesystem and recreate the LV and filesystem from scratch to avoid 
> using xfs_growfs.

It's not clear that growfs did anything wrong yet.  That approach will
also avoid use of lvextend, fwiw, and I'd expect recreate-from-scratch
will work as thats a commonly used scenario... so I guess thats your
best approach, unless you want to diagnose the problem more closely
(please do, for those who come after you...)

cheers.

-- 
Nathan

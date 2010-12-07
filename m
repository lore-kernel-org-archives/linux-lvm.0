Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oB72Fwgp010443
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 21:15:58 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB72FlDr005220
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 21:15:47 -0500
Received: from melissa.gathman.org (fairfax.gathman.org [72.209.196.211])
	(authenticated bits=0)
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id oB72FkvB011438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 6 Dec 2010 21:15:46 -0500
Message-ID: <4CFD98D2.70609@bmsi.com>
Date: Mon, 06 Dec 2010 21:15:46 -0500
From: Stuart D Gathman <stuart@bmsi.com>
MIME-Version: 1.0
References: <AANLkTi=EyqkiemX6PRXiTVKGAkXW-L8VoGw0-BQrygv7@mail.gmail.com>
In-Reply-To: <AANLkTi=EyqkiemX6PRXiTVKGAkXW-L8VoGw0-BQrygv7@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Configuring extent size
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 12/06/2010 08:33 PM, hansbkk@gmail.com wrote:
> Also, the man page state that the *default* extent size (if none is
> specified) is 4MB, but the HowTo states it's 32MB. Which is true?
>
> Or does this vary by vgcreate version, or per-distro configuration?
Based on experience, this varies by distro, so it must be a system
configuration option.
> having a large number of extents will slow down the tools

I believe only a large number segments (contiguous groups of extents)
slows things down.  I could be wrong. 

> leads me to:
>
> Would there be any negative impact of a very large extent size?
The only impact is unused space due to more granular allocation.

Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p372G8Uk016811
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 22:16:08 -0400
Received: from eastrmfepo201.cox.net (eastrmfepo201.cox.net [68.230.241.216])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p372G4MM018687
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 22:16:04 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmfepo201.cox.net
	(InterMail vM.8.01.04.00 201-2260-137-20101110) with ESMTP id
	<20110407021604.RZUW32549.eastrmfepo201.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 22:16:04 -0400
Message-ID: <4D9D1E63.9040200@cox.net>
Date: Wed, 06 Apr 2011 21:16:03 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
References: <4D9A9E2A.7070106@diala.gl3>	<1302079983.27047.454.camel@localhost>	<4D9CDC03.9020507@omiha.com>	<4D9CE08C.2010202@cox.net>
	<4D9D1C2D.5040907@omiha.com>
In-Reply-To: <4D9D1C2D.5040907@omiha.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM corruption/diagnosis
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 04/06/2011 09:06 PM, Jan Bakuwel wrote:
> Hi Ron,
>
> Thanks for your reply.
>
> Problem solved. It was my brain mixing /dev/d/ and /dev/mapper.
> Releasing the partition device with kpartx -d worked - as long as I use
> the correct path and not mix the VG name with "mapper".
>
> Duh...
>

:)

That's why I stick with vg/lv notation.

-- 
"Neither the wisest constitution nor the wisest laws will secure
the liberty and happiness of a people whose manners are universally
corrupt."
Samuel Adams, essay in The Public Advertiser, 1749

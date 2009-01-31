Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0V94BW1021312
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 04:04:11 -0500
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0V93tO4004639
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 04:03:56 -0500
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n0V93sKY014528
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 10:03:54 +0100
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id 170852C0AE
	for <linux-lvm@redhat.com>; Sat, 31 Jan 2009 10:03:38 +0100 (CET)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6JMZhCVNXG-6 for <linux-lvm@redhat.com>;
	Sat, 31 Jan 2009 10:03:37 +0100 (CET)
Date: Sat, 31 Jan 2009 10:03:37 +0100
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] lvcreate --mirror, specifying multiple PVs per copy
Message-ID: <20090131090336.GD9988@lupe-christoph.de>
References: <20090129075521.GB9988@lupe-christoph.de>
	<682C30CE-D69E-4726-8BE4-40037E7C84F7@mario-eckl.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <682C30CE-D69E-4726-8BE4-40037E7C84F7@mario-eckl.de>
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

On Friday, 2009-01-30 at 21:48:48 +0100, Mario Eckl wrote:

> You can force LVM to place the mirror log on a specific volume like  
> this:

And how do I force the mirror copies?

Thanks,
Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |

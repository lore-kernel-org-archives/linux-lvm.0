Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3GEgbFd014053
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 10:42:37 -0400
Received: from buexe.b-5.de (buexe.b-5.de [84.19.0.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3GEgAWc027054
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 10:42:11 -0400
Received: from alanya.lupe-christoph.de (alanya.lupe-christoph.de
	[172.17.0.19])
	by buexe.b-5.de (8.13.8/8.13.8/b-5/buexe-3.6.3) with ESMTP id
	n3GEgA4l032705
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 16:42:10 +0200
Received: from localhost (localhost [127.0.0.1])
	by alanya.lupe-christoph.de (Postfix) with ESMTP id E4A652C0AC
	for <linux-lvm@redhat.com>; Thu, 16 Apr 2009 16:40:57 +0200 (CEST)
Received: from alanya.lupe-christoph.de ([127.0.0.1])
	by localhost (alanya.lupe-christoph.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id QPMiasf-hRgk for <linux-lvm@redhat.com>;
	Thu, 16 Apr 2009 16:40:57 +0200 (CEST)
Date: Thu, 16 Apr 2009 16:40:57 +0200
From: Lupe Christoph <lupe@lupe-christoph.de>
Subject: Re: [linux-lvm] Simulating LVM Mirror Failure and recovery
Message-ID: <20090416144057.GA9705@lupe-christoph.de>
References: <29070.706.qm@web94806.mail.in2.yahoo.com>
	<49E71F9D.3010401@sivell.com>
	<20090416125403.GU7843@agk.fab.redhat.com>
	<49E7345B.1040002@brunson.com> <49E73987.3040604@brunson.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <49E73987.3040604@brunson.com>
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

On Thursday, 2009-04-16 at 07:58:31 -0600, Eric Brunson wrote:

> Upon review, I think it's correct, but worded awkwardly:

Maybe it's because I'm not a native speaker, but I find it difficult to
understand this differently.

>    In this example, the primary leg of the mirror |/dev/sda1| fails.

It fails. Not "we make it fail". No indication what makes it fail.

>    Any write activity to the mirrored volume causes LVM to detect the
>    failed mirror. When this occurs, LVM converts the mirror into a
>    single linear volume. In this case, to trigger the conversion, we
>    execute a |dd| command

"we execute a |dd| command" "to trigger the *conversion*". Not to make
it fail.

> I believe the dd is not to cause the failure, it's simply to generate  
> write activity to the volume group after the mirror leg has been caused  
> to fail through other means not documented.

... as they said ...

So the dd command the OP sent was correct after all. He just
misunderstood its purpose.

Now back to our original topic - how do you make a mirror copy fail? ;-)

Lupe Christoph
-- 
| There is no substitute for bad design except worse design.                   |
| /me                                                                          |

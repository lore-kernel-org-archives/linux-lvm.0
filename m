Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3L4LGO03799
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 00:21:16 -0400
Received: from mail.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3L4LEE9007934
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 00:21:15 -0400
Received: from [127.0.0.1] (longdrop.clunker.utsl.gen.nz [192.168.255.49])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.utsl.gen.nz (Postfix) with ESMTP id 213675845
	for <linux-lvm@redhat.com>; Thu, 21 Apr 2005 16:21:08 +1200 (NZST)
Message-ID: <42672A33.8030109@vilain.net>
Date: Thu, 21 Apr 2005 16:21:07 +1200
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems with df and lvm
References: <1d4.3a6991e2.2f97e909@aol.com>
In-Reply-To: <1d4.3a6991e2.2f97e909@aol.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Infoteq@aol.com wrote:
> So the drives are there, and I have put data on them, but for some 
> reason, it won't display it on df. I've looked all over for some sort of 
> clue as to why this happened, but have come up empty handed.

Your /etc/mtab isn't being updated when those filesystems are mounted,
for some reason.  Either that, or the filesystems aren't being mounted.

You can safely copy the contents of /proc/mounts over /etc/mtab.  But
ideally it should work without such manual intervention.  You'll have
to dig to the bottom of it, LVM is not directly causing the problem.

Sam.

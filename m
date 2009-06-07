Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n57BilKS012475
	for <linux-lvm@redhat.com>; Sun, 7 Jun 2009 07:44:47 -0400
Received: from mail.idrift.no (mail.idrift.no [83.242.12.60])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n57BiYgw002881
	for <linux-lvm@redhat.com>; Sun, 7 Jun 2009 07:44:34 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.idrift.no (Postfix) with ESMTP id 0760031402A
	for <linux-lvm@redhat.com>; Sun,  7 Jun 2009 13:44:33 +0200 (CEST)
Received: from mail.idrift.no ([127.0.0.1])
	by localhost (elros.idrift.no [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 06792-15 for <linux-lvm@redhat.com>;
	Sun, 7 Jun 2009 13:44:32 +0200 (CEST)
Received: from [172.16.30.34] (unknown [172.16.30.34])
	by mail.idrift.no (Postfix) with ESMTP id DB71731400B
	for <linux-lvm@redhat.com>; Sun,  7 Jun 2009 13:44:32 +0200 (CEST)
Date: Sun, 07 Jun 2009 13:44:32 +0200
From: Gaute Lund <gaute@idrift.no>
Subject: Re: [linux-lvm] Random file system errors
Message-ID: <34798D56CB2CB9B45352017A@LEYLA>
In-Reply-To: <20090429061910.348CD31402A@mail.idrift.no>
References: <20090429061910.348CD31402A@mail.idrift.no>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Thanks again Clyde, Geoff and f-lvm@media.mit.edu and others who gave 
advice. Turns out it was a RAM issue.

Just to close off this threadm, even if it's old. This is "only" a 
private/testing box, and I've been busy, so I've only been able to test 
stuff every now and then.

A few runs of memtest86 found no errors. I turned to the "md5sums of parts 
of disks" approach. If I read large chunks (5 GB), from different places on 
the disks, with 5+ iterations with each chunk, I got errors occasionally 
(diverging md5sums). But this is 10 disks across two controllers and all 
but two gave errors several times, albeit seldomly.

I started swapping hardware, and with different RAM I am OK. I guess clean 
runs of memtest shouldn't be trusted 100%. I can even say, the way these 
errors have crept up on me gradually over months(!), it means the RAM 
stick(s) have failed gradually, without being touched or anything. Scary!

-gaute

--On 29. April 2009 08:19 +0200 Gaute Lund <gaute@idrift.no> wrote:

> Thanks, and also to others who gave feedback. The approach with
> md5summing devices came from another source too, and I'll try a
> systematic approach as soon as time allows.

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l627Tvb0022919
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 03:29:57 -0400
Received: from carpentier.vpsland.com (carpentier.vpsland.com [207.210.113.97])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l627Tt2v023283
	for <linux-lvm@redhat.com>; Mon, 2 Jul 2007 03:29:55 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by carpentier.vpsland.com (Postfix) with ESMTP id B820D181BD
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 09:29:54 +0200 (CEST)
Received: from carpentier.vpsland.com ([127.0.0.1])
	by localhost (carpentier.vpsland.com [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id atO3Hi1qbGAi for <linux-lvm@redhat.com>;
	Mon,  2 Jul 2007 09:29:29 +0200 (CEST)
Received: from soetens.vdberg.org (h8441201224.dsl.speedlinq.nl
	[84.41.201.224])
	by carpentier.vpsland.com (Postfix) with ESMTP id 6593D18249
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 09:28:07 +0200 (CEST)
Received: from [192.168.0.34] (h8441201224.dsl.speedlinq.nl [84.41.201.224])
	by soetens.vdberg.org (Postfix) with ESMTP id 7A73214C1C6
	for <linux-lvm@redhat.com>; Mon,  2 Jul 2007 09:28:05 +0200 (CEST)
Message-ID: <4688A90B.8080507@vdberg.org>
Date: Mon, 02 Jul 2007 09:28:11 +0200
From: Richard van den Berg <richard@vdberg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problems(?) with pvresize
References: <4688A567.2030005@swip.net>
In-Reply-To: <4688A567.2030005@swip.net>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Lars Michael Jogb=EF=BF=BDck wrote:
> I've got a hardware-raid5 that I've extended (/dev/sdk), and after
> extending it, I get the kernel to recognize the new size.
> But pvresize is still using the old size. I'm pretty convinced that a
> reboot will solve this issue for me, but isn't there a way of solving
> this without rebooting?

I used "partprobe" that comes with parted, and it worked well for me.

Sincerely,

Richard van den Berg

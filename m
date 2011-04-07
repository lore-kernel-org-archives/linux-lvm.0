Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p3726lal023518
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 22:06:47 -0400
Received: from mail.ynet.co.nz (mail.ynet.co.nz [210.48.92.21])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3726kIW019047
	for <linux-lvm@redhat.com>; Wed, 6 Apr 2011 22:06:47 -0400
Received: from localhost (localhost [127.0.0.1])
	by mail.ynet.co.nz (Postfix) with ESMTP id 4975F2721A3
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 14:06:45 +1200 (NZST)
Received: from mail.ynet.co.nz ([127.0.0.1])
	by localhost (mail.ynet.co.nz [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nItWdkQ7PVlH for <linux-lvm@redhat.com>;
	Thu,  7 Apr 2011 14:06:41 +1200 (NZST)
Received: from [10.10.10.10] (unknown [210.48.92.11])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: omiha@ynet.co.nz)
	by mail.ynet.co.nz (Postfix) with ESMTPSA id 2B51A272158
	for <linux-lvm@redhat.com>; Thu,  7 Apr 2011 14:06:41 +1200 (NZST)
Message-ID: <4D9D1C2D.5040907@omiha.com>
Date: Thu, 07 Apr 2011 14:06:37 +1200
From: Jan Bakuwel <jan.bakuwel@omiha.com>
MIME-Version: 1.0
References: <4D9A9E2A.7070106@diala.gl3>
	<1302079983.27047.454.camel@localhost>	<4D9CDC03.9020507@omiha.com>
	<4D9CE08C.2010202@cox.net>
In-Reply-To: <4D9CE08C.2010202@cox.net>
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi Ron,

Thanks for your reply.

Problem solved. It was my brain mixing /dev/d/ and /dev/mapper.
Releasing the partition device with kpartx -d worked - as long as I use
the correct path and not mix the VG name with "mapper".

Duh...

Radu: the first test I'll do is not to zero the partition but to restore
the image now the partition device (/dev/d/xm.wxp1) is gone. I don't
understand why it's there in the first place (dom0 has no business
there). If that helps, the presence of that partition device apparently
interferes with the VM. If that doesn't help, I'll zero the blocks and
report back (some time next week).

thanks folks for the help,
Jan

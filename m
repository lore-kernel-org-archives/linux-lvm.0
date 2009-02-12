Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1C8f6JK011945
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 03:41:06 -0500
Received: from mail-fx0-f10.google.com (mail-fx0-f10.google.com
	[209.85.220.10])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n1C8do2O015277
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 03:39:50 -0500
Received: by fxm3 with SMTP id 3so1037036fxm.3
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2009 00:39:50 -0800 (PST)
MIME-Version: 1.0
Sender: pdftex@gmail.com
In-Reply-To: <b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
References: <3a4237470902110745l7f4ebda9s3539a329e83dace6@mail.gmail.com>
	<b072968d0902111358v66bb8d64h8bd9d54e9bf4b039@mail.gmail.com>
Date: Thu, 12 Feb 2009 09:38:08 +0100
Message-ID: <68c491a60902120038g6cede40ckaa5ae58600f5ff21@mail.gmail.com>
Subject: Re: [linux-lvm] About fstab and fsck
From: =?ISO-8859-1?Q?Martin_Schr=F6der?= <martin@oneiros.de>
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

2009/2/11 David Robinson <zxvdr.au@gmail.com>:
> filesystem... so considering its size, I'd turn it off. Hopefully the
> "fsck takes _forever_" problem will die when btrfs becomes the
> standard filesystem.

Just a reminder: Linux has xfs since 2002. A full-blown fsck on xfs is
a rare thing.

Best
   Martin

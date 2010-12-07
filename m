Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB77VutJ026681
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 02:31:56 -0500
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB77ViVB009356
	for <linux-lvm@redhat.com>; Tue, 7 Dec 2010 02:31:45 -0500
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTPA id 3E41C20009F
	for <linux-lvm@redhat.com>; Tue,  7 Dec 2010 08:31:42 +0100 (CET)
Date: Tue, 7 Dec 2010 08:31:34 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <109166456.20101207083134@marki-online.net>
In-Reply-To: <4CFD8A3F.8070403@bmsi.com>
References: <4CFD6563.70508@free.fr> <4CFD8A3F.8070403@bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] A hint on a process
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Tuesday, December 7, 2010, 2:13:35, Stuart D Gathman wrote:

> Your method will fail because the raid superblock is at the end of the
> partition.

I think it should be possible - just create bigger partition on the
bigger drive, synchronize, replace 2nd drive (also with bigger
partition), synchronize and then use mdadm --grow, which should grow
the md1 device to the full partition size. Then pvresize to resize the
PV inside VG and use can use the extra space.

-- 
  bYE, Marki

Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3M6E3Lx002481
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 02:14:03 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3M6DoMY031290
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 02:13:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id E4EC286F9B
	for <linux-lvm@redhat.com>; Thu, 22 Apr 2010 08:13:49 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 13hOFW7MimMz for <linux-lvm@redhat.com>;
	Thu, 22 Apr 2010 08:13:42 +0200 (CEST)
Date: Thu, 22 Apr 2010 08:13:42 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100422061342.GC23093@maude.comedia.it>
References: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
	<20100421053811.GA17339@maude.comedia.it>
	<loom.20100421T165609-625@post.gmane.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <loom.20100421T165609-625@post.gmane.org>
Subject: Re: [linux-lvm] resize an LVM physical volume
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Apr 21, 2010 at 02:58:32PM +0000, behzad wrote:
>I did the test by changing the sector at the start and the same things happened
please dump the existing partition data using sfdisk -d, then we can
talk about facts.

>,the partion was no more in pvdisplay list (I'll be on client site can verify
>that hope it must be the reason) , but What might happens that the fdisk changes
>the start sector of a partition when we re-create a partition ?
because fdisk by default creates an ms-dos compatible partition table
that starts on sector 63.

Since most storage array do read/write whole cache block to the disk and
no cache has a block size of 31.5K. Most storage vendors will tell you
to align the partition start to cache boundary (usually 64K or 128K)

Even M$ finally realized that and they create partitions starting at 1MB
from w2008 onwards.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \

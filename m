Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o3L5ca3p030387
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 01:38:36 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o3L5cH78020726
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 01:38:18 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id A907C86F44
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2010 07:38:16 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id Jyj7JmojRc-w for <linux-lvm@redhat.com>;
	Wed, 21 Apr 2010 07:38:11 +0200 (CEST)
Date: Wed, 21 Apr 2010 07:38:11 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100421053811.GA17339@maude.comedia.it>
References: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SNT144-w65AE38C3AAEDE1D8396FA3E40A0@phx.gbl>
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

On Tue, Apr 20, 2010 at 01:19:42PM +0000, behzad r wrote:
>On client system there is a lun(EMC) that contains one partition /dev/sde1 , the partition is already enveloped by LVM , they have  increased the lun but I need to increase the physical partition /dev/sde1 , I have created the following procedure that is working on virtualized linux node on primergy 
...
>but on bladeframe when I use the fdisk to increase the partition the system destroy everything the physical volume reject the partion  /dev/sde1 (when I run pvdisplay it's not on the list anymore)and all the data is destroyed I got a feeling that fdisk remove the /dev/sda1 and re-create a new one
probably the partition has been created, as per EMC specification, with
an offset bigger than 63 sectors, so when you destroy it and recreate it
does not start anymore in the same place.

A better solution would have been, as Philip said, not to partition at
all, and align the start of the data, but since you are there, you could
try using a different tool, i.e. parted to extend the partition instead
of recreating with fdisk.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \

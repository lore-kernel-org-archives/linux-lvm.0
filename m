Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o435cx7T014425
	for <linux-lvm@redhat.com>; Mon, 3 May 2010 01:38:59 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o435cmpI016044
	for <linux-lvm@redhat.com>; Mon, 3 May 2010 01:38:49 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id A080B86F28
	for <linux-lvm@redhat.com>; Mon,  3 May 2010 07:38:47 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id XBCgaApjgMXj for <linux-lvm@redhat.com>;
	Mon,  3 May 2010 07:38:42 +0200 (CEST)
Date: Mon, 3 May 2010 07:38:42 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100503053842.GA25863@maude.comedia.it>
References: <4BDDE17F.7090300@strike.wu.ac.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BDDE17F.7090300@strike.wu.ac.at>
Subject: Re: [linux-lvm] logical volumes and raid alignment
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

On Sun, May 02, 2010 at 10:33:03PM +0200, Alexander 'Leo' Bergolth wrote:
>Hi!
>
>I am using LVM on a hardware RAID 5 and I'd like to tune the alignment
>of lvm extents to match the raid stripe size.
>
>My raid chunk size is 64k and I am using 5 data-bearing discs (raid 5
>with 6 discs), so the raid stripe size should be 64k * 5 = 320k.
>
>I have already managed to properly align the partition to a multiple of
>this value and I am able to align the beginning of the first extent by
>specifying --dataalignment 320k to pvcreate.
>
>But unfortunately the --physicalextentsize must be a power of 2, so I
>cannot use a multiple of 320k as the physical extent size.
>
>What are your experiences with tuning and properly aligning lvm + raid?
>Does anyone know a workaround?
I had a similar issue, and best thing i came up with was creating volume
group with PE Size == chunk_size, and create/extend all logical volumes
to a multiple of data_disks PE.

L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \

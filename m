Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o4L5AcCo008649
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 01:10:38 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o4L5AR7m014331
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 01:10:28 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 909CA86FFE
	for <linux-lvm@redhat.com>; Fri, 21 May 2010 07:10:26 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 0VDp7FBGlBoN for <linux-lvm@redhat.com>;
	Fri, 21 May 2010 07:10:21 +0200 (CEST)
Date: Fri, 21 May 2010 07:10:21 +0200
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100521051021.GA1412@maude.comedia.it>
References: <4BF5A883.7060503@tlinx.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BF5A883.7060503@tlinx.org>
Subject: Re: [linux-lvm] Volume alignment over RAID
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

On Thu, May 20, 2010 at 02:24:19PM -0700, Linda A. Walsh wrote:
> I'm a bit unclear as to where some units are applied in my RAID setup, but
> was wondering how LVM interacted, could be, or should be setup so that
> created volumes would be aligned properly on top of a RAID disk.
note that if your rig uses fairly recent software data alignment should
happen automagically.

> I'm using a RAID 'chunk' size of 64k as suggested by the RAID documentation
> and am using 6 disks to create a RAID6, giving 4 units of data/stripe.  Does
I suppose by raid you mean md, so i wonder what documentation you were
looking at?
I think 64k might be small as a chunk size, depending on your array size
you probably want a bigger size.

Then, since with a six drive raid 6 stripe size is always a power of 2,
answers are easy :)

> this mean my logical volume needs to be aligned on a 64K boundary, or a 256k
> boundary? I.e. does 64k usually specify chunk/unit, or chunk/stripe?
align to stripe size

> What do I need to do to make sure my logical volumes always line up on RAID
> stripe boundaries?
make the volume group with pe size multiple of stripe size

> I've been using default logical volume parameters, which I think use an
> allocation size measured in Megabytes, so does that imply I'm automatically
> aligned (as 64k and 256k both divide into 1 Meg)?  Or is some offset
> involved?
run:
pvs -o pv_name,pe_start

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \

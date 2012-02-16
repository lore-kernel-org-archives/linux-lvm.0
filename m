Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1GFRXNI002078
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 10:27:33 -0500
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1GFRIpv027915
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 10:27:18 -0500
Received: by bkcjm19 with SMTP id jm19so2919160bkc.33
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 07:27:17 -0800 (PST)
Message-ID: <4F3D2053.7070401@profitbricks.com>
Date: Thu, 16 Feb 2012 16:27:15 +0100
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
References: <4F3D098F.4010709@profitbricks.com> <4F3D1593.9070609@ankh.org>
In-Reply-To: <4F3D1593.9070609@ankh.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Allocation Policy for Cloud Computing needed
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
To: James Hawtin <oolon@ankh.org>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi James,

thank you for your idea, but this is exactly what I don't want. I want
to have the LV completely on one PD if possible (but not all on the
first). Only if the customer requests more than the capacity of a single
hard drive I would provide striping, but only on that volume.

If all customers can access all hard drives at the same time this
results into very slow random IO. I've seen that on SW RAID-10. All the
rw-heads need to be repositioned over and over again.

Cheers,

Sebastian

On 16/02/12 15:41, James Hawtin wrote:
> I wrote a script to do this, with LVM 1 that just extended the lv in
> chunks over a range of PVs until it was full. while it worked on LVM
> it produced lots of backups in /etc. I felt with the LVM stripe
> function that this was not necessary, and  could acheive the same
> thing by using large stripe size, as LVM allows concats of different
> stripeness it was not a problem extending the lv. 

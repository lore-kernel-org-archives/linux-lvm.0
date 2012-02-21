Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1L9mtIX009323
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 04:48:55 -0500
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1L9mrSv023639
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 04:48:54 -0500
Received: by eekc14 with SMTP id c14so2566482eek.33
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 01:48:53 -0800 (PST)
Message-ID: <4F436883.3090106@profitbricks.com>
Date: Tue, 21 Feb 2012 10:48:51 +0100
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
References: <4F3D098F.4010709@profitbricks.com>	<20120220215911.GJ6331@barkeeper1-xen.linbit>
	<20120220164151.0c7f1b7a@bettercgi.com>
In-Reply-To: <20120220164151.0c7f1b7a@bettercgi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On 20/02/12 23:41, Ray Morris wrote:
> Since you're using RAID anyway, consider testing RAID 10, which will 
> distribute IO across spindles.

I've already tested RAID-10 with MD as well as letting LVM do the
striping. This is total equal: There are too many IO processes on all
spindles for good performance. All r/w-heads in RAID-10 have to be
repositioned over and over again.
Even in random IO this only reads from a single spindle per RAID-1 array.
Without striping MD RAID-1 has a good read balancing algorithm. With
that I can read from both spindles in the RAID-1 array simultaneously.

> For scripting, see Linux::LVM on CPAN. It gives you that information 
> as a nice data structure. I welcome feature requests and patches. 
> (Linux::LVM::Do coming soon for modifying rather than just querying 
> LVM objects.)

Thanks, I'll look at that.

Cheers,
Sebastian

Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAE3vnDG017777
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 22:57:49 -0500
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAE3vblk015069
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 22:57:38 -0500
Received: by eye27 with SMTP id 27so2556620eye.33
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2010 19:57:37 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20101113230310.GH14546@barkeeper1-xen.linbit>
References: <AANLkTimiX+2WZw5V8P0HjPvEXP6TAerJmFHq63Ktg2fD@mail.gmail.com>
	<20101113230310.GH14546@barkeeper1-xen.linbit>
Date: Sat, 13 Nov 2010 22:57:36 -0500
Message-ID: <AANLkTimpKv5YY9qJwmFTTKNMzOu+3BQ3nDQB-Y-m8oOT@mail.gmail.com>
From: Stirling Westrup <swestrup@gmail.com>
Subject: Re: [linux-lvm] Need help with a particular use-case for pvmove.
Reply-To: swestrup@gmail.com,
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 13, 2010 at 6:03 PM, Lars Ellenberg
<lars.ellenberg@linbit.com> wrote:
> You will then have to reduce the bad-old drive from the VG, and
> shutdown/unplug old/replug new, which of course involves downtime again.
>
> You should consider using some sort of RAID in the future.
>

My last server lost 80% of its data due to a bug in the raid software,
so I'm rather leery of going with a raid solution. I was hoping LVM
would be better.

-- 
Stirling Westrup
Programmer, Entrepreneur.
https://www.linkedin.com/e/fpf/77228
http://www.linkedin.com/in/swestrup
http://technaut.livejournal.com

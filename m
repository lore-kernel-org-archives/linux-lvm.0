Date: Wed, 7 Jun 2000 14:00:43 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607140043.B5442@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de>
Mime-Version: 1.0
In-Reply-To: <20000606184138.A8122@gruyere.muc.suse.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Jun 06, 2000 at 06:41:38PM +0200, Andi Kleen wrote:
> On a real production system you probably should not use software RAID1
> or RAID5 though. It is unreliable in the crash case though because
> it does not support data logging. In this case a hardware RAID controller
> is the better alternative. Of course you can run LVM on top of it.
I fail to get your point, what makes hw raid more reliable than sw raid?
why are you saying that sw raid is unreliable.

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

Date: Wed, 7 Jun 2000 17:34:20 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] LVM 0.8 and reiser filesystem
Message-ID: <20000607173420.C5442@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <H0000aed07d348ed@MHS> <20000606184138.A8122@gruyere.muc.suse.de> <20000607140043.B5442@colombina.comedia.it> <20000607145954.A22712@gruyere.muc.suse.de>
Mime-Version: 1.0
In-Reply-To: <20000607145954.A22712@gruyere.muc.suse.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Wed, Jun 07, 2000 at 02:59:54PM +0200, Andi Kleen wrote:
> In RAID5 that is very bad (e.g. when the parity block is not uptodate
> and another block is unreadable) you get silent data corruption. In
> RAID1 with a slave device you at worst get oudated data (may cause
I thought the event counter in the raid superblock was used for this
purpose.

[serious]
> Hardware RAID usually avoids the problem by using a battery backed 
> log device for atomic updates. Software Raid could do the same

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

Return-Path: <mike@marxmeier.com>
Date: Sat, 23 Dec 2000 17:58:31 +0000 (GMT)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] 0.9 tools compatible with 0.8 kernel? (and vice
 versa)
In-Reply-To: <200012220613.eBM6Dwx06755@webber.adilger.net>
Message-ID: <Pine.LNX.4.30.0012231751490.5052-100000@fogarty.jakma.org>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Linux LVM list <linux-lvm@msede.com>

On Thu, 21 Dec 2000, Andreas Dilger wrote:

> No.
>

eek.

> Yes, that's why we have been discussing all of the "LVM user tools wrappers"

ah, i tuned out out of that one cause i thought it was to do with
debian packaging.

> issues here over the last week.  With the current setup, you can't even
> _install_ multiple versions of the LVM tools at the same time, let alone
> have a single version handle multiple protocols.
>

ehhmm.. problem.

on-disk LVM isn't touched though, right? so it's just a tools issue,
right? ie, booting lvm 0.9 isn't going to leave me with on-disk
structures that 0.8 would barf on?

> Try out Marcelo's latest LVM user tools install, which is really required
> before trying to update your system, as it allows multiple versions of
> user tools to be installed and work well.  Also keep a boot floppy with the
> LVM 0.8 and LVM 0.9 tools available in case of trouble, if you don't have
> an emergency non-LVM boot partition.
>

my root is non-lvm. i think what'll do is remove the LVM v0.9 update
from t13pre4 and see how well it works wrt to the issues i had with
t12, before committing to upgrading lvm.

how stable is 0.9 compared to 0.8.1? (guess i should have paid more
attention to this list).

> rpm http://distro.conectiva.com.br/experimental/
>

excellent. thanks!

> Cheers, Andreas
>

happy christmas!

regards,
-- 
Paul Jakma	paul@clubi.ie	paul@jakma.org
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
The finest eloquence is that which gets things done.

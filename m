Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7RKRbnu010544
	for <linux-lvm@redhat.com>; Sun, 27 Aug 2006 21:27:37 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GHREH-0006k8-M0
	for linux-lvm@redhat.com; Sun, 27 Aug 2006 21:27:37 +0100
Date: Sun, 27 Aug 2006 21:27:37 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Creation of snapshots failing with `in use' errors
Message-ID: <20060827202737.GX13859@agk.surrey.redhat.com>
References: <87fyfirrhq.fsf@hades.wkstn.nix>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fyfirrhq.fsf@hades.wkstn.nix>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
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

On Sun, Aug 27, 2006 at 06:57:37PM +0100, Nix wrote:
> Specifically, snapshot creation randomly fails if you've recently done
> another LVM command. 

See if it's the usual udev problem: completely disable udev for your
lvm devices.  [Common problem is udev causing the device to be opened to
look for a label - then lvm command fails because it needs exclusive
access.]

> original filesystem, since LVM maintains a snapshot percentage counter

lvm2 doesn't maintain it, but while a device is active, kernel dm tells
userspace lvm2 the percentage full.

> This has not only not worked for no good reason (it's not in use! it's
> brand new!) 

udev is probably using it.
Old udev packages used to work OK, but something got changed - we never
discovered what (ref. an old debian bug) - and this started to break.

Some people at suse are working on a proper fix for this problem (so kernel
will inform udev when device is usable, instead of udev running too early as
it can now; udev will inform lvm2 when it has finished whatever pointless
things it wants to do and lvm2 will wait for that message).

Alasdair
-- 
agk@redhat.com

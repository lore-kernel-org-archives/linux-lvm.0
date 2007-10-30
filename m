Message-ID: <4727B561.50206@redhat.com>
Date: Tue, 30 Oct 2007 23:51:13 +0100
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM snapshot limits
References: <200710251447.43405.skruger@backcountry.com>	
	<47210A6B.6090104@redhat.com>
	<1193782605.6766.13.camel@skrugerLT.wvc.bcinfra.net>
In-Reply-To: <1193782605.6766.13.camel@skrugerLT.wvc.bcinfra.net>
Content-Transfer-Encoding: 7bit
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
To: Shaun Kruger <skruger@backcountry.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Shaun Kruger wrote:
> There is however one issue that probably needs attention.  If I create
> snapshots until I get an error (about 200 snaps), remove them, and
> repeat the creation/removal multiple times it is possible to destroy the
> LVM metadata.  When this happens pvscan shows that there is no VG
> associated with the physical volume.  Restarting results in full loss of
> data.  I was able to reproduce this twice.
> 
> While it is not impacting my use of LVM snapshots this is probably a bug
> that should be looked into.  It was quite worrying when my volume group
> disappeared.
> 
> I can provide my scripts and detailed instructions on reproducing the
> issue for anyone who is interested in looking into it.

Please create bug on bugzilla.redhat.com (lvm2 component)
(or report this through Red Hat support)
and attach your scripts there with description of problem, thanks.

Is the problem caused by overfilled metadata area on disk ?
(Will increasing metadata areas by "pvcreate --metadatasize ... " help ?)

Milan
--
mbroz@redhat.com

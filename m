Return-Path: <hch@ns.caldera.de>
Date: Tue, 6 Feb 2001 19:21:15 +0100
From: Christoph Hellwig <hch@caldera.de>
Subject: Re: [linux-lvm] startup stuff an dnew question :-)
Message-ID: <20010206192115.A24668@caldera.de>
References: <Pine.LNX.4.21.0102021438490.380-100000@munster.noc.fr.clara.net> <3A7E61D7.D417A879@twc.de> <20010205213917.C29990@bar.nowhere> <3A7FAB7A.29CFB419@twc.de>
Mime-Version: 1.0
In-Reply-To: <3A7FAB7A.29CFB419@twc.de>; from ulf@twc.de on Tue, Feb 06, 2001 at 08:44:58AM +0100
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Feb 06, 2001 at 08:44:58AM +0100, Ulf Bartelt wrote:
> ...but for now I never needed to resize /boot or /, only the other
> LVs...

With my grub patch (ftp.openlinux.org:/pub/people/hch/lvm) you should
be able to boot a kernel on a LV.

I havn't looked at it for about half a year, so it might not apply against
grub-current anymore.

For / there is initrd, my autoscan code is pretty dead now, sorry.

	Christoph

-- 
Of course it doesn't work. We've performed a software upgrade.

Return-Path: <claudio@conectiva.com>
Date: Sun, 17 Dec 2000 23:00:49 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] Debian packaging
In-Reply-To: <200012171800.eBHI0J129132@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0012172248260.28124-100000@scuzzlebutt.helllabs>
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
Cc: Tamas Gergely <dice@mfa.kfki.hu>

On Sun, 17 Dec 2000, Andreas Dilger wrote:

> As with other people, I think it would be best to place the LVM user utils
> into /sbin/lvm-<IOP version>.  However, I think it is NOT a good idea to
> put wrapper scripts in /sbin.  Instead, simply set the path at boot time
> (/etc/rc.d/rc.sysinit, and for root) to include the correct directory if
> it exists.

This approach is indeed much cleaner, but my concern is that it will make
all scripts that use the full path for the tools (e.g. /sbin/vgscan, or
[ -x /sbin/vgscan ]) fail.

I'm following Russel's idea in a experimental RPM package for Conectiva,
splitting the "lvm" package into lvm-base with the common files (requiring
a virtual lvm-tools) and lvm-iopXX (each IOP version providing lvm-tools).
This package layout should be good for apt-get as well. I'll make the SRPM
available as soon as I finish it, if anyone wants to have a look.


claudio

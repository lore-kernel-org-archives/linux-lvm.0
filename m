Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012202308.eBKN8GH02199@webber.adilger.net>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
In-Reply-To: <Pine.LNX.4.21.0012202018200.3255-100000@scuzzlebutt.helllabs>
 "from Claudio Matsuoka at Dec 20, 2000 08:21:16 pm"
Date: Wed, 20 Dec 2000 16:08:16 -0700 (MST)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: Gergely Tamas <dice@mfa.kfki.hu>

Claudio writes:
> On Thu, 21 Dec 2000, Russell Coker wrote:
> 
> > Thanks for the suggestion about checking for a directory.  But how will I 
> > determine what version of LVM if it's a directory?  Will there be 
> > /proc/lvm/version?
> 
> You can check the LVM and IOP version in /proc/lvm/global.
> 
> [claudio@pokey:/home/claudio] cat /proc/lvm/global
> LVM module version 0.9 (13/11/2000)
> 
> Total:  1 VG  1 PV  5 LVs (5 LVs open 5 times)
> 
> Global: 15258 bytes malloced   IOP version: 10   14:55:25 active
> 

My current (path-based) LVM startup (rc.sysinit) looks like:

# Try to load LVM module first in case it isn't compiled in or already loaded
[ -f /etc/lvmtab -a ! -e /proc/lvm ] && modprobe lvm 2> /dev/null
if [ -f /etc/lvmtab -a -e /proc/lvm ]; then
	[ -f /proc/lvm ] && IOP=`awk '/IOP/ { print $7 }' /proc/lvm`
	[ -d /proc/lvm ] && IOP=`awk '/IOP/ { print $7 }' /proc/lvm/global`
	[ "$IOP" -a -d /sbin/lvm-$IOP ] && PATH=/sbin/lvm-$IOP:$PATH

	vgchange -a y
	rc=$?

	# error handling
	if [ $rc -ne 0 ]; then
		# blah
	fi
fi

I also have the 3 lines of LVM path setting in the root .bashrc.
This approach means that anyone who has old tools directly installed in
/sbin can still survive the installation of new tools in /sbin/lvm-$IOP.

My next change will to have an lvmiopversion command (see below).  This
has the benefit of not needing extra parsing and such (like awk), and it
won't care what /proc/lvm is, or even if /proc is mounted.  It will also
have the side effect of loading the LVM module if it needs to be loaded.
This will leave me with the following in rc.sysinit/.bashrc:

if [ -f /etc/lvmtab ]; then
	IOP=`lvmiopversion 2> /dev/null`
	rc=$?
	if [ $rc -eq 0 ]; then
		[ -d /sbin/lvm-$IOP ] && PATH=/sbin/lvm-$IOP:$PATH
		vgchange -a y
		rc=$?
	fi

	# error handling
	if [ $rc -ne 0 ]; then
		# blah
	fi
fi

Heinz, can you consider adding the lvmiopversion.c file to the LVM CVS?
No matter which way we go it will probably be a useful command to have.

Cheers, Andreas
========================== lvmiopversion.c ===================================
/*
 * tools/lvmiopversion.c
 *
 * Copyright (C) 2000  Andreas Dilger <adilger@turbolinux.com>
 *
 * LVM is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2, or (at your option)
 * any later version.
 *
 * LVM is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with LVM; see the file COPYING.  If not, write to
 * the Free Software Foundation, 59 Temple Place - Suite 330,
 * Boston, MA 02111-1307, USA.
 */

#include <stdio.h>
#include <lvm_user.h>

#ifdef DEBUG
int opt_d;
#endif

char *cmd = "lvmiopversion";

int main(int argc, char *argv[])
{
	int ver = lvm_get_iop_version();

	if (ver < 0) {
		fprintf(stderr, "%s -- LVM driver/module not loaded?\n\n", cmd);
		return LVM_EDRIVER;
	}

	printf("%d\n", ver);
	return 0;
}

-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

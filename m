Return-Path: <claudio@conectiva.com>
Date: Thu, 21 Dec 2000 21:06:33 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script
 in debian package)
In-Reply-To: <200012212206.eBLM6qi00832@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0012212101510.15611-100000@scuzzlebutt.helllabs>
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
Cc: Gergely Tamas <dice@mfa.kfki.hu>

On Thu, 21 Dec 2000, Andreas Dilger wrote:

> Why not simply install it as one of the commands (e.g. vgscan) and make
> hard links to it.  Hard links don't even take up inodes - only directory
> entries.

Uhm.. yes, why not?


> gcc -I . -I lib -o lvmiopversion lvmiopversion.c lib/lvm_get_iop_version.c
> 	lib/lvm_check_special.c
> and stripped it is only 4408 bytes on my system.

Ok, lvm-base SRPM updated and uploaded to
http://distro.conectiva.com.br/experimental/.

Using hardlinks and lvmiopversion the script becomes:

#!/bin/sh
#
# This is a wrapper to call the appropriate LVM userspace tools based
# on the IOP version in use.
#
# 20001221  Claudio Matsuoka <clausio@conectiva.com>
# - using lvmiopversion to get the IOP version
#
# 20001220  Andreas Dilger <adilger@turbolinux.com>
# - fixed return values
# - better error messages
#
# 20001217  Claudio Matsuoka <claudio@conectiva.com>
# - first version

util=`basename $0`
iopver=/sbin/lvmiopversion

if [ ! -x $iopver ]; then
    echo "$util: $iopver not found (can't determine IOP version)" 1>&2
    exit 1
fi

IOP=`/sbin/lvmiopversion`
liblvm=/lib/lvm-iop${IOP}
lvmpkg=lvm-iop${IOP}

if [ ! -d $liblvm ]; then
    echo "$util: $liblvm not found.  Is $lvmpkg installed?" 1>&2
    exit 3
fi

exec $liblvm/$util "$@" # this will print out a localized error message for us

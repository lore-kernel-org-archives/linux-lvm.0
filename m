Return-Path: <claudio@conectiva.com>
Date: Wed, 20 Dec 2000 21:29:38 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
In-Reply-To: <200012202308.eBKN8GH02199@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0012202112590.3255-100000@scuzzlebutt.helllabs>
MIME-Version: 1.0
Subject: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script in debian
 package)
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

On Wed, 20 Dec 2000, Andreas Dilger wrote:

> My current (path-based) LVM startup (rc.sysinit) looks like:
> 
> # Try to load LVM module first in case it isn't compiled in or already loaded
> [ -f /etc/lvmtab -a ! -e /proc/lvm ] && modprobe lvm 2> /dev/null
> if [ -f /etc/lvmtab -a -e /proc/lvm ]; then
> 	[ -f /proc/lvm ] && IOP=`awk '/IOP/ { print $7 }' /proc/lvm`
> 	[ -d /proc/lvm ] && IOP=`awk '/IOP/ { print $7 }' /proc/lvm/global`
> 	[ "$IOP" -a -d /sbin/lvm-$IOP ] && PATH=/sbin/lvm-$IOP:$PATH
> 
> 	vgchange -a y
> 	rc=$?
> 
> 	# error handling
> 	if [ $rc -ne 0 ]; then
> 		# blah
> 	fi
> fi

I have lvm activation in /etc/rc.d/rc.sysinit (using an explicit modprobe
too, since just expecting the module to be auto-loaded fails in some
machines). I've placed it just after /proc mounting and before everything
else. Using the wrapper approach, the wrapper script looks like:

#!/bin/sh
#
# This is a wrapper to call the appropriate LVM userspace tools based
# on the IOP version in use.
#
# 20001217  Claudio Matsuoka <claudio@conectiva.com>
# - first version

ver_str="IOP version: "
proclvm=/proc/lvm
util=`basename $0`

if [ "$util" = "lvm-wrapper" ]; then
    echo "$util: you don't want to call the wrapper directly" 1>&2
    exit -2
fi

if [ -f $proclvm ]; then
    IOP=`grep "$ver_str" $proclvm|sed "s/.*$ver_str\([0-9]*\).*/\1/"`
elif [ -d $proclvm ]; then
    IOP=`grep "$ver_str" $proclvm/global|sed "s/.*$ver_str\([0-9]*\).*/\1/"`
else
    echo "$util: $proclvm not found (can't determine IOP version)" 1>&2
    exit -1
fi

exec /lib/lvm-iop${IOP}/$util $*


> I also have the 3 lines of LVM path setting in the root .bashrc.
> This approach means that anyone who has old tools directly installed in
> /sbin can still survive the installation of new tools in /sbin/lvm-$IOP.

Hmm, that's an interesting point. The wrapper approach won't allow
real files to be installed in /sbin (but package management should take
care of that).


> My next change will to have an lvmiopversion command (see below).  This
> has the benefit of not needing extra parsing and such (like awk), and it
> won't care what /proc/lvm is, or even if /proc is mounted.  It will also
> have the side effect of loading the LVM module if it needs to be loaded.

Sounds good. I'll use it in my tests too.


claudio

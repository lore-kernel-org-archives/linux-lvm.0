Return-Path: <dice@mfa.kfki.hu>
Date: Thu, 21 Dec 2000 09:37:58 +0100 (CET)
From: Gergely Tamas <dice@mfa.kfki.hu>
Subject: Re: [linux-lvm] '/etc/init.d/lvm' script in debian package
In-Reply-To: <0012210840470T.08762@lyta>
Message-ID: <Pine.LNX.4.31.0012210915340.10260-100000@falka.mfa.kfki.hu>
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
To: Russell Coker <bofh@coker.com.au>
Cc: linux-lvm@sistina.com

Hi!

> Thanks for the suggestion about checking for a directory.  But how will I
> determine what version of LVM if it's a directory?  Will there be
> /proc/lvm/version?
$ head -n 1 /proc/lvm/global
LVM driver version 0.9 (13/11/2000)

> LVM isn't something that you want to be automatically loading on demand,
> either you need it or you don't.  If you need it then you will probably want
> to compile it in or put it in /etc/modules for loading on boot.
Yes.

A few ideas ...
1) if LVM is compiled into the kernel and /boot/System.map is reachable,
than it could be detected using e.g. 'grep lvm System.map'

2) if /usr/src/kernel/.config is reachable, than it could be detected
using e.g. 'grep -i lvm .config'

3) maybe doing a check for directories countaining 'group' in /dev would
be a usable idea...

Maybe it would be a good idea to put a /proc/lvmstat (similar to mdstat)
as default (not (un)selectable) into proc FS. This would solve most of our
problems.

Gergely

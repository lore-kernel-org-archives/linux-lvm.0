Message-ID: <39F87B4F.E04E0131@attglobal.net>
Date: Thu, 26 Oct 2000 14:43:27 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: [linux-lvm] Error in lvmcreate_initrd ?
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

I think there is bug in the lvmcreate_initrd script. Notice in the clip
below the line after cmd-... where the variable VERRSION is set but then
in the next line VERSION is tested and set if null.  The net result is
that you are unable to pass in a module version to override the value
provided by VERSION=`uname -r`.

#
# Changelog
#
#   16/11/1999 - corrected -N type with mke2fs
#   19/12/1999 - use correct ramdisk size
#                strip shared library to save space
#   04/01/2000 - support /proc mount, because lvm_dir_cache now uses it
#

cmd=`basename $0`
VERRSION=$1
[ -z "$VERSION" ] && VERSION=`uname -r`
DEVRAM=/dev/ram1



-- 

Good Journey, longevity and prosperity to all

Les Hazelton

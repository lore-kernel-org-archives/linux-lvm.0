From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010262332.e9QNWSK19919@webber.adilger.net>
Subject: Re: [linux-lvm] Error in lvmcreate_initrd ?
In-Reply-To: <39F87B4F.E04E0131@attglobal.net> "from Les Hazelton at Oct 26,
 2000 02:43:27 pm"
Date: Thu, 26 Oct 2000 17:32:27 -0600 (MDT)
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Les Hazelton <seawolf@attglobal.net>
Cc: "linux-lvm@msede.com" <linux-lvm@msede.com>

Les Hazelton writes:
> I think there is bug in the lvmcreate_initrd script. Notice in the clip
> below the line after cmd-... where the variable VERRSION is set but then
> in the next line VERSION is tested and set if null.  The net result is
> that you are unable to pass in a module version to override the value
> provided by VERSION=`uname -r`.
> 
> #
> # Changelog
> #
> #   16/11/1999 - corrected -N type with mke2fs
> #   19/12/1999 - use correct ramdisk size
> #                strip shared library to save space
> #   04/01/2000 - support /proc mount, because lvm_dir_cache now uses it
> #
> 
> cmd=`basename $0`
> VERRSION=$1
> [ -z "$VERSION" ] && VERSION=`uname -r`
> DEVRAM=/dev/ram1

I've added this fix to my collection, and will make a new release soon.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

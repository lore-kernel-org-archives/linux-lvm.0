Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012210034.eBL0Yih02808@webber.adilger.net>
Subject: Re: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script
 in debian package)
In-Reply-To: <Pine.LNX.4.21.0012202112590.3255-100000@scuzzlebutt.helllabs>
 "from Claudio Matsuoka at Dec 20, 2000 09:29:38 pm"
Date: Wed, 20 Dec 2000 17:34:43 -0700 (MST)
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
> if [ "$util" = "lvm-wrapper" ]; then
>     echo "$util: you don't want to call the wrapper directly" 1>&2
>     exit -2
           ^^ I don't think this is legal...
> fi

Is there ever a reason why you would want to install this program as
"lvm-wrapper" anywhere?

> if [ -f $proclvm ]; then
>     IOP=`grep "$ver_str" $proclvm|sed "s/.*$ver_str\([0-9]*\).*/\1/"`
> elif [ -d $proclvm ]; then
>     IOP=`grep "$ver_str" $proclvm/global|sed "s/.*$ver_str\([0-9]*\).*/\1/"`
> else
>     echo "$util: $proclvm not found (can't determine IOP version)" 1>&2
>     exit -1
> fi
> 
> exec /lib/lvm-iop${IOP}/$util $*

Probably some simple checks for the existence of /lib/lvm-iop$iop and
/lib/lvm-iop$iop/$util and printing a nice message would be helpful, like:

LIBLVM=/lib/lvm-iop${IOP}
LVMPKG=lvm-iop${IOP}

if [ ! -d $LIBLVM ]; then
	echo "$util: $LIBLVM not found.  Is $LVMPKG installed?" 1>&2
	exit 3
fi
exec $LIBLVM/$util "$@"	# this will print out a localized error message for us


I think I will go with an approach like this as well, since it still keeps
/sbin/<lvmcommand> in place (for scripts that have this hard-coded).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

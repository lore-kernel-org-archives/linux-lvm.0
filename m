Return-Path: <claudio@conectiva.com>
Date: Thu, 21 Dec 2000 08:28:26 -0200 (BRST)
From: Claudio Matsuoka <claudio@conectiva.com>
Subject: Re: [linux-lvm] IOP selection scripts (was: '/etc/init.d/lvm' script
 in debian package)
In-Reply-To: <200012210034.eBL0Yih02808@webber.adilger.net>
Message-ID: <Pine.LNX.4.21.0012210820170.569-100000@scuzzlebutt.helllabs>
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

On Wed, 20 Dec 2000, Andreas Dilger wrote:

> Claudio writes:
> > if [ "$util" = "lvm-wrapper" ]; then
> >     echo "$util: you don't want to call the wrapper directly" 1>&2
> >     exit -2
>            ^^ I don't think this is legal...
> > fi

Oops. C-ism, I think.


> Is there ever a reason why you would want to install this program as
> "lvm-wrapper" anywhere?

I'm installing it as /sbin/lvm-wrapper and symlinking all utilities to it
(seems better than using one wrapper per tool).


> Probably some simple checks for the existence of /lib/lvm-iop$iop and
> /lib/lvm-iop$iop/$util and printing a nice message would be helpful, like:
> 
> if [ ! -d $LIBLVM ]; then
> 	echo "$util: $LIBLVM not found.  Is $LVMPKG installed?" 1>&2
> 	exit 3
> fi
> exec $LIBLVM/$util "$@"	# this will print out a localized error message for us

Indeed, it's better. Thanks.

Regarding lvmiopversion, is it supposed to be statically linked? Otherwise,
it wouldn't know what liblvm link to, assuming that we have liblvm-iopX.so.


claudio

Return-Path: <bluca@comedia.it>
Date: Sun, 11 Feb 2001 22:40:54 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
Message-ID: <20010211224053.B6755@colombina.comedia.it>
References: <3A85CE89.67D252D7@wrkhors.com> <17316403266.20010211154237@lopez.at> <20010211193524.B5840@colombina.comedia.it> <3A86F85C.ADEE5C04@wrkhors.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A86F85C.ADEE5C04@wrkhors.com>; from lembark@wrkhors.com on Sun, Feb 11, 2001 at 02:38:52PM -0600
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

> configure.in now looks like:
> 
>                           statically.  Default is dynamic linking], 
> STATIC_LINK=$enableval, STATIC_LINK=no)
> 
> if [[ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ]];
>  then  exec_prefix="";
> fi;
> 
> make distclean;
> ./configure --prefix=/opt/lvm/0.91 --enable-jobs=2;
> make all install fails w/ errors updating /lib, /sbin, etc.

i requote myself:
if you want to change the behaviour do this                                     
and rerun autoconf       
^^^^^^^^^^^^^^^^^^

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

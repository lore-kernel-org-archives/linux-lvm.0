Return-Path: <bluca@comedia.it>
Date: Sun, 11 Feb 2001 19:35:24 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
Message-ID: <20010211193524.B5840@colombina.comedia.it>
References: <3A85CE89.67D252D7@wrkhors.com> <17316403266.20010211154237@lopez.at>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <17316403266.20010211154237@lopez.at>; from adalbert.list@lopez.at on Sun, Feb 11, 2001 at 03:42:37PM +0100
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
To: LVM List <linux-lvm@sistina.com>

On Sun, Feb 11, 2001 at 03:42:37PM +0100, Adalbert Michelic wrote:
> Hi,
> 
> * On Sunday, February 11, 2001 at 00:28, Steven Lembark wrote:
> >         ./configure --prefix=/opt/lvm/0.9.1
> 
> > leaves only the man pages in the prefix dir, exec's still go
> > to /sbin.  this is bad news since it will blow off the entire
> > LVM installation the next time i test an install.  
[...]
> > so, prefix should set eprefix & friends which should leave the
> > binaries in /opt/lvm/0.9.1/sbin, etc.
> 
> You have to set --exec-prefix either - --prefix does _not_ modify
> --exec-prefix as far as i can see.

if you want to change the behaviour do this
and rerun autoconf
(NOTE exec_prefix should be set to "", not "/", because it is used as in
sbindir=${exec_prefix}/sbin )
	                  ^

--- ./configure.in.bluca        Sat Feb 10 13:00:50 2001
+++ ./configure.in      Sun Feb 11 19:22:22 2001
@@ -74,8 +74,8 @@
                           statically.  Default is dynamic linking],  STATIC_LINK=$enableval, STATIC_LINK=no)
 
 dnl Mess with default exec_prefix
-if [[ "x$exec_prefix" = xNONE ]];
- then  exec_prefix="/";
+if [[ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ]];
+ then  exec_prefix="";
 fi;
 
 dnl Checks for library functions.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

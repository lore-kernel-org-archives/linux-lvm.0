Return-Path: <lembark@wrkhors.com>
Message-ID: <3A86F85C.ADEE5C04@wrkhors.com>
Date: Sun, 11 Feb 2001 14:38:52 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 0.9.1-beta4 install bug
References: <3A85CE89.67D252D7@wrkhors.com> <17316403266.20010211154237@lopez.at> <20010211193524.B5840@colombina.comedia.it>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

 
> --- ./configure.in.bluca        Sat Feb 10 13:00:50 2001
> +++ ./configure.in      Sun Feb 11 19:22:22 2001
> @@ -74,8 +74,8 @@
>                            statically.  Default is dynamic linking],  STATIC_LINK=$enableval, STATIC_LINK=no)
> 
>  dnl Mess with default exec_prefix
> -if [[ "x$exec_prefix" = xNONE ]];
> - then  exec_prefix="/";
> +if [[ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ]];
> + then  exec_prefix="";
>  fi;

configure.in now looks like:

                          statically.  Default is dynamic linking], 
STATIC_LINK=$enableval, STATIC_LINK=no)

if [[ "x$exec_prefix" = xNONE -a "x$prefix" = xNONE ]];
 then  exec_prefix="";
fi;

make distclean;
./configure --prefix=/opt/lvm/0.91 --enable-jobs=2;
make all install fails w/ errors updating /lib, /sbin, etc.

Done Library parts

make[3]: Leaving directory `/scratch/LVM/0.9.1_beta4/tools/lib'
make[3]: Entering directory `/scratch/LVM/0.9.1_beta4/tools/lib'
*** Installing liblvm.a and liblvm-10.so in /opt/lvm/0.91//lib ***
rm: cannot unlink `//lib/liblvm-10.so': Permission denied
rm: cannot unlink `//lib/liblvm-10.so.0.9': Permission denied
rm: cannot unlink `//lib/liblvm-10.so.0': Permission denied
rm: cannot unlink `//lib/liblvm.a': Permission denied
make[3]: *** [install_this] Error 1
make[3]: Leaving directory `/scratch/LVM/0.9.1_beta4/tools/lib'
make[2]: *** [install] Error 2
make[2]: Leaving directory `/scratch/LVM/0.9.1_beta4/tools/lib'
make[2]: Entering directory `/scratch/LVM/0.9.1_beta4/tools/man8'
make[3]: Entering directory `/scratch/LVM/0.9.1_beta4/tools/man8'
make[3]: Leaving directory `/scratch/LVM/0.9.1_beta4/tools/man8'

<snip>

/opt/bin//install: //sbin: Operation not permitted
/opt/bin//install: cannot remove old link to `//sbin/vgscan': Permission
denied
/opt/bin//install: cannot create regular file `//sbin/vgscan':
Permission denied
rm: cannot unlink `//sbin/vgsplit': Permission denied
/opt/bin//install: //sbin: Operation not permitted
/opt/bin//install: cannot remove old link to `//sbin/vgsplit':
Permission denied
/opt/bin//install: cannot create regular file `//sbin/vgsplit':
Permission denied

and /opt/lvm/0.91 contains only the man directory.

still seems stuck on installing in /sbin


-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582

Message-Id: <3C6C414E.17B67D00@bellsouth.net>
From: Jeff Layton <laytonjb@bellsouth.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Building LVM ona RH7.2 - errors
References: <3C69A99A.398C19D4@bellsouth.net>
    <20020214072047.GA13317@colombina.comedia.it>
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
Date: Thu Feb 14 16:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Luca Berra wrote:

> On Tue, Feb 12, 2002 at 06:47:38PM -0500, Jeff Layton wrote:
> >    I tried building lvm-1.0.2 against a clean 2.4.17
> > kernel. I untarred the lvm tar.gz file as well as
> > the 2.4.17 kernel (into /usr/src/linux-2.4.17.clean).
> > Then I did a,
> guess redhat changed something with sed
>
> > checking whether time.h and sys/time.h may both be included... yes
> > ./configure: [: too many arguments
> > checking whether gcc needs -traditional... no
> try running
> sh -x ./scripts/linuxver -d /usr/src/linux-2.4.17.clean
> and see if we can guess what's wrong (probably the sed)

OK, here you go,

[root@home2 1.0.2]# sh -x ./scripts/linuxver -d /usr/src/linux-2.4.17.clean
+ getopts d:h option
+ linux_src=/usr/src/linux-2.4.17.clean
+ getopts d:h option
+ '[' x/usr/src/linux-2.4.17.clean = x ']'
+ file=/usr/src/linux-2.4.17.clean/Makefile
+ '[' '!' -e /usr/src/linux-2.4.17.clean/Makefile ']'
++ grep '^VERSION[[:blank:]]*='
++ cat /usr/src/linux-2.4.17.clean/Makefile
++ sed -e 's/^VERSION[[:blank:]]*=[[:blank:]]*\([[:digit:]]*\)\(.*\)/\1/'
+ major=2
++ cat /usr/src/linux-2.4.17.clean/Makefile
++ grep '^PATCHLEVEL[[:blank:]]*='
++ sed -e 's/^PATCHLEVEL[[:blank:]]*=[[:blank:]]*\([[:digit:]]*\).*/\1/'
+ minor=4
++ cat /usr/src/linux-2.4.17.clean/Makefile
++ grep '^SUBLEVEL[[:blank:]]*='
++ sed -e 's/^SUBLEVEL[[:blank:]]*=[[:blank:]]*\([[:digit:]]*\).*/\1/'
+ sublvl=17
++ cat /usr/src/linux-2.4.17.clean/Makefile
++ grep '^EXTRAVERSION[[:blank:]]*='
++ sed -e 's/^EXTRAVERSION[[:blank:]]*=[[:blank:]]*\([-+_.[:alnum:]]*\).*/\1/'
+ extraver=
+ '[' x '!=' x ']'
+ '[' -n 2 -a -n 4 -a -n 17 ']'
+ '[' -n '' ']'
+ echo 2.4.17
2.4.17


>
> > creating Makefile
> > sed: file conftest.s1 line 40: Unterminated `s' command
> try salvaging those conftest.s1 files before configure kills them
> and see what's in there.
>
> also which version of sed are you runnging (rpm -q sed)
> and which version of autoconf, if you have it installed

[root@home2 1.0.2]# rpm -q sed
sed-3.02-10

[root@home2 1.0.2]# rpm -q autoconf
autoconf-2.13-14



>
>
> last thing, try running autoconf in the base lvm source dir and
> see if configure works afterwards

No joy, same error messages as before:

[root@home2 1.0.2]# ./configure --with-kernel_dir=/usr/src/linux-2.4.17.clean
loading cache ./config.cache
checking for gawk... (cached) mawk
checking for gcc... (cached) gcc
checking whether the C compiler (gcc  ) works... yes
checking whether the C compiler (gcc  ) is a cross-compiler... no
checking whether we are using GNU C... (cached) yes
checking whether gcc accepts -g... (cached) yes
checking for a BSD compatible install... (cached) /usr/bin/install -c
checking whether ln -s works... (cached) yes
checking whether make sets ${MAKE}... (cached) yes
checking for dirent.h that defines DIR... (cached) yes
checking for opendir in -ldir... (cached) no
checking how to run the C preprocessor... (cached) gcc -E
checking for ANSI C header files... (cached) yes
checking for fcntl.h... (cached) yes
checking for malloc.h... (cached) yes
checking for sys/ioctl.h... (cached) yes
checking for unistd.h... (cached) yes
checking for working const... (cached) yes
checking for inline... (cached) inline
checking for off_t... (cached) yes
checking for pid_t... (cached) yes
checking for size_t... (cached) yes
checking for st_rdev in struct stat... (cached) yes
checking whether time.h and sys/time.h may both be included... (cached) yes
./configure: [: too many arguments
checking whether gcc needs -traditional... (cached) no
checking return type of signal handlers... (cached) void
checking for vprintf... (cached) yes
checking for mkdir... (cached) yes
checking for rmdir... (cached) yes
checking for uname... (cached) yes
creating ./config.status
creating Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating make.tmpl
sed: file conftest.s1 line 40: Unterminated `s' command
creating PATCHES/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/tools_and_lib.make.tmpl
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/lib/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command
creating tools/man8/Makefile
sed: file conftest.s1 line 40: Unterminated `s' command


Thanks for the advice. Any ideas?

Jeff


>
>
> Regards,
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Build bugs for lvm 1.0.1
Message-ID: <20011218132158.GD1189@tykepenguin.com>
References: <Pine.LNX.4.33.0112171205010.30369-100000@halden.devel.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0112171205010.30369-100000@halden.devel.redhat.com>
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
Date: Tue Dec 18 07:20:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Dec 17, 2001 at 12:13:38PM -0500, Trond Eivind Glomsr?d wrote:
> 1) Trying to set group/user on install is evil. It shouldn't be the 
>    default, as this option will fail when you build as non-root  

That's a fair point but not major as the tools will only run as root anyway so
installing them as non-root is not useful.
 
> 2) When using "--without-user --without-group", it tries to install with 
>    user/group of no/no. Needless to say, this fails.

Sounds like a bug.
 
> 3) It has prototypes of lseek64/basename which are incompatible with 
>    glibc. Use "-DGNU_SOURCE -O2" for CFLAGS and enjoy.

The only reason that -O0 is in there is as a workaround for the broken compilers
in Red Hat 7 :-(
 
> 4) It shouldn't look in /usr/src/linux for the linux kernel sources - 
>    look at /lib/modules/`uname -r`/build. Also, the current running kernel 
>    doesn't necesarrily (or for people who package it, almost certainly 
>    doesn't match) what you build it for.  

The purpose of needing a kernel directory is primarily as a target for the
kernel patch and it is overridden with the --with-kernel_dir= configure option.
If the user is rebuilding a new kernel then it is unlikely to be the same one as
they are running so I think using /lib/modules/... is maybe not the best option.

Agreed /usr/src/linux is not always going to be the right place either but
that's why there is an override.

patrick

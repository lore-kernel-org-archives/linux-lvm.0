Return-Path: <bluca@comedia.it>
Date: Tue, 12 Dec 2000 08:48:07 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Linux 2.4.0-test12-pre7 LVM .9 vs .8final
Message-ID: <20001212084807.A27177@colombina.comedia.it>
References: <Pine.OSF.4.21.0012081042590.14388-100000@mail.mnsu.edu> <3A3477D0.94BC1D88@twc.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Kj7319i9nmIyA2yE"
Content-Disposition: inline
In-Reply-To: <3A3477D0.94BC1D88@twc.de>; from ulf@twc.de on Mon, Dec 11, 2000 at 07:44:32AM +0100
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
To: linux-lvm@sistina.com

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Dec 11, 2000 at 07:44:32AM +0100, Ulf Bartelt wrote:
> A set of lvm tools for multiple versions of the io protocol could help a
> lot...
> 
> Sure this can be faked using links, wrappers etc...

i am using this piece of junk for testing and switching back btw 0.8 and 0.9

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

--Kj7319i9nmIyA2yE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm_wrapper.c"

/*
A wrapper for Linux LVM user space tools
No Copyright 2000 Luca Berra <bluca@vodka.it>

This program is free software: you can do anything you want
with it, I don't give a damn.

By using this piece of crap you agree that I (Luca Berra)
cannot be held responsible for any damage that it may cause.

To build: cc -o lvm_wrapper lwm_wrapper.c /usr/lib/liblvm.a
To use: move all lvm tools in /sbin/lvm/<iop>, where iop is the iop
	version supported by the tools (eg: 6 for lvm 0.8, 10 for lvm 0.9)
	install lvm_wrapper in /sbin.
	create links to lvm_wrapper for any program in /sbin/lvm/<iop>
	(for i in /sbin/lvm/*/*;do ln -s lvm_wrapper /sbin/${i##*/};done)

I suppose that if the tools are using a shared library you have changed the
shared library name to something including a version number.
else add a putenv("LD_LIBRARY_PATH=....") or putenv("LD_PRELOAD=....")
before the execv.

*/

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <string.h>
#include <stdio.h>
#include <limits.h>

#define LVM_CMD_PREFIX "/sbin/lvm"
struct stat buf;
char prog[PATH_MAX];
int opt_d = 0;

int
main(int argc, char **argv)
{
	int ret = lvm_get_iop_version();
	char *cmd = strrchr(argv[0], '/');
	if (cmd == NULL) {
	    cmd = argv[0];
	} else {
	    cmd++;
	}

	if (ret < 0) {
		fprintf(stderr, "%s -- LVM driver/module not loaded?\n\n", cmd);
		exit(-1);
	}
        
	snprintf(prog, PATH_MAX, "%s/%d/%s", LVM_CMD_PREFIX, ret, cmd);

	if (stat(prog, &buf) < 0) {
		fprintf(stderr, "%s -- invalid i/o protocol version %d\n\n", cmd, ret);
		exit(-1);
	}

	execv(prog,argv);
}

--Kj7319i9nmIyA2yE--

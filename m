Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200012222205.eBMM59319580@webber.adilger.net>
Subject: Re: [linux-lvm] [PATCH] user check in lvmiopversion
In-Reply-To: <Pine.LNX.4.30.0012221813290.1074-100000@pokey.distro.conectiva>
 "from Claudio Matsuoka at Dec 22, 2000 06:21:40 pm"
Date: Fri, 22 Dec 2000 15:05:09 -0700 (MST)
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

Claudio, you write:
> Quite trivial, but avoids misleading error messages like
> 
>   [claudio@pokey:/home/claudio] vgscan
>   lvmiopversion -- LVM driver/module not loaded?
> 
>   vgscan: /lib/lvm-iop not found.  Is lvm-iop installed?
> 
> when running a wrapped tool.

Argh.  I don't like the "SUSER_CHECK" at all (not your fault Claudio).
Basically, it doesn't do anything for us because the check is in user
space, so if there are LVM security holes someone could simply recompile
the user tools without the SUSER_CHECK.  All the access checks need to be
done inside the kernel.  Secondly, the permission shouldn't be by UID,
but rather read/write permission on the device files OR capabilities.

So, define SUSER_CHECK to nothing, because it doesn't help anyways.  I
will dig up my patch to have proper permission checking in the kernel.

> Also a test for the return value != 0 is needed in the wrapper script:
> 
> IOP=`/sbin/lvmiopversion`
> ret=$?
> if [ $ret -ne 0 ]; then
>     exit $ret
> fi

Yes.  In my version, if the IOP version wasn't set by lvmiopversion, it
would still try to use the old tools in /sbin.  With the wrapper scripts
this won't work.

int main(int argc, char *argv[])

	int ver = lvm_get_iop_version();

	if (ver < 0) {
		perror(cmd);
		fprintf(stderr, "%s -- LVM driver/module not loaded?\n\n", cmd);
	}

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] help with redhat install
Message-Id: <20020314141348.C8051@connectlive.com>
References: <5.1.0.14.2.20020313224659.0353c8a0@.>
    <20020314154803.I8376@majestic.ukshells.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020314154803.I8376@majestic.ukshells.co.uk>;
    from linux.lvm@codex.net on Thu, Mar 14, 2002 at 03:48:03PM +0000
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
Date: Thu Mar 14 13:14:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I prefer to do things statically when possible, but I do recall that LVM
is NOT enabled in the default RH7.2 kernel.  You should upgrade to
2.4.19 or at least 2.4.9-31 (RedHat patched) anyways, for various
reasons.  Use the opportunity to compile in LVM while you're at it.  :-)


Quoth Vincent AE Scott:
> Ed Jackson(ej_external@bigfoot.com)@Wed, Mar 13, 2002 at 11:03:47PM -0500:
> > I'm trying to install and use LVM on my redhat - but I'm having 
> > difficulties getting started.
> > 
> > I've tried to download and use the binaries at ftp.msede.com:
> > 
> > ftp://linux.msede.com/lvm/binaries/redhat/base/lvm-base-1.1-1.i386.rpm
> > ftp://linux.msede.com/lvm/binaries/redhat/base/lvm-base-1.1-1.src.rpm
> > 
> > and also all of the following files in:
> > 
> > ftp://linux.msede.com//lvm/0.9.1_beta/binaries/redhat/
> > 
> > lvm-iop10-0.9.1_beta7-1.i386.rpm
> > lvm-iop10-lib-0.9.1_beta7-1.i386.rpm
> > lvm-iop10-man-0.9.1_beta7-1.i386.rpm
> > lvm-iop10-patchgen-0.9.1_beta7-1.i386.rpm
> > 
> > 
> > When I install all of those RPMs with gnorpm, and try to run the wrapped 
> > shell scripts for anything to do with LVM (like pvcreate) I get an error 
> > message stating:
> > 
> > -------------- sample message --------------
> > vgcreate
> > lvmiopversion -- LVM driver/module not loaded?
> > 
> > vgcreate: /lib/lvm-iop not found.  Is lvm-iop installed?
> > -----------------------------------------------
> 
> 
> i'm unsure as to what it's trying to load a file from /lib, but i can
> only guess it's looking for the lvm kernel module.
> 
> 
>  
> > And when I search the current filesystem for anything named *lvm-iop* I get 
> > nothing.
> > 
> > I have added the following to /etc/modules.conf
> > 
> > alias block-major-58 lvm-mod
> > alias char-major-109 lvm-mod
> > 
> > 
> > 
> > 
> > Since that didn't seem to work - I removed those RPMs and tried to download 
> > the latest from ftp://ftp.sistina.com/pub/LVM/1.0/ and unpacked all 
> > files.  When I follow the instructions in the lvm-howto doc.. I run 
> > LVM/1.0.1-rc4/configure script, which seems to complete fine.
> > 
> > I then cd into PATCHES and try to run 'make' and get the following error:
> > 
> > -------------
> > make
> > You haven't applied the rawio patch, please see the README
> > make: *** [check_rawio] Error 1
> > ---------------
> > 
> > The README file only discusses the raw_io patch if I'm using a 2.2 
> > kernel.  But i'm currently using 2.4.9-31
> > 
> > 
> > Can anyone please help me out with this?  I'd like to just use the RPMs if 
> > possible - and the source code next if the RPMs don't work out.
> > 
> 
> 
> i know that mandrake ship an LVM enabled kernel, but maybe redhat dont?
> i dont use redhat, so i cant say eaitehr way.  but if in doubt of such
> things, it's always worth compiling your own.  get a recent kernel
> source tree, and get the latest LVM 1.0.3 ( at present ).  IIRC when you
> run make in the patches directory, it checks to see what patches have
> already been applied to /usr/src/linux.  and then whatever's new and
> needs to be included get's built into a custom patch.  which you then
> apply to the source tree.
> 
> oh, and make sure you enable the kernel option for LVM support when you
> recompile.
> 
> i've had a few problems getting LVM to work, and on the whole, if i'd
> started with a clean kernel, + lvm patch, and LVM userspace tools it'd
> have been a lot easier.
> 
> HTH,
> -vince
> 
> 
> -- 
> PGP key:  http://codex.net/pgp/pgp.asc
> 
>  It matters not whether you win or lose; 
>  what matters is whether I win or lose.
>  -- Darrin Weinberg
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 
    "Make it ten... I am only a poor corrupt official."
                  --Capt. Louis Renault, _Casablanca_

Return-Path: <Robert_Macaulay@Dell.com>
Message-ID: <8F120FA493CAD743B30EEB8F356985B54FD90E@AUSXMBT102VS1.amer.dell.com>
From: Robert_Macaulay@Dell.com
Subject: RE: [linux-lvm] LVM kernel patch request
Date: Mon, 2 Jul 2001 14:41:42 -0500 
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

I have had success with the 2.4.3 kernel from RedHat. The difference is I
didn't use RPMS, but went with the pure tarball. Following the INSTALL
instructions worked perfectly for me. 
Robert

> -----Original Message-----
> From: AJ Lewis [mailto:lewis@sistina.com]
> Sent: Monday, July 02, 2001 11:40 AM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM kernel patch request
> 
> 
> On Mon, Jul 02, 2001 at 01:48:39AM -0500, Tom Cosimano wrote:
> > I'm running Redhat 7.1 kernel vmlinux-2.4.2-2smp.  I have 
> tried a number
> > of times and can only conclude that I'm missing some step(s).
> > I have downloaded and installed the following RPMs from
> > ftp://ftp.sistina.com/pub/LVM/binaries/redhat/0.9.1_beta in 
> the order:
> > 
> > 1) lvm-base-1.1-1.i386.rpm
> > rebooted
> > 2a) lvm-iop10-0.9.1_beta7-1.i386.rpm
> > 2b) lvm-iop10-lib-0.9.1_beta7-1.i386.rpm
> > 3) lvm-iop10-man-0.9.1_beta7-1.i386.rpm
> > 4) lvm-iop10-patchgen-0.9.1_beta7-1.i386.rpm
> > rebooted
> 
> You need to build a kernel with LVM support built into it to 
> use this.  The
> default Redhat kernel does not have this.  The 
> lvm-iop10-patchgen* packages
> contain a stripped down version of the LVM source code made just for
> patching a stock kernel (from ftp.kernel.org).  If you need a 
> Redhat kernel
> that supports LVM, you should talk to Redhat and let them know it is a
> requirement of yours.
> 
> You should look at the LVM HowTo at 
> http://sistina.com/lvm/Pages/howto.html
> 
> Regards,
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 
> 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with 
> multiple sub-keys)
> 
> -----Begin Obligatory Humorous 
> Quote----------------------------------------
> File not found. Should I fake it? (Y/N)
> -----End Obligatory Humorous 
> Quote------------------------------------------
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-638-0500
> 1313 5th St SE, Suite 111              Fax:    612-638-0500
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 
> 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with 
> multiple sub-keys)
> 
> -----Begin Obligatory Humorous 
> Quote----------------------------------------
> Bad command or file name. Bad, bad command! Sit! Stay! Staaaay...
> -----End Obligatory Humorous 
> Quote------------------------------------------
> 

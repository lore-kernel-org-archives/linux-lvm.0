Return-Path: <carenas@chasqui.lared.net.pe>
Date: Wed, 4 Jul 2001 16:50:53 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] LVM on Redhat 2.4.3-12 Kernel
In-Reply-To: <20010704083759.A294@btconnect.com>
Message-ID: <Pine.LNX.4.33.0107041635050.27160-100000@chasqui.LaRed.net.pe>
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

<SNIP>
> > I have now upgraded from RH 7.0 to 7.1 and compiled LVM statically in the
> > 2.4.3-12 kernel that came with RH 7.1.  When I boot using this kernel LVM
> > doesn't work.  It still works if I go back to the 2.2.19 kernel.

weird, i have RH7.1 with a RH7.1beta kernel and running lvm0.9.1_beta6
without problems.

surelly the lvm patch could fit better on a linus kernel, but IMHO
RedHat's kernels are easy to patch and rebuild from the package.

and once you have a package it is far easier to duplicate the installation
on several machines that doing tar/patch/make.

actually i've been waiting for lvm 1.0.0 to make a new rpm to replace my
old kernel with a new 2.4.3-12 based one (no need to hurry so far)

if someone is interested i will post the tested packages when ready (BTW
anyone knows what happened to the 1.0 release that was supposed to be
yesterday?)

regards,

Carlo

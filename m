Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 20 Apr 2001 11:49:08 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] disk add means trouble: vgscan -- invalid i/o protocol version 5
Message-ID: <20010420114908.C569@tykepenguin.com>
References: <3ADB3B2A.B28AC133@mpi-hd.mpg.de> <20010416142849.B16508@sistina.com> <3ADF74AA.CEED3E97@mpi-hd.mpg.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ADF74AA.CEED3E97@mpi-hd.mpg.de>; from stefan.helfert@mpi-hd.mpg.de on Fri, Apr 20, 2001 at 01:28:42AM +0200
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

On Fri, Apr 20, 2001 at 01:28:42AM +0200, Stefan Helfert wrote:
> I am reposting this, since I believe I have run into a serious condition
> here:
> 
> A stable, running configuration consisted of one IDE disk with one LVM
> VG on it, and adding another IDE disk leads to a non-working vgscan. If
> I go back to the one IDE disk configuration, the LVM gets discovered,
> and adding the second disk again leads to non-working vgscan. 
> I cannot completely rule out any hardware issues here (since the disk
> with the LVM VG is apparently having lots of SMART redirects and
> significant access time increases), but I'd like to investigate this
> vgscan problem further.
> (Since it reduces my confidence in LVM very much, so much that I am
> currently killing the LVM on my terabyte raid because I do not want to
> see anything like that there.)
> 
> So if anyone has an idea of how to investigate this, I am open to
> experiments. If not, I'll send the disk back to the manufacturer for
> replacement.


The first thing to do is to get your kernel and user tools in sync so that 
you don't get th IOP message. If you have a kernel you like then node the LVM
version number in that kernel and build the tools for that version.

That should get vgscan working after some fashion. If the new disk still seems
to be causing the problem then please post the error here so we can have a look
at it.


patrick

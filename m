Return-Path: <scott@dixie.dyndns.org>
Date: Tue, 1 May 2001 12:05:48 -0400
Message-Id: <200105011605.f41G5kE31140@dixie.dyndns.org>
From: "S. Michael Denton" <scott@dixie.dyndns.org>
Subject: Re: Re: [linux-lvm] LVM & high system load
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Dominique.Larchey-Wendling@loria.fr wrote:
> Dominique LARCHEY-WENDLING wrote:
> 
> 
> > relatively poor IO perf. (my cpu is only PII 333) on LVM volumes. I
have
> > tested reiserfs and ext2fs and I only get about 2.5Mb/s with 100% CPU
> > load,
> > mostly system time.
> 
> More over, doing a CPU intensive task (like kernel comp.) (not involving
> LVM, the
> sources are not on a LV) cut the IO perf. of LVM fs by half.
> 
> So it seems that the LVM is eating a lot of CPU on my system and this is
> what is limiting fs perf.

I doubt it, I've got LVM0.9.1b7 on a 486 without any real load... even when
compiling the kernel.  I also have reiserfs on 2.2.19.	I noticed in your
previous post that you had 3 pv's on the same physical disk... that may be
contributing, depending on your PE layout on the PVs.  If not, it's
definitely silly :)

> DL
> 
> -- 
> Dominique Larchey
> LORIA, Nancy, France
> Tel. (Work) +33 (0) 3 83 59 20 13
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 

--------------------------------------------------------------------------
Scott Denton
smdenton@bellsouth.net
EFNet Handle: SteelWyng

Return-Path: <jdomingo@crosswinds.net>
Date: Fri, 29 Jun 2001 00:56:56 +0000
From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] HowTo: EIDE/ATA-100 + RAID 1 + LVM
Message-ID: <20010629005655.B4030@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8F120FA493CAD743B30EEB8F356985B5BB57D5@AUSXMBT102VS1.amer.dell.com>
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

On Thursday, 28 June 2001, at 16:46:10 -0500,
Robert_Macaulay@Dell.com wrote:

> About the Raid 1.
> [...]
> I know I changed 2 variables(RAM and RAID). I'm going to go back to HW raid
> 1 for now, and see if it makes a difference.
> 
I would choose hardware RAID instead os software RAID: this reduces CPU
overhead on the server, and avoids performance problems due to excesive
layering of "block devices".

2.4.x isn't "productoin quality" yet on some kinds of hardware, specially
those SMP machines with lots of RAM (requiring BIGMEM). That seems to be
your case, and is a known and (hopefully) soon-to-be-solved problem.

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk

Return-Path: <jdomingo@crosswinds.net>
Date: Fri, 11 May 2001 20:36:53 +0000
From: =?us-ascii?Q?Jos=E9_Luis_Domingo_L=F3pez?= <jdomingo@internautas.org>
Subject: Re: [linux-lvm] LVM 1.0 release decision
Message-ID: <20010511203653.B965@dardhal.mired.net>
References: <20010511155311.A17689@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010511155311.A17689@sistina.com>; from Mauelshagen@sistina.com on Fri, May 11, 2001 at 03:53:11PM +0000
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

On Friday, 11 May 2001, at 15:53:11 +0000,
Heinz J. Mauelshagen wrote:

> 
> As most of you probably know, we've got criticism a couple of weeks ago about
> our Linux kernel patch policy causing the LVM vanilla kernel code to differ
> from the one we release directly.
> 
IMHO it is a better long term solution to integrate current LVM into the
mainstream linux kernel base: maybe this causes LVM 1.0 schedule to be
postponed a couple of weeks, but benefits are great:

a) More developers looking at the code, and better and faster integration
with kernel changes (VFS and so on).

b) More people giving LVM a try: perhaps the need for patches and maybe
some tweaking with kernel sources prevented some users from using LVM.

c) Linux kernel's LVM version up to date. Those people trying LVM from
original 2.4.x source tree can get frustated with bugs/functionality of an
old LVM version. Would avoid bug reports on closed bugs.

d) Sooner or later, it has to be done, why wait ?

Greetings, and keep up the good work !

--
Jos� Luis Domingo L�pez
Linux Registered User #189436     Debian GNU/Linux Potato (P166 64 MB RAM)
 
jdomingo EN internautas PUNTO org  => � Spam ? Atente a las consecuencias
jdomingo AT internautas DOT   org  => Spam at your own risk

Return-Path: <ragnark@stine.vestdata.no>
Date: Mon, 16 Jul 2001 23:10:25 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <20010716231024.I14564@vestdata.no>
References: <85063BBE668FD411944400D0B744267A643418@AUSMAIL>
Mime-Version: 1.0
In-Reply-To: <85063BBE668FD411944400D0B744267A643418@AUSMAIL>; from Gonyou, Austin on Mon, Jul 16, 2001 at 03:42:00PM -0500
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

On Mon, Jul 16, 2001 at 03:42:00PM -0500, Gonyou, Austin wrote:
> I think ELVM at the bottom is EVMS. I wish I knew where the original article
> was, cause I'd like to know what 64bit frame he's talking about. Currently
> I'm using LVM for striping, and plan to use it with Fibre. From what I
> understand on this list, is that others are using it on fibre already. So,
> if they are using a 2.4 kernel, with fibre, wouldn't that mean that they'd
> need to employ 64-bit access(if they use a 64-bit controller+driver?)

I'm not sure what you mean here.

The 32/64 bit question in this thread was the datatype used to store
sector-numbers; the effect of using 32bit is that it limits the
device-size to 1 (2) TB.

If you're talking about 64 bit PCI busses and such; this is totally
unrelated.

And yes, we'd like to use LVM on FibreChannel devices, and need 64 bit 
sector numbers :)


-- 
Ragnar Kjorstad
Big Storage

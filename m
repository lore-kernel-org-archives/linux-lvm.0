Return-Path: <ragnark@stine.vestdata.no>
Date: Tue, 17 Jul 2001 20:10:24 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] FW: LVM on Linux
Message-ID: <20010717201024.B29034@vestdata.no>
References: <85063BBE668FD411944400D0B744267A643418@AUSMAIL> <20010717174008.A1000@btconnect.com>
Mime-Version: 1.0
In-Reply-To: <20010717174008.A1000@btconnect.com>; from Joe Thornber on Tue, Jul 17, 2001 at 05:40:08PM +0100
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

On Tue, Jul 17, 2001 at 05:40:08PM +0100, Joe Thornber wrote:
> This one keeps resurfacing so I had a look at it.
> 
> I had a look at Ben LaHaise's patch, it seems to be ensuring that all
> sector offsets are stored in a blkoff_t variable, which presumably is
> an unsigned 64 bit integer.  The rest of the patch goes through some
> of the block drivers (eg, loop) and ensures that no *, / or %
> operations are performed on blkoff_t's.  Good stuff.

blkoff_t is 64 bit on 64 bit machines, and configurable (32/64) on 32
bit machines. Excelent IMHO.



-- 
Ragnar Kjorstad
Big Storage

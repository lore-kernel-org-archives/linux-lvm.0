Return-Path: <vegard@engen.priv.no>
Date: Wed, 18 Apr 2001 17:08:58 +0200
Subject: Re: [linux-lvm] LVM and Kernel 2.4.3
Message-ID: <20010418170858.I31343@engen.priv.no>
References: <3ADDA60F.8F8F65DE@isoco.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3ADDA60F.8F8F65DE@isoco.com>; from jferruz@isoco.com on Wed, Apr 18, 2001 at 04:34:55PM +0200
From: Vegard Engen <vegard@engen.priv.no>
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

On Wed, Apr 18, 2001 at 04:34:55PM +0200, Javier Ferruz wrote:
> 
> 	I would like install LVM with kernel version
> 	2.4.3. I downloaded version 0.9.1beta7. 
> 
> 	The variables in PATCHES/Makefile are:
> 
> 
> 	KERNEL_DIR=/usr/src/linux
> 	LVM_VERSION=0.9.1_beta7
> 	KERNEL_VERSION=2.4.3
> 	
> 	The file PATCHES/README said "type 'make', 
> 	a file of the form
> 	lvm-<LVM_VERSION>-<KERNEL_VERSION>.patch
>   	should be built, but I haven't any file
> 	for version 2.4.3.
> 
> 	Can I use LVM with version 2.4.3 or I have to
> 	install 2.4.2?

I'm using LVM with version 2.4.3 and 0.9.1beta6 (out of convenience, there
was a debian package of it). I did the above. It worked, the patch applied
flawlessly. I *did* however get some problems, but it seems to be strictly
LVM snapshot-related, and did not cause any errors on the real volume. I sent
a detailed report to this list yesterday. I will, however, not trust LVM
snapshot yet for backup. And I have a full backup of the system in case
somehing *should* go wrong, although I have no reason to think so.

In fact, I've done a lot of LVM-manipulation these last few days, none of
them really failed, except for LVM snapshot. I have not tried things like
pvmove of a mounted system, though, but I have done lvextend and extended
filesystems on mounted filesystems.

- Vegard

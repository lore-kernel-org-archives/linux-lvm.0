Return-Path: <jan@moria.gondor.com>
Date: Tue, 9 Jan 2001 00:52:28 +0100
From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] Once again ... Kernel 2.4.0 - What can I do ?
Message-ID: <20010109005228.A7379@gondor.com>
References: <1504018708.20010108141026@lzer.net> <Pine.LNX.4.21.0101082133180.32197-100000@scuzzlebutt.helllabs>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.21.0101082133180.32197-100000@scuzzlebutt.helllabs>; from claudio@conectiva.com on Mon, Jan 08, 2001 at 09:40:55PM -0200
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

On Mon, Jan 08, 2001 at 09:40:55PM -0200, Claudio Matsuoka wrote:
> >   can I convert the volume to 0.9 without data-loss ???
> 
> The on-disk data structures are compatible, you only need a set of
> userspace tools with the same IOP as the kernel.

Well, sort of. When I actually tried it out, I got an error message
from LVM 0.8.1's vgscan:

vgscan -- ERROR "lvm_remouverecursive(): opendir" removing volume group director
y and special files
vgscan -- ERROR "lvm_remouverecursive(): opendir" creating "/etc/lvmtab" and "/e
tc/lvmtab.d"

vgscan -d showed me an interesting thing:

<4444> vg_check_name -- vg_name: "5HozPsvN3ueT3iLNQpeAE08HISKPy1O7"

First I thought that bogous vg_name may be caused by data corruption, until
I noticed that the string above is 0.9's uuid of that VG.

I didn't try to fix the bug as 0.9 is fine for me.

The above happend with some random -testxx-preyy kernel, so it may be 
caused by something completely different. I'm just not as sure as I was 
before that going back from 0.9 to 0.8 is possibly without any problems.


Jan

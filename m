Date: Mon, 13 Nov 2000 19:58:54 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Removing a PV
Message-ID: <20001113195854.D23680@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <Pine.BSO.4.21.0011131308530.14526-100000@loonybin.loonybin.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.BSO.4.21.0011131308530.14526-100000@loonybin.loonybin.net>; from rob@loonybin.net on Mon, Nov 13, 2000 at 01:12:23PM -0500
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Mon, Nov 13, 2000 at 01:12:23PM -0500, Rob Foehl wrote:
> If I want to completely pull a drive that belongs to a VG with an ext2
> formatted LV in it, what's the correct procedure to avoid mangling the
> filesystem? I currently have a 130 gig partition spread over six
> drives.. about 74 gigs is in use, and I wanted to remove a single 20 gig
> drive from the volume.. I'm assuming I should shrink the filesystem by
> around 30 gigs or so (to be safe), then somehow also shrink the LV and
> move any used PEs on the 20 gig drive in question onto freed space on
> other drives.. Any suggestions would be greatly appreciated.

ext2resize/resize2fs
lvreduce
pvmove
vgreduce


-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.

Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102100139.f1A1dD311523@webber.adilger.net>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with
 LVM. (fwd)
In-Reply-To: <Pine.LNX.4.20.0102092213070.401-100000@menswerk.cyclone.se> from
 Hans Engren at "Feb 9, 2001 10:21:44 pm"
Date: Fri, 9 Feb 2001 18:39:12 -0700 (MST)
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

Hans Engren writes:
> The problem I had here two days ago were almost fixed by the beta4
> release. I am still not quite aware of how to make sure this would work
> properly. See output below.
> [snip]
> # vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> zsh: 687 segmentation fault  vgscan

It would be good to know if this is a user-space segfault, or a kernel OOPS.

I was getting segfaults in vgscan yesterday, so I had a look at the whole
code path.  The actual segfault was due to my own bugs, but the good result
is that I cleaned up the code a lot (IMHO) so that the output from 
"vgscan -v -d" is cut by half or more.  This was not due to removing
debugging messages, but rather fixing the code so that it doesn't call
pv_check_name 100 times and lvm_dir_cache 3 or 4 times, etc.

I will post patches for my changes, but there are a lot, and it probably
won't be until Monday, so I can split them up.  If you are really
desparate, I have put a tarball of my current (patched) LVM source tree at:

http://bazaar.turbolinux.co.jp/~adilger/lvm-0.9-patched.tgz

This tarball is totally not for public release, just a quick dump of what
I currently have.  I don't think this will fix your problem, but at
least when you run vgscan -v -d you can have an idea what is going on.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

Date: Mon, 10 Apr 2000 20:43:58 -0700
From: "Peter C. Norton" <spacey@lenin.nu>
Subject: Re: [linux-lvm] lvm'ing root fs
Message-ID: <20000410204358.C20168@lenin.nu>
References: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca>
Mime-Version: 1.0
In-Reply-To: <E3A1ACFEDE71D3118C000020352285A03882E5@nbsjexm2.nbtel.nb.ca>; from marco.shaw@nbtel.nb.ca on Mon, Apr 10, 2000 at 09:59:11PM -0300
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Shaw, Marco" <marco.shaw@nbtel.nb.ca>
Cc: linux-lvm@msede.com

You may want to do the following:

cd /; find . -xdev -print | xargs tar -cf - | (cd /mnt/root_vg; tar -xf -)

With gnu tar this should do everything you need.  Files, directories,
devices, etc. 

-Peter

On Mon, Apr 10, 2000 at 09:59:11PM -0300, Shaw, Marco wrote:
> I've created an init ramdisk (lvmcreate_initrd), and now I'm in the process
> of trying to copy my root fs to my new lvm_root.  To reduce the disk I/O,
> I've gone down to single user mode to try to copy (cp -a *) all my files
> from root to lvm_root.  Twice I get the same results:
> 
> # cd /
> # cp -a * /mnt/root_vg
> cp: /mnt/root_vg/proc/kcore_elf: Invalid argument
> cp: proc/sys/net/ipv4/route/flush: Invalid argument
> 
> This is all I see on my screen, then at some point, the copying stops, and
> my system will not respond to keyboard input, except it will respond to
> Alt-F1/4 to switch virtual terms, but still no keyboard input accepted.
> 
> Should I tar/untar instead, or did I miss some fundamental step?
> 
> Thanks,
> Marco

-- 
The 5 year plan:
In five years we'll make up another plan.
Or just re-use this one.

Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103140016.f2E0GpJ05943@webber.adilger.int>
Subject: Re: [linux-lvm] vgcfgbackup problems
In-Reply-To: <20010313215629.A23749@prodding> from Kirth at "Mar 13, 2001 09:56:29
 pm"
Date: Tue, 13 Mar 2001 17:16:51 -0700 (MST)
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

Richard writes:
>         Hans Engren helped me fix my previous problem, so now I can at least
> mount the LVM (vgscan still ends up disableing it and I have to re-use
> vgcfgrestore to fix the problem). Once I got the LVM backup i thought i'd
> use vgcfgbackup, however here I hit a problem:
> 
> milita:~# vgcfgbackup
> vgcfgbackup -- ERROR: volume group "media" has an invalid number of physical
> volumes
> vgcfgbackup -- ERROR "vg_cfgbackup(): vg_check_exist" backing up volume
> group "media"
> 
>         Any ideas ? the software is:
> Logical Volume Manager 0.9
> Heinz Mauelshagen, Sistina Software  13/11/2000  (IOP 10)
> 
>         installed from lvm-0.9-2 via debian apt-get from sistina.com
> 
>         Also is it possible to fix the lvm so that vgscan does not destroy
> the volume group config ? (I think thats what it's doing).

You need newer tools - they fix a problem with vgcfgrestore (and the
rest of the tools) missing UUIDs from the disk.  Once you have the
new tools, vgcfgrestore should do the right thing.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

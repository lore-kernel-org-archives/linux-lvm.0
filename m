Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103302127.f2ULRi728029@webber.adilger.int>
Subject: Re: [linux-lvm] vgchange -- ERROR: can't get name(s) of physical volumes
In-Reply-To: <3AC4EE97.B98BF6A7@literal.si> from Jure Simsic at "Mar 30, 2001
 10:37:43 pm"
Date: Fri, 30 Mar 2001 14:27:43 -0700 (MST)
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

Jure writes:
> at boot I get vgscan detect my VGs (eg. home and lvm-tmp), but then i
> get vgchange -ay report the above message:
> 
>  vgchange -- ERROR: can't get name(s) of physical volumes
>  vgchange -- ERROR: Please check, if /proc is mounted
> 
> The curious thing is, that the only devices that the output mentions is
> /dev/hdc (by pv_get_size, pv_check_name, lvm_check_chars, pv_check_part
> and so), which is in fact my cdrom. No mention of any hda's or hdb's..

You have devfs compiled into the kernel, but not mounted.  Look into
/proc/partitions to see why it is broken. I would suggest that you remove
the devfs configuration from your kernel and recompile.  The support for
devfs is not super good right now.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

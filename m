Return-Path: <jss@kevorkian.evcom.net>
From: Jesse Sipprell <jss@evcom.net>
Date: Wed, 27 Dec 2000 16:59:05 -0500
Message-ID: <20001227165905.A24456@kevorkian.evcom.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] 0.8 to 0.9 problems, odd vg corruption
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

I've been in the process of upgrading four LVM 0.8final boxes to 0.9.  The
first three went off without a hitch: compile kernel with 0.9 patches, install
user tools and reboot.

The fourth one didn't go as smoothly:

After installing the new kernel, user-land tools and rebooting, vgscan is no
longer able to see the volume group (only one used on the box).

Rebooted back into 0.8, vgscan still doesn't work but I AM able to
vgcfgrestore the previous volume group config onto the physical volumes.

Reboot into 0.9.  vgscan sees the volume group and vgdisplay seems fine, but
when I try to run vgcfgbackup, it reports 'ERROR: volume group "vg04" has an
invalid number of physical volumes'  There are four physical volumes in the
group and vgdisplay -D vg04 looks perfectly normal.  I am also able to mount
the lvs and all filesystems appear good.  Next, I vgchange bounce the vg down
and then up and suddenly I am back to square one; vgscan no longer sees vg04
and my only recourse is to reboot to a 0.8 kernel and vgcfgrestore an old
backup.

Now I am stuck. ;)  I can vgcfgrestore from 0.8 and see it ONCE under 0.9, but
as soon as I vgchange -a it up and then down, the same "corruption" seems to
occur.  At no point can I seem to vgcfgbackup under 0.9, although 0.8 works
normally.

Anyone have any suggestions?

Best Regards,

-- 
Jesse Sipprell
Technical Operations Director
Evolution Communications, Inc.
800.496.4736

* Finger jss@evcom.net for my PGP Public Key *

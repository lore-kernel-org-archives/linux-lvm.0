Return-Path: <lembark@wrkhors.com>
Message-ID: <3A57B052.FA0DFBB2@wrkhors.com>
Date: Sat, 06 Jan 2001 17:54:58 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] any way to locate vg's on, say, /etc?
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
To: linux-lvm@sistina.com

currently have a choice:  LVM or devfs.  since devfs essentially
wipes out any /dev/blah dir's created after boot when it is 
remounted using /dev/ w/ vgcreate causes pain.  short of hacking
soft links or archiving the devices w/ cpio every boot, putting
the vol group dir's outside dev seems like the easiest fix.

personal guess would be /etc or /LVM as likely places.

just wondering if "/dev" is hard-coded or configurable
in the kernel headers somewhere...

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582

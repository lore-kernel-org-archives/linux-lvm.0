Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104050018.f350Iu910698@webber.adilger.int>
Subject: Re: [linux-lvm] alpha 2.4.2 + 0.9.1_beta6
In-Reply-To: <3ACB0FED.C7F0668F@lmt.lv> from Andrejs Dubovskis at "Apr 4, 2001
 03:13:33 pm"
Date: Wed, 4 Apr 2001 18:18:56 -0600 (MDT)
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

Andrejs Dubovskis writes:
> unfortunately, for my environment LVM subsystem does not look stable.
> AlphaServer AS400
> Redhat 7.0
> 2.4.2 + LVM 0.9.1_beta6
> 2 SCSI disk
> 
> pvcreate /dev/sda1
> pvcreate /dev/sdb2
> vgcreate vg01 /dev/sda1 /dev/sdb2
> lvcreate -i 2 -I 8 -l 2040 -n sms vg01
> mke2fs -m 0 /dev/vg01/sms
> 
> All test was done in single mode (no network, users, daemons, etc).
> 
> boot system in single mode 
> 
> vgchange -a y
> mount /dev/vg01/sms /opt
> dd if=/dev/zero of=/opt/1 count=10000
> dd if=/dev/zero of=/opt/2 count=100000
> dd if=/dev/zero of=/opt/3 count=1000000
> (dd commands' count every next boot may be different)
> Got kernel panic in interrupt handle.

Sorry, can't help you if you don't include ksymoops output (or at least
some more specific problem description).

> vgchange -a y 
> Got kernel panic in interrupt handle (not reproducible at next boot).

Need ksymoops info as well.  I don't have any non-ix86 systems to test on,
but at least we should be able to narrow down the problem a bit.  Note
that Andrea Arcangeli does test LVM on Alpha, so I'm surprised there are
major problems.  However, it may be that he has Alpha-specific patches
in his LVM code that are not in the standard LVM sources.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

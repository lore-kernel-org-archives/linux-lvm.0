Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105011618.KAA01133@lynx.turbolabs.com>
Subject: Re: [linux-lvm] LVM & high system load
Date: Tue, 1 May 2001 10:18:17 -0600 (MDT)
In-Reply-To: <3AEEAEAA.93304CBB@loria.fr> from "Dominique LARCHEY-WENDLING" at May 01, 2001 02:40:10 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Dominique Larchey writes:
> I am newbie to LVM. I am experiencing high cpu load (system time > 90%)
> and relatively poor IO perf. (my cpu is only PII 333) on LVM volumes.

Note that I am running LVM on Pentium 90 w 16MB RAM and no problems...

> I have tested reiserfs and ext2fs and I only get about 2.5Mb/s with 100% CPU
> load, mostly system time.

There is one other person that has reported very slow LVM performance.
However, there is no obvious reason why they have performance issues,
and others are unable to reproduce this problem.

Can you please try the following and report results:

time dd if=/dev/mmedia/music of=/dev/null bs=512
time dd if=/dev/mmedia/music of=/dev/null bs=65536
time dd if=/dev/hda1 of=/dev/null bs=512
time dd if=/dev/hda1 of=/dev/null bs=65536

Cheers, Andreas
-- 
Andreas Dilger                               Turbolinux filesystem development
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

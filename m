Return-Path: <milang@tal.org>
Message-ID: <001801c0e444$22d57f20$56dc10c3@tal.org>
From: "Kaj-Michael Lang" <milang@tal.org>
Date: Thu, 24 May 2001 14:24:43 +0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Raid5 sync problem
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
To: linux-raid@vger.kernel.org
Cc: linux-lvm@sistina.com

I'm mailing this to the LVM list as it might also be the cause of this.. I
don't know.

Anyway I have 4 6g drives in a RAID5 configuration. On top the md device I
have a VG and a couple of LV in it. I'm running 2.4.4 with the beta7 LVM
patch and using ext2 on all the LV's.
It now happened that one drive failed (actually just a IDE cable problem but
anyway) and the machine became really really slow. Load was up to 200 and
almost every command got stuck so all I could do was to boot.
It came up ok, and I hotadded the drive back and it started to sync but
after a while the sync was down to 0 kb/sec and the same slow-down started
to happen.
So I boot again.. and now when it started to fsck the LV's it slowed-down
again. So I booted with init=/bin/bash and let the sync finnish without any
other access to the RAID/LV's and after that everything worked fine again.

So the problem seems to be that when accessing the RAID5 while it is syncing
locks somewhere. Does anyone know of a fix or know what I should do so that
syncing won't kill the machine.


Kaj-Michael Lang
milang@tal.org
Java? I've heard of it, it is what I drink while hacking PHP!

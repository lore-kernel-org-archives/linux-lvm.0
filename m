Message-Id: <4.2.0.58.19990924114354.0095dc60@mail.lig.bellsouth.net>
Date: Fri, 24 Sep 1999 11:45:01 -0400
From: David Cooley <n5xmt@bellsouth.net>
Subject: [linux-lvm] Re: Linux LVM & Software RAID.
In-Reply-To: <Pine.LNX.4.10.9909241623500.1163-100000@gatekeeper.zwax.mt
 g.co.at>
Mime-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andreas Kostyrka <andreas@mtg.co.at>, Linux LVM Mailinglist <linux-lvm@msede.com>
Cc: linux-raid@vger.rutgers.edu

At 04:29 PM 9/24/1999 +0200, Andreas Kostyrka wrote:
>Hi!
>
>Just been wondering if somebody does have a working 2.2.12 system that
>does include these features:
>-) LVM 0.7
>-) md-raid0145
>
>Actually, I've tried to do this, but there is a small conflict in
>ll_rw_blk.c. Obviously I didn't solve it correctly, because after mkraid
>on /dev/md0 (RAID5 on 5 SCSI discs), my mke2fs crashed.
>
>So did anybody solve this conflict, or am I on my own?


I don't have LVM, but am running the 2.2.12 kernel with the o824 raid patch 
installed against it, and have 2 MD devices configured from 12 SCSI disks 
on a Sun Ultra 2.  It's rock stable.

===========================================================
David Cooley N5XMT Internet: N5XMT@bellsouth.net
Packet: N5XMT@KQ4LO.#INT.NC.USA.NA T.A.P.R. Member #7068
We are Borg... Prepare to be assimilated!
===========================================================

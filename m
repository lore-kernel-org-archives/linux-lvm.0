Date: Fri, 24 Sep 1999 16:29:24 +0200 (CEST)
From: Andreas Kostyrka <andreas@mtg.co.at>
Subject: [linux-lvm] Linux LVM & Software RAID.
Message-ID: <Pine.LNX.4.10.9909241623500.1163-100000@gatekeeper.zwax.mtg.co.at>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux LVM Mailinglist <linux-lvm@msede.com>
Cc: linux-raid@vger.rutgers.edu

Hi!

Just been wondering if somebody does have a working 2.2.12 system that
does include these features:
-) LVM 0.7
-) md-raid0145

Actually, I've tried to do this, but there is a small conflict in
ll_rw_blk.c. Obviously I didn't solve it correctly, because after mkraid
on /dev/md0 (RAID5 on 5 SCSI discs), my mke2fs crashed.

So did anybody solve this conflict, or am I on my own?

Andreas
--
Andreas Kostyrka                     | andreas@mtg.co.at
phone: +43/1/7070750                 | phone: +43/676/4091256   
MTG Handelsges.m.b.H.                | fax:   +43/1/7065299
Raiffeisenstr. 16/9                  | 2320 Zwoelfaxing AUSTRIA        

Date: Tue, 20 Jul 1999 22:40:02 +0100 (IST)
From: Paul Jakma <paul@clubi.ie>
Subject: Re: [linux-lvm] RAID and LVM?
In-Reply-To: <199907142305.AA12097@mailgate1b.telekom.de>
Message-ID: <Pine.LNX.4.10.9907202215420.12861-100000@hibernia.spin.ie>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com

Ok..

I've got 2.2.11pre1, patched with Ingo Molnar's
raid0145-19990421-2.2.6 (which I've been using for quite a while),
LVM 0.7 patch for 2.2.10 and devfs v99.4.

I applied the RAID0145 patch first, then LVM 0.7 2.2.10, finally
devfs. I had to hand apply a few LVM ll_rw_blk.c changes. Which was
fairly straight forward, except that md_make_request has changed for
RAID0145. it's now declared as:

int md_make_request (struct buffer_head * bh, int rw)

and part of the LVM patch to ll_rw_blk.c (round about line 713
of the old ll_rw_blk, line 751 in my ll_rw_blk.c) wants this:

md_make_request(MINOR (bh[i]->b_rdev), rw, bh[i]);

The new md_make_request doesn't have a device argument anymore, it
looks it up at the beginning of the md_make_request function in md.c
now. (but i don't know how important it all is, cause i don't know
the difference between a bh->b_dev and a bh->b_rdev). :)

I wasn't sure what to do so I left md_make_request in ll_rw_blk.c at: 

md_make_request( bh[i], rw);

Anyway... so then:

I have two RAID-5 devices, /dev/md/2 and /dev/md/3:

md3 : active raid5 sd/c0b0t3u0p6[2] sd/c0b0t2u0p6[1] sd/c0b0t1u0p6[0]
1050368 blocks level 5, 32k chunk, algorithm 0 [3/3] [UUU]
md2 : active raid5 sd/c0b0t3u0p5[2] sd/c0b0t2u0p5[1] sd/c0b0t1u0p5[0]
1050368 blocks level 5, 32k chunk, algorithm 0 [3/3] [UUU]

I have them initialised as PV's:

[root@hibernia tools]# pvcreate /dev/md/{2,3}
pvcreate -- reinitializing physical volume
pvcreate -- physical volume "/dev/md/2" successfully created
pvcreate -- reinitializing physical volume
pvcreate -- physical volume "/dev/md/3" successfully created

Now if try vgcreate:

[root@hibernia tools]# ./vgcreate test_vg /dev/md/{2,3}
vgcreate -- some invalid physical volumes in command line

So I'm stuck. Is this related to md_make_request using bh->b_dev
instead of bh->b_rdev? 

Should I add some #ifdef CONFIG_LVM: use bh->b_rdev to
md_make_request in md.c? Or should I revert md_make_request to a
accept
a MINOR number again?

thanks,
-- 
Paul Jakma
paul@clubi.ie	http://hibernia.clubi.ie
PGP5 key: http://www.clubi.ie/jakma/publickey.txt
-------------------------------------------
Fortune:
	*** System shutdown message from root ***

System going down in 60 seconds

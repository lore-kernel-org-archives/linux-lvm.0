Return-Path: <peter@bartosch.net>
Date: Tue, 29 May 2001 22:23:04 +0200
From: Peter Bartosch <peter@bartosch.net>
Message-ID: <20010529222304.A4888@mind.bartosch.net>
References: <20010528183105.C924@mind.bartosch.net> <15123.55304.751997.122954@crimson.namesys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15123.55304.751997.122954@crimson.namesys.com>; from zam@namesys.com on Tue, May 29, 2001 at 09:10:32PM +0400
Subject: [linux-lvm] Re: [reiserfs-list] lvm-list pointed to reiserfs: fs/lvm-problems?
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
To: reiserfs-list@namesys.com, linux-lvm@sistina.com

Hi!


>  PB> extend an existing (0.8i) LV)
> 
>  PB> so i created a new kernel (2.4.2) with lvm 0.9.1_beta7
> 
> Linux-2.4.4 has serious reiserfs bugs fixed.

hmm, i tried to make a LVM patch for it but this fails - yesterday i saw a
message, that there's somewhere a patch for the 2.4.4 that LVM-sources
will make a patch

>  PB> i created the reiserfs on it, but when i tried to mount it, the mount
>  PB> failed
>  PB> an reiserfsck --rebuild-sb and after that reiserfsck --rebuild-tree
>  PB> clears it and i could mount my LV -- UNTIL the next reboot
> 
> What kernel messages were ?
> 
> Sorry, but it looks for me like a lvm problem.  Can you test you LV by
> coping some random data (~ 64 MB) to a file in reliable location and
> to LV, and compare them (or md5 hashes) after reboot ?

hmm, i haven't really tried another filesystem, maybe i should try ext2?

> Reiserfs error handling not an ideal one.  Kernel oops below is a
> normal :( reaction on damaged data coming from disk.
> 
> Same reason (damaged data), I think, prevented reiserfs volume from
> mounting. 

yes you're right - but why does it oops when i _only_ want to do an "ls
-l"?

:wq - until next mail B-), l8r

Peter
-- 
   :~~~~~~~~~~~~~~~~~~  peter@bartosch.net  ~~~~~~~~~~~~~~~~~~:
   :          student of technical computer science           :
   :     university of applied sciences krefeld (germany)     :
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   FD314F21   C7 AE 2F 28 C1 33 71 77  0D 77 CD 6E 58 E9 06 6B

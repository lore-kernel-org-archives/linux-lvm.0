Return-Path: <peter@bartosch.net>
Date: Thu, 31 May 2001 20:40:03 +0200
From: Peter Bartosch <peter@bartosch.net>
Subject: Re: [linux-lvm] Re: [reiserfs-list] lvm-list pointed to reiserfs: fs/lvm-problems?
Message-ID: <20010531204003.A806@mind.bartosch.net>
References: <20010528183105.C924@mind.bartosch.net> <15123.55304.751997.122954@crimson.namesys.com> <20010529222304.A4888@mind.bartosch.net> <15124.56124.422024.340431@crimson.namesys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <15124.56124.422024.340431@crimson.namesys.com>; from zam@namesys.com on Wed, May 30, 2001 at 03:36:28PM +0400
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


>  >> 
>  >> Sorry, but it looks for me like a lvm problem.  Can you test you LV by
>  >> coping some random data (~ 64 MB) to a file in reliable location and
>  >> to LV, and compare them (or md5 hashes) after reboot ?
> 
>  PB> hmm, i haven't really tried another filesystem, maybe i should try ext2?
> 
> Yes, try to run this script over ext2:
> http://namesys.com/stress.sh

i've done that, but it gave me some cruel errors - like an ext2 panic or
so (can't find anything about it in the logs)

anyway - the PC was frozen


after the reboot e2fsck showed me that:

Inode 1313467 has imagic flag set.  Clear<y>? yes

Inode 1313468 is in use, but has dtime set.  Fix<y>? yes

and - of course not only once :-( but hundred times

>  >> Same reason (damaged data), I think, prevented reiserfs volume from
>  >> mounting. 
> 
>  PB> yes you're right - but why does it oops when i _only_ want to do an "ls
>  PB> -l"?
> 
> I agree with you, such behaviour is not good, but I do not think
> that you want to run reiserfs on an unstable block device.

it's (mostly) only because of the fschk-times -- this is (or should be)
an 125GB directory tree for music


the next step i'll do ist to give the new kernel (2.4.5) a try (hmm,
eventually with ac4-patch - i've read that there are some
reiserfs-issues are solved ...)


thanks for your attention


:wq - until next mail B-), l8r

Peter
-- 
   :~~~~~~~~~~~~~~~~~~  peter@bartosch.net  ~~~~~~~~~~~~~~~~~~:
   :          student of technical computer science           :
   :     university of applied sciences krefeld (germany)     :
    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   FD314F21   C7 AE 2F 28 C1 33 71 77  0D 77 CD 6E 58 E9 06 6B

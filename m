Subject: Re: [linux-lvm] 3Ware [OT] (was: Logical Volume max-size?)
References: <Pine.LNX.4.33.0111191335570.1679-100000@dragon.inside.ntisys.com>
From: Jason L Tibbitts III <tibbs@math.uh.edu>
In-Reply-To: Benjamin Scott's message of "Mon, 19 Nov 2001 13:58:50 -0500 (EST)"
Message-ID: <ufawv0mlgtg.fsf@epithumia.math.uh.edu>
MIME-Version: 1.0
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
Date: Mon Nov 19 13:06:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>>>>> "BS" == Benjamin Scott <bscott@ntisys.com> writes:

BS>   I ask because we have had success with their 6200 series as a
BS> mirrored drive controller, and have found 3Ware to be reasonably
BS> responsive.  We have not had the opportunity to try their RAID5
BS> offerings yet, and your comments certainly do not inspire
BS> confidence.

Why not?  The card works as advertised.  It supports RAID5.  It does
not do RAID5 very fast.  I wouldn't call it slow, but there are
controllers that do RAID5 faster, and software RAID5 will outperform
the card as well.  Since they publish performance numbers, all you
have to do is see if it's fast enough for you.

BS> I am wondering if it is an issue that can be corrected by, e.g., a
BS> firmware update, or if it is just a design flaw in the cards.

No design flaw; they were simply not originally designed to do RAID5.
People asked for it, so they implemented it.  The card just doesn't
have enough CPU horsepower to do everything at disk speed.  A 6810 is
still a great card for striping or mirroring and is quite cost
effective simply as a JBOD controller.

So BFD.  If you want blisteringly fast RAID5, buy a 7810 or a 7850.
You'll appreciate the 64-bit PCI anyway.

Anyway, this is all off topic and if this list didn't have a Reply-To:
set I wouldn't be replying here.  We do discuss this kind of thing on
linux-ide-arrays@lists.math.uh.edu.  It's run by Majordomo; send mail
to linux-ide-arrays-subscribe@lists.math.uh.edu to join.

 - J<

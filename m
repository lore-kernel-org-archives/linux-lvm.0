Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105251946.f4PJkXpg000560@webber.adilger.int>
Subject: Re: [linux-lvm] Raid5 sync problem
In-Reply-To: <001501c0e509$45251b60$56dc10c3@tal.org> "from Kaj-Michael Lang
 at May 25, 2001 01:55:52 pm"
Date: Fri, 25 May 2001 13:46:33 -0600 (MDT)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: linux-raid@vger.kernel.org

Kai-Michael writes:
> I *think* I've found out what happened (not sure, not tested), fsck was
> trying to scan all of the LVs on the same raid5 at the same time. And as the
> raid5 code had to calculate everything and trying to sync in the
> background... instant high load. But I'm not sure.. and I really don't wan't
> to test it..

Yes, there was a bug in fsck where if it couldn't determine if two devices
were on the same disk, it assumed they were NOT and did fsck in parallel.
In the MOST recent fsck (i.e. 1 week old, CVS only), this has been fixed
so that it will run the two fscks in serial.  Whether that was your problem
or not, I'm not sure.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

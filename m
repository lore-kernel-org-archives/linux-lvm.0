Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104161759.f3GHxlID013967@webber.adilger.int>
Subject: Re: [linux-lvm] What is the the maximum logical volume size?
In-Reply-To: <200104161649.f3GGnOu02530@lvadp.fc.hp.com> "from Andrew Patterson
 at Apr 16, 2001 10:49:24 am"
Date: Mon, 16 Apr 2001 11:59:47 -0600 (MDT)
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
Cc: andrew@lvadp.fc.hp.com

Andrew writes:
> > It may be 1 TB or it may be 2TB.  Depends on whether all of the code
> > in use use uses unsigned longs for block numbers, or if some use signed
> > longs.
> > 
> > Does it really matter?  This is PER LV, 
> 
> What does "PER" mean?

My Websters defines "per" as "for each [ 50 cents _per_ yard ]".  That
means, you can have up to 1TB (or maybe 2TB) for _each_ LV.  This is NOT
a 1TB limit for the total size of all the LVs in a single VG.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

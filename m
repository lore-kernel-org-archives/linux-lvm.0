Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102211725.f1LHPPv31859@webber.adilger.net>
Subject: Re: [linux-lvm] online resize of ext2
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF68399D@mailsrv.linkvest.com> from
 Jean-Eric Cuendet at "Feb 21, 2001 06:04:53 pm"
Date: Wed, 21 Feb 2001 10:25:24 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Jean-Eric Cuendet writes:
> What's the status of that thing? Is it stable for production use? 

I have been using it for quite some time without any problems, and there
have been no bug reports for a long time either.  The only recent change
was to update the kernel patch for 2.4.0, because some changes in the
quota code were causing it to oops.

Because the code is only used at resize time it does not affect normal
operations, so it is OK to put into a production kernel, IMHO (although
being the author makes me a bit biased ;-).  Any other ext2online users
out there?

> Will it go into the mainstream kernel anytime soon?

I haven't tried submitting it for 2.4.0 yet.  1.5 years ago when "the 2.4
kernel is going to be released very soon now", Linus, Alan, et. al. said
it would be added in 2.4 or 2.5.  Maybe it is time for me to try adding
the code to the 2.4 kernel again.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert

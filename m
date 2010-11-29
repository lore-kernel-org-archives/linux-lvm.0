Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATN5odd011984
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 18:05:50 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATN5gHt028680
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 18:05:42 -0500
Received: from r74-192-2-154.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.2.154] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1PNCmz-0008Bo-30
	for linux-lvm@redhat.com; Mon, 29 Nov 2010 15:05:41 -0800
Date: Mon, 29 Nov 2010 17:05:40 -0600
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <id19v6$rpv$2@taco.int.tagonline.com> (from
	ag2827189@tagmall.com on Mon Nov 29 16:37:26 2010)
Message-Id: <1291071940.28348.3@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Tool for defragmentation of extends?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="Flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

   There is no official lvm2 defrag tool, I don't believe.
The first link returned by Google seems like it might be useful,
though it requires more manual work than one might expect.

http://bisqwit.iki.fi/source/lvm2defrag.html

   The above utility also fails to run properly on my system.
Working on a defrag tool might be a good way to contribute
without necesarily being an expert or committing to spending
a lot of time, since it could be done incrementally.  It seems
to me it should be pretty simple to generate a sequence of
pvmove commands which result in a reasonable defrag, if we assume
that neither the moves nor the final result have to be optimal.
(For some definition of optimal).  Later, the algorithm could
be improved to result in a better final or result and/or achieve
that result with fewer moves.

    Thinking about this last night, one interesting point is
that different layouts would be optimal for different purposes.
We resize LVs often, so our ideal result would leave some free
space at the end of each LV to be used for future expansion.
For other usage patterns, making all of the free space contiguous
might be better.

    Somewhat outside the scope of deframentation itself, but an
essentially similar task, realtes to the location of snapshots
versus the origin LVs.  We use a lot of snapshots and replace PVs
fairly frequently, so our ideal result would put snapshots on the
same PV as the associated LV.

    The bisqwit.iki.fi tool looks like it would work well with these
different ideas of an "optimal" deframented layout because it allows
the sysadmin to specify what the layout should look like in the end,
then the tool generates the necesary pvmove commands.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php


On 11/29/2010 04:37:26 PM, Andrew Gideon wrote:
> I'm doing some manual pvmove-ing to reduce the amount of metadata  
> stored
> for a VG.  But it occurs to me: Finding a good final layout, and a  
> plan
> to get there, is the sort of thing at which computers are pretty good.
> 
> Is there a tool that will do this?
> 
> I did some searching, and all I found were suggestions to use pvmove.
> 
> 	- Andrew
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 

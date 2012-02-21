Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1LGZFrx005412
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:35:15 -0500
Received: from www.bettercgi.com (www.bettercgi.com [74.122.122.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1LGZ6bp018518
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:35:07 -0500
Received: from localhost (r74-192-17-33.bcstcmta01.clsttx.tl.dh.suddenlink.net
	[74.192.17.33])
	by www.bettercgi.com (Postfix) with ESMTPSA id EF11E21946
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 10:35:02 -0600 (CST)
Date: Tue, 21 Feb 2012 10:35:03 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20120221103503.4ba74c70@bettercgi.com>
In-Reply-To: <20120221120933.GB12645@agk-dp.fab.redhat.com>
References: <4F43588B.8040202@agenda.si>
	<20120221120933.GB12645@agk-dp.fab.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Duplicate PV's - how does LVM choose which one to
 use
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Perhaps when duplicates are found the seqno should be incremented 
so it DOES use the same one next time, and generate a warning 
indicating which one is out of date?
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Tue, 21 Feb 2012 12:09:33 +0000
Alasdair G Kergon <agk@redhat.com> wrote:

> On Tue, Feb 21, 2012 at 09:40:43AM +0100, Danilo Godec wrote:
> > How does LVM decide which one to use?  Will it always choose the
> > same one?
> 
> You can't rely on that.
> 
> I'm starting to wonder if we should add an lvm.conf option to stop
> when it sees duplicates of equal priority instead of going ahead and
> using one, and to make that the default behaviour.
> 
> Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

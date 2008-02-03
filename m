Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m13CL6aV005142
	for <linux-lvm@redhat.com>; Sun, 3 Feb 2008 07:21:06 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1JLdqM-0005IR-9l
	for linux-lvm@redhat.com; Sun, 03 Feb 2008 12:21:06 +0000
Date: Sun, 3 Feb 2008 12:21:06 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Incorrect metadata area header checksum
Message-ID: <20080203122106.GD8075@agk.fab.redhat.com>
References: <1202005131.5857.18.camel@localhost.localdomain>
	<47A53FC6.2040007@gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47A53FC6.2040007@gmail.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Feb 03, 2008 at 02:15:02PM +1000, David Robinson wrote:
> Eckhard Kosin wrote:
> >lvm2/dapper uptodate 2.02.02-1ubuntu1.5

> >  filter = [ "r|/dev/cdrom|", "r|/dev/hda[1,6,7]|" ]
 
> Is there any particular reason your modifying the filter setting? 
> Generally you shouldn't need to modify it, except for a few special 
> situations.
 
Indeed, that line is of course wrong if you now *intend* to use hda10!
('$' missing.)

(And upgrade 2.02.02 to something more recent.)

Alasdair
-- 
agk@redhat.com

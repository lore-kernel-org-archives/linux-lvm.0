Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o6A1EMr5010095
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 21:14:22 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o6A1EDx9023668
	for <linux-lvm@redhat.com>; Fri, 9 Jul 2010 21:14:13 -0400
Received: from r74-192-24-94.bcstcmta01.clsttx.tl.dh.suddenlink.net
	([74.192.24.94] helo=raydesk1.bettercgi.com)
	by ps536.phatservers.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.66) (envelope-from <support@bettercgi.com>)
	id 1OXOdw-0006py-En
	for linux-lvm@redhat.com; Fri, 09 Jul 2010 18:14:12 -0700
Date: Fri, 09 Jul 2010 20:14:11 -0500
From: Ray Morris <support@bettercgi.com>
In-Reply-To: <Pine.LNX.4.64.1007092051070.29512@bmsred.bmsi.com> (from
	stuart@bmsi.com on Fri Jul  9 20:01:02 2010)
Message-Id: <1278724451.8612.38@raydesk1.bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] efficiently copying snapshot data.
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

> > rsync/

> That doesn't do what he wants.  He wants to copy only
> the COW blocks.

   The COW blocks being those that are different between the
master and the snapshot, correct?  Have I been doing it wrong
all of these years, because I was under the distinct impression
that rsync copied only the differences.

    Perhaps the confusion is here is whether he wants the destination
to include nothing but the changed the blocks, but that doesn't
require any new LVM programming.  If you want the destination to be
a snapshot, only the differences, just take a snapshot on the
new machine and rsync from the old snapshot to the new snapshot.
A very few blocks might get duplicated because of file level versus
block level, but in practice that hasn't seemed to be significant.
At least, not for our 160 or so VMs.
--
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php

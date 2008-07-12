Received: from pobox.fab.redhat.com (pobox.fab.redhat.com [10.33.63.12])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6CGpkbO027513
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 12:51:46 -0400
Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id m6CGpjGQ030118
	for <linux-lvm@redhat.com>; Sat, 12 Jul 2008 12:51:45 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1KHiK1-0002l7-DC
	for linux-lvm@redhat.com; Sat, 12 Jul 2008 17:51:45 +0100
Date: Sat, 12 Jul 2008 17:51:45 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] vgchange -a memory consumption
Message-ID: <20080712165145.GC7155@agk.fab.redhat.com>
References: <1215842251.3751.53.camel@desktop>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1215842251.3751.53.camel@desktop>
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

On Fri, Jul 11, 2008 at 10:57:31PM -0700, Daniel Stodden wrote:
> I'm running, lvm2-2.02.26.
 
Don't bother investigating that version - stuff got changed.
Update to the latest release (or CVS) and try again.

> Why is that data reread? 

Because the two parts of the code are designed to be independent.  - The
so-called "activation" code sits behind an API in a so-called "locking"
module.  There's a choice of locking modules, and some send the requests
around a cluster of machines - remote machines will only run the
activation code and manage the metadata independently.  We just pass
UUIDs through the cluster communication layer, never metadata itself.

> Second: why isn't that memory freed after returning from
> activate_lv?
 
It's released after processing the whole command.  If there are cases
where too much is still being held while processing in the *current*
version of the code, then yes, you might be able to free parts of it
sooner.

Alasdair
-- 
agk@redhat.com

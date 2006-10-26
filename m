Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9QIXvNn030973
	for <linux-lvm@redhat.com>; Thu, 26 Oct 2006 19:33:57 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GdA3B-0001ca-KG
	for linux-lvm@redhat.com; Thu, 26 Oct 2006 19:33:57 +0100
Date: Thu, 26 Oct 2006 19:33:57 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] [RFC, 2nd try] Let udev play with snapshots
Message-ID: <20061026183357.GC1319@agk.surrey.redhat.com>
References: <20061011173421.GC4636@hasse.suse.de>
	<20061023134100.GB4729@hasse.suse.de>
	<20061024182158.GC29513@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20061024182158.GC29513@agk.surrey.redhat.com>
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

On Tue, Oct 24, 2006 at 07:21:58PM +0100, Alasdair G Kergon wrote:
> As discussed on irc, let's try to optimise out the deactivate/activate.

I've checked in an attempt to do this: it turns out that the current
structure of the code allows the simplest approach (skipping the cow
deactivate) to work regardless of whether or not options like --persistent
or --permission are supplied.  The 'snapshot' LV mapped device gets created
with the correct properties for the snapshot, but pointing to the cow and it
gets zeroed.  Then the cow is activated in a new mapped device and the old
one gets reused for the proper snapshot.

Alasdair
-- 
agk@redhat.com

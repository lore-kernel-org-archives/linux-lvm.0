Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n15Ml09Q027058
	for <linux-lvm@redhat.com>; Thu, 5 Feb 2009 17:47:00 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LVCzr-0000KG-Al
	for linux-lvm@redhat.com; Thu, 05 Feb 2009 22:46:59 +0000
Date: Thu, 5 Feb 2009 22:46:59 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 specificiation
Message-ID: <20090205224659.GU20668@agk.fab.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
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

On Thu, Feb 05, 2009 at 01:54:00PM -0800, Vinay Srini wrote:
> I have a requirement to mount multiple volume groups with the same name 
> (VolGroup00, as that is the most popular default name), without first 
> using vgrename (because something might go wrong, and I may not be able 
> to restore the name back).
 
It was an early design decision that every VG on a system should have a
different name.  Departures from that won't get supported - because it's so
simple to choose different names!

Alasdair
-- 
agk@redhat.com

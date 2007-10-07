Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l97GQxN5024287
	for <linux-lvm@redhat.com>; Sun, 7 Oct 2007 12:26:59 -0400
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IeYy3-0004Oh-Tt
	for linux-lvm@redhat.com; Sun, 07 Oct 2007 17:26:59 +0100
Date: Sun, 7 Oct 2007 17:26:59 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM Specifications
Message-ID: <20071007162659.GL10006@agk.fab.redhat.com>
References: <000001c808fc$31cfc560$02b2a8c0@sandropc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000001c808fc$31cfc560$02b2a8c0@sandropc>
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

This topic came up before and my answer is compile and build the
existing userspace code on that platform, and we'll accept patches
upstream to facilitate that.  (It already works on Mac OS X.)
The ongoing work towards an LVM library should help with this.

Kernel-side, yes, you'll need to write a new driver.  And if you decide
to do a new GUI rather than extending an existing one, again, consider
designing it to be cross-platform.

Alasdair
-- 
agk@redhat.com

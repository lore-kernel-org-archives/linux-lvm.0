Received: from homer.msp.redhat.com (homer.msp.redhat.com [172.16.30.9])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i1D08Pi09472
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 19:08:25 -0500
Received: (from agk@localhost)
	by homer.msp.redhat.com (8.11.6/8.11.6) id i1D08OH30477
	for linux-lvm@redhat.com; Thu, 12 Feb 2004 18:08:24 -0600
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm pvscan or vgscan very slow
Message-ID: <20040212180824.O10533@homer.msp.redhat.com>
References: <402C0D65.80905@caltech.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <402C0D65.80905@caltech.edu>; from ling@caltech.edu on Thu, Feb 12, 2004 at 03:33:57PM -0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Thu Feb 12 19:07:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 12, 2004 at 03:33:57PM -0800, Ling Li wrote:
> I am using Fedora 1 with some packages updated from the fedora 
> development in order to use kernel 2.6 and LVM2. The operation `lvm 
> pvscan' and `lvm vgscan' are very slow, taking about 20-30 min. Is this 
> normal, or is this because there is no /etc/lvm.conf file?
 
It shouldn't be that slow!

Look at your system log and/or run with -vvv to see why it's so slow.

We've a couple of speed-ups that might help (one uses sysfs to reduce
the number of devices to scan) - they're in the queue of things waiting
to be checked into CVS after the repository move.
I'll try to get them imported tomorrow.
 
Alasdair
-- 
agk@redhat.com

Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id lAMG5e5B014744
	for <linux-lvm@redhat.com>; Thu, 22 Nov 2007 11:05:40 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1IvEYe-000656-LJ
	for linux-lvm@redhat.com; Thu, 22 Nov 2007 16:05:40 +0000
Date: Thu, 22 Nov 2007 16:05:40 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Steps to "clone" a volume group
Message-ID: <20071122160540.GA22843@agk.fab.redhat.com>
References: <47459DD3.5090901@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47459DD3.5090901@redhat.com>
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

Fine for testing, but if running this on a production system
you should tweak this so that your machine remains bootable
should it crash at any stage of the procedure.

On Thu, Nov 22, 2007 at 03:18:43PM +0000, Bryn M. Reeves wrote:
> 1. Deactivate the VG
 
Not necessary if done as follows.

> 2. Create the cloned PV(s)
> 3. For each original PV, create a filter entry in /etc/lvm/lvm.conf to
> temporarily mask the PV from the LVM tools.

Swap order there: the system's lvm.conf should mask out the new PVs
*before* they get created.

> Once the filters are set up, remove the LVM persistent cache:

Never required: the pvscan will do that for you.

Create a temporary alternative lvm system directory holding 
a copy of lvm.conf that has filters to accept only
the new copies of the PVs and set LVM_SYSTEM_DIR to use it.

Only now do step 2.

> 4. Modify the cloned volume group name, ID and physical volume IDs to
> avoid name and UUID clashes between the original and cloned devices:

(with LVM_SYSTEM_DIR set)
 
> 5. Remove filtering rules & verify both VGs co-exist correctly

discard LVM_SYSTEM_DIR env var & directory

Alasdair
-- 
agk@redhat.com

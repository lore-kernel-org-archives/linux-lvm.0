Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBVFMZWl024369
	for <linux-lvm@redhat.com>; Fri, 31 Dec 2004 15:22:35 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CkObr-0004mD-R2
	for linux-lvm@redhat.com; Fri, 31 Dec 2004 15:22:35 +0000
Date: Fri, 31 Dec 2004 15:22:35 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Rebuilding physical volume metadata
Message-ID: <20041231152235.GY26670@agk.surrey.redhat.com>
References: <e5146c2a04123020236f018fdb@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5146c2a04123020236f018fdb@mail.gmail.com>
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

On Thu, Dec 30, 2004 at 11:23:22PM -0500, Sasha Z wrote:
> I had a healthly LVM four days ago, but came home to an LVM that no
> longer had an PV's, and a computer without an PV's listed.
 
What version of LVM2?  ('lvm version')

If it's above 2.00.25 then upgrade to 2.00.32.

Versions 2.00.26 to 2.00.31 are best avoided because of
problems recognising certain partitioning schemes correctly,
which can cause PVs to appear to disappear. [Can often work 
around by changing lvm.conf.]

> So I had to recreate the physical volumes, and that went ok. 

No - read the 'vgcfgrestore' man page for instructions.

Alasdair
-- 
agk@redhat.com

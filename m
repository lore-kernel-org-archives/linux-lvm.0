Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j5SLen3N031403
	for <linux-lvm@redhat.com>; Tue, 28 Jun 2005 22:40:49 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DnNp3-0000hU-Nf
	for linux-lvm@redhat.com; Tue, 28 Jun 2005 22:40:49 +0100
Date: Tue, 28 Jun 2005 22:40:49 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] pv resize from dve
Message-ID: <20050628214049.GO27078@agk.surrey.redhat.com>
References: <OF2C29465B.24F55B4D-ON8725702E.0074297E-8825702E.007667C9@us.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF2C29465B.24F55B4D-ON8725702E.0074297E-8825702E.007667C9@us.ibm.com>
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

On Tue, Jun 28, 2005 at 02:34:28PM -0700, Jim Schisler wrote:
> Is there a way to rescan the physical volume so that the new volume size 
> is seen and can be used?

pvresize is not implemented yet.

Workaround involves vgcfgbackup, edit appropriate pe_count in backup file to
new number of extents, pvcreate --restorefile on the changed PV, vgcfgrestore.

Suggest you test it first with a temp. VG.

Alasdair
-- 
agk@redhat.com

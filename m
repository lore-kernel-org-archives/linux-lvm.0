Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j0AE4q0a011848
	for <linux-lvm@redhat.com>; Mon, 10 Jan 2005 14:04:52 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Co0A8-0005nT-SN
	for linux-lvm@redhat.com; Mon, 10 Jan 2005 14:04:52 +0000
Date: Mon, 10 Jan 2005 14:04:52 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Problem Upgrading from LVM1 to LVM2
Message-ID: <20050110140452.GS26670@agk.surrey.redhat.com>
References: <20050109210423.GB24979@percy.comedia.it>
	<Pine.LNX.4.44.0501100838210.30140-100000@mars.geneseo.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0501100838210.30140-100000@mars.geneseo.edu>
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

On Mon, Jan 10, 2005 at 08:43:24AM -0500, Mark T. Valites wrote:
>   logical extent (56202) already mapped.
>   Couldn't fill logical volume maps.

Metadata corruption: eg 2 LV sharing a PE.
If you forcibly ran LVM1 and LVM2 on the same VG at the same time 
that could lead to this.

Make sure you're using a recent version of LVM2.

You'll need to restore your metadata from a backup
using vgcfgrestore - but first you need to work out which
is the correct backup to restore from, then use either lvm1
or lvm2 vgcfgrestore depending which format that
backup is in.

Alasdair
-- 
agk@redhat.com

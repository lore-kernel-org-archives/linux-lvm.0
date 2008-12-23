Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id mBN1OhZR028586
	for <linux-lvm@redhat.com>; Mon, 22 Dec 2008 20:24:44 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LEw0p-0006jM-I9
	for linux-lvm@redhat.com; Tue, 23 Dec 2008 01:24:43 +0000
Date: Tue, 23 Dec 2008 01:24:43 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM2 robustness w/ large (>100TB) name spaces?
Message-ID: <20081223012443.GB17247@agk.fab.redhat.com>
References: <alpine.LFD.2.00.0812210927010.3626@tigger.tntechs.com>
	<1229884467.5412.26.camel@localhost.localdomain>
	<5440B12A673140C89F22744165C88838@analytical>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5440B12A673140C89F22744165C88838@analytical>
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

 From the LVM2 point of view, extents (PEs/LEs) are counted using 32-bit
numbers so that's where the limit comes from.
(You can change extent size later, shuffling extent boundaries with pvmove
first as necessary.)

The stripe size is controlled by a separate parameter essentially independent
of the PE size.

When creating the PVs, use a larger-than-default size for the metadata area:
it is awkward to change later if you fill it up.

Alasdair
-- 
agk@redhat.com

Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r0ONgakH029829
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2013 18:42:37 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1TyWRI-0000wQ-0c
	for linux-lvm@redhat.com; Thu, 24 Jan 2013 23:42:36 +0000
Date: Thu, 24 Jan 2013 23:42:35 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130124234235.GB3122@agk-dp.fab.redhat.com>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <51017F0C.20100@bmsi.com>
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

So look at thin provisioning with its zeroing option.
External origin.  (support currently being added to lvm)

Or this not-yet-upstream target:
http://people.redhat.com/agk/patches/linux/editing/dm-add-zeroed-target.patch

Alasdair

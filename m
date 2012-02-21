Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1LGhLnD031506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 11:43:22 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1RzsoD-0003pn-5P
	for linux-lvm@redhat.com; Tue, 21 Feb 2012 16:43:21 +0000
Date: Tue, 21 Feb 2012 16:43:21 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120221164321.GA14666@agk-dp.fab.redhat.com>
References: <4F43588B.8040202@agenda.si>
	<20120221120933.GB12645@agk-dp.fab.redhat.com>
	<20120221103503.4ba74c70@bettercgi.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20120221103503.4ba74c70@bettercgi.com>
Subject: Re: [linux-lvm] Duplicate PV's - how does LVM choose which one
	to	use
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

On Tue, Feb 21, 2012 at 10:35:03AM -0600, Ray Morris wrote:
> Perhaps when duplicates are found the seqno should be incremented 
> so it DOES use the same one next time, and generate a warning 
> indicating which one is out of date?

Wouldn't be possible - it can't distinguish between them (or we'd not
be in this situation).

If they have the same UUID it assumes they are different paths to the same
device and picks one of them to use.

But there are other cases (like hardware snapshot, mirror that failed to
start up first) where it's better to stop and force the sysadmin to fix
things.

Alasdair

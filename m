Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1LC9Y30025775
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 07:09:35 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1RzoXF-0003kn-Qr
	for linux-lvm@redhat.com; Tue, 21 Feb 2012 12:09:34 +0000
Date: Tue, 21 Feb 2012 12:09:33 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20120221120933.GB12645@agk-dp.fab.redhat.com>
References: <4F43588B.8040202@agenda.si>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4F43588B.8040202@agenda.si>
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

On Tue, Feb 21, 2012 at 09:40:43AM +0100, Danilo Godec wrote:
> How does LVM decide which one to use?  Will it always choose the same one?

You can't rely on that.

I'm starting to wonder if we should add an lvm.conf option to stop when it sees
duplicates of equal priority instead of going ahead and using one, and to make
that the default behaviour.

Alasdair

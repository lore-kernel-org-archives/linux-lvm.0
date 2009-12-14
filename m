Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nBEEjKsv027547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 14 Dec 2009 09:45:21 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1NKCAp-00043x-W0
	for linux-lvm@redhat.com; Mon, 14 Dec 2009 14:45:20 +0000
Date: Mon, 14 Dec 2009 14:45:19 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate does not respect units?
Message-ID: <20091214144519.GC14009@agk-dp.fab.redhat.com>
References: <alpine.LNX.2.00.0912141234240.14618@er-systems.de>
	<20091214140057.GA14009@agk-dp.fab.redhat.com>
	<alpine.LNX.2.00.0912141527510.25221@er-systems.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alpine.LNX.2.00.0912141527510.25221@er-systems.de>
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

On Mon, Dec 14, 2009 at 03:28:24PM +0100, Thomas Voegtle wrote:
> Why is it possible to use vgdisplay with units power of 1000, if you
> cant use lvcreate with that kind of units?
> The lvcreate man page says:
>      -L, --size LogicalVolumeSize[bBsSkKmMgGtTpPeE]

For input, it ignores case.

I've not felt particularly happy about changing that as it could change the
behaviour of existing scripts, and typically, people pay little attention
to the case of units when they are typing.

But should we change this in time for RHEL6?

Any more opinions?

Alasdair

Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAIKCNOl029000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:12:24 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1PJAqE-00037I-N7
	for linux-lvm@redhat.com; Thu, 18 Nov 2010 20:12:22 +0000
Date: Thu, 18 Nov 2010 20:12:22 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20101118201222.GD30435@agk-dp.fab.redhat.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with
	a	particular use-case for pvmove.
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

On Thu, Nov 18, 2010 at 01:30:11PM -0500, Stirling Westrup wrote:
> I do think the fact that pvmove does no user-visible checkpointing is
> a bug.

The man page explains how pvmove works.  No data is removed until it
is safely available in its new location.

Checkpoints are done after each contiguous piece of data to move.
So if your data is contiguous, you'll get no checkpoints.
The code was designed to handle more-frequent checkpoints in such
cases, but nobody's seen the need to implement that feature yet.
(I don't think we even have a bugzilla requesting it.)

Alasdair

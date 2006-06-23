Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5NFVMIU013063
	for <linux-lvm@redhat.com>; Fri, 23 Jun 2006 16:31:22 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Ftncw-00075Y-Cg
	for linux-lvm@redhat.com; Fri, 23 Jun 2006 16:31:22 +0100
Date: Fri, 23 Jun 2006 16:31:22 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvcreate and lvremove issues
Message-ID: <20060623153122.GY19222@agk.surrey.redhat.com>
References: <2908808b0606230813q748e8932n2f124916a7aa1b9b@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2908808b0606230813q748e8932n2f124916a7aa1b9b@mail.gmail.com>
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

On Fri, Jun 23, 2006 at 05:13:34PM +0200, Romain Cherchi wrote:
>  _deps: task run failed for (253:9)

> I someone familiar with this problem?
 
Looks like you've updated something and hit an incompatible package
combination?

Make sure your userspace device-mapper package is at least
version 1.02.04 (with corresponding lvm2 update), or alternatively
update your kernel to something more recent - 2.6.12 or later IIRC.

Alasdair
-- 
agk@redhat.com

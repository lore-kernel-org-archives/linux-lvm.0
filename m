Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j2GNA0UX022674
	for <linux-lvm@redhat.com>; Wed, 16 Mar 2005 23:10:00 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DBheK-0004Pf-Ak
	for linux-lvm@redhat.com; Wed, 16 Mar 2005 23:10:00 +0000
Date: Wed, 16 Mar 2005 23:10:00 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] snapshot reset
Message-ID: <20050316231000.GC19749@agk.surrey.redhat.com>
References: <20050316230040.GA6604@wavehammer.waldi.eu.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050316230040.GA6604@wavehammer.waldi.eu.org>
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

On Thu, Mar 17, 2005 at 12:00:40AM +0100, Bastian Blank wrote:
> Is it possible to reset a snapshot without a delete, create cycle?

Not sure if I'm answering the right question, but with
LVM2/device-mapper:

You have to suspend & resume it in the kernel [with existing device-mapper
implementation; this may change].

With LVM2, between those commands, you can just zero out the
start of the cow device (say first 64k).  And then it'll treat
it as if it were a new snapshot (based on current state of filesystem.)
 
Alasdair
-- 
agk@redhat.com

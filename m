Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8AFf8Qg025142
	for <linux-lvm@redhat.com>; Sun, 10 Sep 2006 16:41:08 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GMRQi-0002GY-24
	for linux-lvm@redhat.com; Sun, 10 Sep 2006 16:41:08 +0100
Date: Sun, 10 Sep 2006 16:41:08 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] Cannot get rid of root filesystem LVM snapshot
Message-ID: <20060910154107.GC13859@agk.surrey.redhat.com>
References: <b91808310609091349tf363c5dy57ced3b611523c18@mail.gmail.com>
	<20060909231739.GB13859@agk.surrey.redhat.com>
	<b91808310609091653o63dbdb0fi9f34848cb4479a1d@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b91808310609091653o63dbdb0fi9f34848cb4479a1d@mail.gmail.com>
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, Sep 10, 2006 at 01:53:34AM +0200, Martin Dvořák wrote:
> Thanks for info. I suggest to stress the fact that snapshotting of
> root filesystem is not yet supported somewhere in documentation,
> HOWTOs etc. Many people might not be as lucky as me and find it out
> only after they are left with frozen or even corrupted system.
 
Upstream does not support using lvm2 for the root filesystem because, as you
discovered, the tools do not have complete support for it yet.

However people tried it and found it worked for them and so distributions
started shipping this as an option despite incomplete support for the
configuration in the upstream tools.  And so far nobody's considered it a
high enough priority to get that support completed:-(

Alasdair
-- 
agk@redhat.com

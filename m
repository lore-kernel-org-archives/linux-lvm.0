Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7FDb0Lx019532
	for <linux-lvm@redhat.com>; Tue, 15 Aug 2006 14:37:00 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1GCz6K-0003eC-JG
	for linux-lvm@redhat.com; Tue, 15 Aug 2006 14:37:00 +0100
Date: Tue, 15 Aug 2006 14:37:00 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM on disk structures
Message-ID: <20060815133700.GY18633@agk.surrey.redhat.com>
References: <652016d30608140351y2b75332ah213fd01c2b919125@mail.gmail.com>
	<20060814214249.GA11767@cobalt0.panici.net>
	<20060814221034.GV18633@agk.surrey.redhat.com>
	<652016d30608142035k2e840db6oe5137a51c716fdb8@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <652016d30608142035k2e840db6oe5137a51c716fdb8@mail.gmail.com>
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

On Tue, Aug 15, 2006 at 09:20:27AM +0545, Manish Regmi wrote:
> Actually i am writing
> a userland app to ro access to lvm from other os (esp. open solaris
> and windows).

To minimise maintenance problems then and maximise compatibility, as
far as possible, you should try to use the exact same code (and use
wrappers around it if, for example, you want a Windows GUI).

You might have spotted that the userspace code already runs on darwin.
I'm happy to take patches for other platforms too.

Alasdair
-- 
agk@redhat.com

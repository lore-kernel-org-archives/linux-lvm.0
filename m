Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAN6TBV08934
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 01:29:11 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.194])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAN6TBhl021860
	for <linux-lvm@redhat.com>; Wed, 23 Nov 2005 01:29:11 -0500
Received: by xproxy.gmail.com with SMTP id r21so2315006wxc
	for <linux-lvm@redhat.com>; Tue, 22 Nov 2005 22:29:10 -0800 (PST)
Message-ID: <64c763540511222229i6cf15cf0xbed9c9396af5689c@mail.gmail.com>
Date: Wed, 23 Nov 2005 11:59:10 +0530
From: Block Device <blockdevice@gmail.com>
Subject: Re: [linux-lvm] Standard Linux Framework for Snapshot Notification
In-Reply-To: <20051118215648.GW26394@agk.surrey.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <64c763540511140550t4de2bbc8scdc58e4d38717a15@mail.gmail.com>
	<20051118215648.GW26394@agk.surrey.redhat.com>
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

 Hi Alasdair,

> There already exists an in-kernel filesystem hook so that mounted filesystems
> get the notifications automatically so they can sync their metadata, and
> the block devices get flushed.

What hook is that ? Could you please elaborate and explain how it works :) ?

Thanks
BD :)

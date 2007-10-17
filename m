Received: from jeltz.pjc.net (vpn-6-1.fab.redhat.com [10.33.6.1])
	by pobox.fab.redhat.com (8.13.1/8.13.1) with ESMTP id l9H8JYx9027679
	for <linux-lvm@redhat.com>; Wed, 17 Oct 2007 04:19:34 -0400
Message-ID: <4715C594.4010406@redhat.com>
Date: Wed, 17 Oct 2007 09:19:32 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] cluster LVM
References: <4714C8C6.7060204@cesca.es>
In-Reply-To: <4714C8C6.7060204@cesca.es>
Content-Transfer-Encoding: 7bit
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

Jordi Prats wrote:
> Hi all,
> I've been googling for a while but I found nothing about the current
> limitations of CLVM. Someone told me that you must use just one logical
> volume for each volume group. Is that true?

No, you can have as many LVs in a VG as you like.

> Anyone could tell me witch are and if exists any risks of loosing data
> by using CLVM given certain configuration? There's anything that it's
> not safe to use, like snapshots, pvmove...?

Snapshots & pvmove are not currently cluster aware. so if you need to snapshot
or move a logical volume it needs to be active on only one node.

If you are sharing data using a filesystem, then you must use a cluster-aware
filesystem if it is to be mounted on more than one node at a time. GFS or ocfs2
are just such filesystems.


-- 
Patrick

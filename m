Received: from [10.34.131.16] (dhcp131-16.brq.redhat.com [10.34.131.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t0E8YKOo030567
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2015 03:34:21 -0500
Message-ID: <54B62A0C.9080800@redhat.com>
Date: Wed, 14 Jan 2015 09:34:20 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <54B619AE.6020704@shockmedia.nl>
In-Reply-To: <54B619AE.6020704@shockmedia.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] determining snapshot overhead
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 14.1.2015 v 08:24 Bram Klein Gunnewiek napsal(a):
> Hello,
>
> I am trying to create snapshots of thick volumes that can't break because they
> overflow (thin volumes are not an option right now). I can't find information
> on how to calculate (in advance) the metadata overhead of a snapshot when all
> blocks in the origin volume are changed (e.g. the snapshot is 100% full). Is
> there a way to do this?


Recent versions of lvm2  (let's say >= 111) are able to determine this size 
automatically - just use: 'lvcreate -s -l100%ORIGIN vg/origin'

Regards

Zdenek

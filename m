Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBLHBZr06653
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 12:11:35 -0500
Received: from smtpout03-04.mesa1.secureserver.net
	(smtpout03-04.mesa1.secureserver.net [64.202.165.74])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id iBLHBTrN013539
	for <linux-lvm@redhat.com>; Tue, 21 Dec 2004 12:11:29 -0500
Message-ID: <41C85936.9030802@starnetworks.us>
Date: Tue, 21 Dec 2004 10:11:18 -0700
From: "Kevin P. Fleming" <kpfleming@starnetworks.us>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm/fs issue
References: <0B834CEE3453504B82AB821DFB7047C1FF01B6@enyc11p32003.corpny.csfb.com>
In-Reply-To: <0B834CEE3453504B82AB821DFB7047C1FF01B6@enyc11p32003.corpny.csfb.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Rosenstrauch, David wrote:

> Although I currently have only 1 logical volume, and all my PV's are currently
> a part of it, that's not necessarily how things will always be.  I
> intentionally partitioned most of my disk into ~2GB chunks like this, so that
> I can have a pool of 2GB PV's which I can throw at whichever LV needs it, and
> thereby rid myself of future space constraint issues I've run into in the past
> with traditional partitioning.

But that's the whole point of LVM in the first place!

If you make a single PV, with a VG including it, you can carve it up and 
re-carve it up however you like, for whatever LVs you have or create in 
the future. You can even _shrink_ LVs and make the space available to 
other LVs, which you cannot do with partitions.

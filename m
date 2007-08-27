Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7R8rgsS029148
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 04:53:42 -0400
Received: from mailout3.imos.net (mailout3.imos.net [212.87.132.34])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l7R8rSUK004454
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 04:53:29 -0400
Received: from homer.imos.net (homer.imos.net [212.87.132.35])
	by mailout3.imos.net (8.14.1/8.14.1) with ESMTP id l7R8rRPj009985
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 10:53:27 +0200
Received: from lstyd.imos.net (lstyd.imos.net [212.87.130.122])
	by homer.imos.net (8.14.1/8.14.1) with ESMTP id l7R8rQaM019274
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 10:53:26 +0200
Received: from [5.15.153.128] ([5.15.153.128])
	by lstyd.imos.net (8.14.0/8.13.7) with ESMTP id l7RBZ7l3012340
	for <linux-lvm@redhat.com>; Mon, 27 Aug 2007 13:35:07 +0200
Message-ID: <46D2910D.7050908@theendofthetunnel.de>
Date: Mon, 27 Aug 2007 10:53:33 +0200
From: Hannes Dorbath <light@theendofthetunnel.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot COW area on different PV / device
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
To: linux-lvm@redhat.com

Hello,

I suffer from massive I/O trashing, due to the snapshot COW area being 
located on the same physical device as the origin. The machine now has a 
second disk array, that I'd like to dedicate to snapshot COW data. My 
problem now is that I fail to see from the documentation how to create a 
snapshot, which has its COW area located on another device. The setup 
currently looks like:

VG     #PV #LV #SN Attr   VSize   VFree
data     1   1   0 wz--c- 437.62G      0
cow1     1   0   0 wz--c- 232.82G 232.82G
cow2     1   0   0 wz--c- 232.82G 232.82G

LV     VG     Attr   LSize   Origin Snap%  Move Log Copy%
data   data   -wc-ao 437.62G

data is the LV where production data is located, and the cow1 and cow2 
VGs should be used for snapshots. Can someone give me an example on the 
lvcreate syntax to archive this? I tried various things, but end up with 
error messages like "Could not fine LV <foo> in PV <bar>".

Thanks in advance.


-- 
Regards,
Hannes Dorbath

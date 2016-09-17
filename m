Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8HDxhjr004142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 09:59:43 -0400
Received: from zimbra13.linbit.com (zimbra13.linbit.com [212.69.166.240])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 35C8413A60
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 13:59:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id 923812EE27C
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 15:49:37 +0200 (CEST)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id GhQjwEJk3wYa for <linux-lvm@redhat.com>;
	Sat, 17 Sep 2016 15:49:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra13.linbit.com (Postfix) with ESMTP id 707CB2EE27B
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 15:49:37 +0200 (CEST)
Received: from zimbra13.linbit.com ([127.0.0.1])
	by localhost (zimbra13.linbit.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1dIWJSItLoAy for <linux-lvm@redhat.com>;
	Sat, 17 Sep 2016 15:49:37 +0200 (CEST)
Received: from soda.linbit (tuerlsteher.linbit.com [86.59.100.100])
	by zimbra13.linbit.com (Postfix) with ESMTPS id 48D9F2EE1A0
	for <linux-lvm@redhat.com>; Sat, 17 Sep 2016 15:49:37 +0200 (CEST)
Date: Sat, 17 Sep 2016 15:49:36 +0200
From: Lars Ellenberg <lars.ellenberg@linbit.com>
Message-ID: <20160917134936.GF3302@soda.linbit>
References: <7e54ddf6638609d4e521287b51964ebd@dds.nl>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e54ddf6638609d4e521287b51964ebd@dds.nl>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] creating DD copies of disks
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On Sat, Sep 17, 2016 at 09:29:16AM +0200, Xen wrote:
> I want to ask again:
> 
> What is the proper procedure when duplicating a disk with DD?

depends on what you define as "proper",
what the desired outcome is supposed to look like.

What exactly are you trying to do?

If you intend to "clone" PVs of some LVM2 VG,
and want to be able to activate that on the same system
without first deactivating the "original",
I suggest:

1) create consistent snapshot(s) or clone(s) of all PVs
2) import them with "vgimportclone",
which is a shell script usually in /sbin/vgimportclone,
that will do all the neccessary magic for you,
creating new "uuid"s and renaming the vg(s).

> - my experience indicates that pvchange -ay on a PV that contains a
> duplicate VG, even if it has a different UUID, but with an identical name,
> creates problems.

You don't say...

-- 
: Lars Ellenberg
: LINBIT | Keeping the Digital World Running
: DRBD -- Heartbeat -- Corosync -- Pacemaker
: R&D, Integration, Ops, Consulting, Support

DRBD� and LINBIT� are registered trademarks of LINBIT

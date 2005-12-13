Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBDBJr124682
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 06:19:53 -0500
Received: from pat.uio.no (IDENT:7411@pat.uio.no [129.240.130.16])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBDBJnDH024665
	for <linux-lvm@redhat.com>; Tue, 13 Dec 2005 06:19:50 -0500
Received: from mail-mx5.uio.no ([129.240.10.46])
	by pat.uio.no with esmtp (Exim 4.43) id 1Em8CA-0005jO-EA
	for linux-lvm@redhat.com; Tue, 13 Dec 2005 12:19:46 +0100
Received: from surveyor.uio.no ([129.240.197.20])
	by mail-mx5.uio.no with esmtp (Exim 4.43) id 1Em8C3-0006nu-OD
	for linux-lvm@redhat.com; Tue, 13 Dec 2005 12:19:39 +0100
Received: from trondham by surveyor.uio.no with local (Exim 4.44)
	id 1Em8C3-0002wg-IR
	for linux-lvm@redhat.com; Tue, 13 Dec 2005 12:19:39 +0100
From: Trond Hasle Amundsen <t.h.amundsen@usit.uio.no>
Date: Tue, 13 Dec 2005 12:19:39 +0100
Message-ID: <15tbqzlmegk.fsf@surveyor.uio.no>
MIME-Version: 1.0
Sender: Trond Hasle Amundsen <t.h.amundsen@usit.uio.no>
Subject: [linux-lvm] Meta-flag: don't activate on boot
Reply-To: linux-lvm@redhat.com
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
To: linux-lvm@redhat.com


Hi,

It would be neat if there was a way to flag that a particular volume
group should not be activated by default, typically at boot time,
i.e. running 'vgchange -ay' shouldn't activate it. This is especially
useful in clustering environments, when you want to "share" a volume
group across several nodes for redundancy, but only activate it on one
node at a time.

As of now, I patch rc.sysinit for this. Of course one could make a
config file of sorts that rc.sysinit would use to determine whether a
VG should be activated or not. But IMHO this should rather be a LVM
feature, implemented as a flag in the metadata of a volume group.

So my question is: Is this sort of thing planned in the forseeable
future? If not, please consider this a feature request :)

Cheers,

-- 
Trond Hasle Amundsen <t.h.amundsen@usit.uio.no>
Center for Information Technology Services, University of Oslo

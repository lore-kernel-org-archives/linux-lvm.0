Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9B3E389337
	for <linux-lvm@redhat.com>; Thu,  6 Apr 2017 14:31:40 +0000 (UTC)
Received: from mr002msb.fastweb.it (mr002msb.fastweb.it [85.18.95.86])
	by mx1.redhat.com (Postfix) with ESMTP id 606803E249
	for <linux-lvm@redhat.com>; Thu,  6 Apr 2017 14:31:37 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr002msb.fastweb.it
	(8.5.140.05) id 58E21DDC0027EE8D for linux-lvm@redhat.com;
	Thu, 6 Apr 2017 16:31:36 +0200
Received: from gdanti-laptop.assyoma.it (unknown [172.31.255.5])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by ceres.assyoma.it (Postfix) with ESMTPSA id 06A2828493A
	for <linux-lvm@redhat.com>; Thu,  6 Apr 2017 16:31:35 +0200 (CEST)
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <1438f48b-0a6d-4fb7-92dc-3688251e0a00@assyoma.it>
Date: Thu, 6 Apr 2017 16:31:31 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot behavior on classic LVM vs ThinLVM
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

Hi all,
I'm seeking some advice for a new virtualization system (KVM) on top of 
LVM. The goal is to take agentless backups via LVM snapshots.

In short: what you suggest to snapshot a quite big (8+ TB) volume? 
Classic LVM (with old snapshot behavior) or thinlvm (and its new 
snapshot method)?

Long story:
In the past, I used classical, preallocated logical volumes directly 
exported as virtual disks. In this case, I snapshot the single LV I want 
to backup and, using dd/ddrescue, I copy it.

Problem is this solution prevents any use of thin allocation or sparse 
files, so I tried to replace it with something filesystem-based. Lately 
I used another approach, configuring a single thinly provisioned LV 
(with no zeroing) + XFS + raw or qcow2 virtual machine images. To make 
backups, I snapshotted the entire thin LV and, after mounting it, I 
copied the required files.

So far this second solution worked quite well. However, before using it 
in more and more installations, I wonder if it is the correct approach 
or if something better, especially from a stability standpoint, is possible.

Gived that I would like to use XFS, and that I need snapshots at the 
block level, two possibilities came to mind:

1) continue to use thinlvm + thin snapshots + XFS. What do you think 
about a 8+ TB thin pool/volume with relatively small (64/128KB) chunks? 
Would you be comfortable using it in production workloads? What about 
powerloss protection? From my understanding, thinlvm passes flushes 
anytime the higher layers issue them and so should be reasonable safe 
against unexpected powerloss. Is this view right?

2) use a classic (non-thin) LVM + normal snapshot + XFS. I know for sure 
that LV size is not an issue here, however big snapshot size used to be 
problematic: the CoW table had to be read completely before the snapshot 
can be activated. Is this problem a solved one? Or big snapshot can be 
problematic?

Thank you all.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

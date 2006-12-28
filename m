Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBSBjlbk008695
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 06:45:48 -0500
Received: from server2.dragonhold.org (server2.dragonhold.org [217.147.93.117])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBSBjkbY025271
	for <linux-lvm@redhat.com>; Thu, 28 Dec 2006 06:45:47 -0500
Received: from zair.dragonhold.org ([217.147.93.119])
	by server2.dragonhold.org with esmtp (Exim 4.63)
	(envelope-from <gwood@dragonhold.org>) id 1Gzthe-0007Cb-Eq
	for linux-lvm@redhat.com; Thu, 28 Dec 2006 11:45:45 +0000
Received: from www-data by zair.dragonhold.org with local (Exim 4.63)
	(envelope-from <gwood@dragonhold.org>) id 1GzteK-0006uD-U1
	for linux-lvm@redhat.com; Thu, 28 Dec 2006 11:42:17 +0000
Message-ID: <20061228114216.tod6958hesg480sk@www.dragonhold.org>
Date: Thu, 28 Dec 2006 11:42:16 +0000
From: Graham Wood <gwood@dragonhold.org>
Subject: RE: [linux-lvm] Mirror between different SAN fabrics
References: <OFD4DD5BF7.92876779-ONC1257252.003E8F27-C1257252.003F3EA3@schering.de>
In-Reply-To: <OFD4DD5BF7.92876779-ONC1257252.003E8F27-C1257252.003F3EA3@schering.de>
MIME-Version: 1.0
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: "LVM.general.discussion.and.development." <linux-lvm@redhat.com>


> ahhh, I see where the difference in view comes from: MC-Service Guard is a
> HA clustering suite that does not contain a cluster FS; it simply does
> package switching upon failover between two or more nodes.
Yeah - if you're looking to create as part of a startup script for the  
"package", and remove it when you stop it being live, that should  
indeed work.

At that stage the md stuff is only ever accessed on a single node, and  
there's no problem.

MC-Serviceguard (last time I used it anyway) is very clean & simple -  
but doesn't provide the same functionality :)

Graham

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBF6X2r15884
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 01:33:03 -0500
Received: from mail.stabat.com (dsl-210-15-214-74.VIC.netspace.net.au
	[210.15.214.74])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBF6Ws1P022081
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 01:32:55 -0500
Received: from amavis by mail.stabat.com with scanned-ok (Exim 3.35 #1
	(Debian)) id 1CeSiF-00073O-00
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 17:32:39 +1100
Received: from juno ([10.0.0.79])
	by mail.stabat.com with esmtp (Exim 3.35 #1 (Debian))
	id 1CeSiF-00073F-00
	for <linux-lvm@redhat.com>; Wed, 15 Dec 2004 17:32:39 +1100
Message-ID: <41BFDA88.7050405@stabat.com>
Date: Wed, 15 Dec 2004 17:32:40 +1100
From: Lucas Barbuto <lucas@stabat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Strange LVM2 on RAID Behaviour
References: <41BE5C6B.80404@stabat.com>
In-Reply-To: <41BE5C6B.80404@stabat.com>
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

Hi,

Just as an addendum, I've tried getting rid of vg1 and adding md3 to
vg0, this worked, but md3 still comes up from boot degraded.  I'm
stumped.  Anyone?

Regards,

-- 
Lucas

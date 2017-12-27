Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ABC79614D0
	for <linux-lvm@redhat.com>; Wed, 27 Dec 2017 18:49:59 +0000 (UTC)
Received: from mr012msb.fastweb.it (mr012msb.fastweb.it [85.18.95.109])
	by mx1.redhat.com (Postfix) with ESMTP id 3F4168763C
	for <linux-lvm@redhat.com>; Wed, 27 Dec 2017 18:49:58 +0000 (UTC)
Received: from ceres.assyoma.it (93.63.55.57) by mr012msb.fastweb.it (5.8.043)
	id 5A4150100026D625 for linux-lvm@redhat.com;
	Wed, 27 Dec 2017 19:44:34 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Dec 2017 19:44:33 +0100
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <cc1e4d47824ca32d2e055fcb05473242@assyoma.it>
Subject: [linux-lvm] =?utf-8?q?fallocate_for_thin_volumes=3F?=
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
there is any method to preallocate any space to a specific thin volume, 
other that writing to it? If not, it is in the todo list?

I know a similar question was raised in the past, but it was in the 
different context of reserverd space - ie to be "sure" about a volume 
not filling up. I understand this can not be done in the current device 
mapper context.

This time I wonder about fallocate as a performance optimization, 
heading to reduced thin-volume fragmentation. For example, a thin 
volume-backed virtual machine image can be entirely allocated with 
mostly contiguous data chunks. Any snapshot will obviously allocates 
random data chunks, but with careful scheduling its effect on data 
fragmentation should be limited/contained.

Today, to accomplish that, I need to write out *all* data chunks from 
the virtual machine itself. This is a time-consuming and error prone 
process. A simpler "volume-preallocation" and/or an "fallocate-passing" 
facility would facilitate this process.

And yes - I know POSIX-fallocate is all about *assuring* than 
application will not face an ENOSP condition, rather than a fast-zeroing 
surrogate. However, in the framework of thin volume this is basically 
impossible to guarantee. On the other hand, its performance enhancing 
implications are significan enough they should not be overlooked.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8

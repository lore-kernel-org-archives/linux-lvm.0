Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q796pSq2020549
	for <linux-lvm@redhat.com>; Thu, 9 Aug 2012 02:51:28 -0400
Received: from emh02.mail.saunalahti.fi (emh02.mail.saunalahti.fi
	[62.142.5.108])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q796pPW1001902
	for <linux-lvm@redhat.com>; Thu, 9 Aug 2012 02:51:26 -0400
Received: from saunalahti-vams (vs3-12.mail.saunalahti.fi [62.142.5.96])
	by emh02.mail.saunalahti.fi (Postfix) with SMTP id 0D5F481864
	for <linux-lvm@redhat.com>; Thu,  9 Aug 2012 09:51:24 +0300 (EEST)
Received: from mustikkakukko.koti7c1c (a91-153-217-86.elisa-laajakaista.fi
	[91.153.217.86])
	by emh04.mail.saunalahti.fi (Postfix) with ESMTP id EABA71A26E5
	for <linux-lvm@redhat.com>; Thu,  9 Aug 2012 09:51:23 +0300 (EEST)
Message-ID: <50235DEB.9070902@cs.tut.fi>
Date: Thu, 09 Aug 2012 09:51:23 +0300
From: Matti Rintala <bitti@cs.tut.fi>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Merged snapshot still present and throwing I/O errors
 after reboot (similar to bug #645488)
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

I created a snapshot of my root LVM partition and later merged the snapshot
back. Merge was performed normally on next boot (with percentages counting
down to 0). However, the snapshot volume was still present after merge and
could not be removed.

My symptoms were identical to the ones described in bug report #645488
(https://bugzilla.redhat.com/show_bug.cgi?id=645488), and the solution
mentioned in comment #6 worked for me too, allowing me to remove the ghost
snapshot.

However, I got the impression that this bug has already been fixed on
lvm2-2.02.82. Mine is lvm2-2.02.84-19.3.1 (on openSUSE 12.1 x86_64), and the
bug still manifests itself. Is this a known thing or should the bug be reopened?

-- 
------------- Matti Rintala ------------ bitti@cs.tut.fi ------------
Painting is the art of inclusion. Photography is an art of exclusion.

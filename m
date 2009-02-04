Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n14IhFTS009282
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 13:43:15 -0500
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.224])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n14Ih0tu010285
	for <linux-lvm@redhat.com>; Wed, 4 Feb 2009 13:43:00 -0500
Received: by rv-out-0506.google.com with SMTP id f6so3055700rvb.51
	for <linux-lvm@redhat.com>; Wed, 04 Feb 2009 10:42:59 -0800 (PST)
MIME-Version: 1.0
Date: Thu, 5 Feb 2009 00:12:59 +0530
Message-ID: <a80c86b70902041042l3e9f3cecn1ade9ca25792039d@mail.gmail.com>
From: Prateek Donni <prateek.donni@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM mirroring..
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

I have been trying to make use of LVM mirroring to create a data
protection application , i tried configuring it on two disks but it
does not work w/o using --corelog. And secondly i cannot see the
volume which is the mirror using lvscan , but can only be seen in the
GUI.

Kindly help me with this..

Thanks,
 Prateek

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7940pOZ032663
	for <linux-lvm@redhat.com>; Wed, 9 Aug 2006 00:00:51 -0400
Received: from nf-out-0910.google.com (nf-out-0910.google.com [64.233.182.188])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k7940ieV013900
	for <linux-lvm@redhat.com>; Wed, 9 Aug 2006 00:00:45 -0400
Received: by nf-out-0910.google.com with SMTP id o63so11643nfa
	for <linux-lvm@redhat.com>; Tue, 08 Aug 2006 21:00:42 -0700 (PDT)
Message-ID: <5bdb1aa70608082054o5baaabe6i6ffef4d4c6d23e40@mail.gmail.com>
Date: Wed, 9 Aug 2006 15:54:01 +1200
From: Simon <greminn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Moving a lv between hosts
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

Hi There,

Is there an easy way/process to move a logical volume between hosts?
(Apart from coping the data within the mounted volume).

In reading thru.. vgexport and vgimport are for the volume group
itself. But i would like a away to just move a lv within vg.

Thanks

Simon

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0LH7CPf024038
	for <linux-lvm@redhat.com>; Wed, 21 Jan 2009 12:07:12 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.170])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0LH6v1H025061
	for <linux-lvm@redhat.com>; Wed, 21 Jan 2009 12:06:57 -0500
Received: by wf-out-1314.google.com with SMTP id 25so4012975wfc.6
	for <linux-lvm@redhat.com>; Wed, 21 Jan 2009 09:06:56 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 21 Jan 2009 22:36:56 +0530
Message-ID: <ffa0f8300901210906j3c6b4509mc1e3df0d02a166ec@mail.gmail.com>
From: Tejas Sumant <tejas.sumant@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM1 LE->PE mapping
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
To: linux-lvm@redhat.com

How is LE->PE mapping done in case of striped volume created using
LVM1? Especially I could not location sequence of PV stripes to be
followed. e.g. PV2, PV0, PV1 is sequence shown by "dmsetup table" but
not sure where does this information gets stored on PV?
I did not see the LVM1 on-disk structure storing information related to segment.
Can anybody kindly help?

-- 
Tejas Sumant

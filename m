Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2N8P2bm012002
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2007 04:25:02 -0400
Received: from nz-out-0506.google.com (nz-out-0506.google.com [64.233.162.235])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2N8P0c8025288
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2007 04:25:00 -0400
Received: by nz-out-0506.google.com with SMTP id s18so773766nze
	for <linux-lvm@redhat.com>; Fri, 23 Mar 2007 01:25:00 -0700 (PDT)
Message-ID: <da32294e0703230125v7ec5b473yfe0ec00d2d938cc6@mail.gmail.com>
Date: Fri, 23 Mar 2007 16:25:00 +0800
From: francism <francism501@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Original Volume and snapshots volume -use case
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

HI All,

could this be a valid use case of snapshot.
We take snapshot while the original volume is under heavy i/o.
while taking several snapshot we had put entry on fstab to be mounted
when boot up.

we had simulate power failure(switch off directly) then power on
again,when trying
to mount the snapshot volume and original all have lost its label.
Volumes cannot be
found. could it be the metadata problem?


thanks,
francism

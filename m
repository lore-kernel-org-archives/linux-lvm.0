Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n05AMGf2005655
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 05:22:16 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.170])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n05AM3al021764
	for <linux-lvm@redhat.com>; Mon, 5 Jan 2009 05:22:03 -0500
Received: by wf-out-1314.google.com with SMTP id 25so7344802wfc.6
	for <linux-lvm@redhat.com>; Mon, 05 Jan 2009 02:22:02 -0800 (PST)
Message-ID: <ffa0f8300901050222y2083fbb1pbbc4bdb5c10aeb5a@mail.gmail.com>
Date: Mon, 5 Jan 2009 15:52:02 +0530
From: "Tejas Sumant" <tejas.sumant@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] LVM2 on-disk layout
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

I have few questions on lvm2 layout.

1) Why array of MDA (metadata area) is required? Isnt single MDA sufficient?
2) Which MDA is current?
3) Why the metadata inside MDA wraps around, instead of the offset
pointing to the start of metadata?

Can somebody kindly answers this?
-- 
Tejas Sumant

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n29AEtdx027842
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2009 06:14:55 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n29AEcX6030737
	for <linux-lvm@redhat.com>; Mon, 9 Mar 2009 06:14:38 -0400
Received: by rv-out-0506.google.com with SMTP id f6so1792702rvb.51
	for <linux-lvm@redhat.com>; Mon, 09 Mar 2009 03:14:37 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 9 Mar 2009 15:44:37 +0530
Message-ID: <ffa0f8300903090314i2d4e827mc79ff89438c53ce6@mail.gmail.com>
From: Tejas Sumant <tejas.sumant@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] label_read()
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

When I checked label_read() code found that the function finds LVM
label id "LABELONE" in first four sectors starting from scan_sector.
Why 4 sectors in particular are checked, why not more than 4 or less
than 4?

Thanks.
-- 
Tejas Sumant

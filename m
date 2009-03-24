Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2OExJkw013938
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 10:59:19 -0400
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.28])
	by mx2.redhat.com (8.13.8/8.13.8) with ESMTP id n2OExAeV021946
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 10:59:10 -0400
Received: by yx-out-2324.google.com with SMTP id 8so1548259yxm.81
	for <linux-lvm@redhat.com>; Tue, 24 Mar 2009 07:59:10 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 24 Mar 2009 07:59:09 -0700
Message-ID: <c268e4660903240759t35826b60n641296dba8fdd764@mail.gmail.com>
From: Drew <drew.kay@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Shrinking a LVM physical volume
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

Hi there,

I have a system that I dual boot Windows and Debian from. Due to a
minor mistake on my part when carving out the space on my drive for my
linux partition, I now find myself with insufficient space on my
windows partition.

How do you shrink a physical volume on lvm? And then once that's done,
how safe is it to move the lvm partition around on the drive?

-- 
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie

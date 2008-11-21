Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mALB9V9Q011663
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 06:09:31 -0500
Received: from fk-out-0910.google.com (fk-out-0910.google.com [209.85.128.190])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mALB9Kq4012552
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 06:09:20 -0500
Received: by fk-out-0910.google.com with SMTP id e30so987983fke.3
	for <linux-lvm@redhat.com>; Fri, 21 Nov 2008 03:09:20 -0800 (PST)
Message-ID: <38bdcd1f0811210309k67f7ed36uc45fe0848374739@mail.gmail.com>
Date: Fri, 21 Nov 2008 20:09:19 +0900
From: "Masanari Iida" <standby24x7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] Share Volume Group between x86-64 and x86.
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

Hello list,

I have a question about LVM2 compatibility between different CPU architectures.

If one create a VG on x86(32bit) and export the VG,
then try to import the VG on x86(64bit), what is going to happen?
Both systems are RHEL5, in my mind.

I would like to know this is
  - technically can or can not
  - supported or not supported.

Thanks in advance !

Masanari

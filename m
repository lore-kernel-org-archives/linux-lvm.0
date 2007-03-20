Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2K8To9R006699
	for <linux-lvm@redhat.com>; Tue, 20 Mar 2007 04:29:50 -0400
Received: from an-out-0708.google.com (an-out-0708.google.com [209.85.132.240])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2K8TnjB022440
	for <linux-lvm@redhat.com.>; Tue, 20 Mar 2007 04:29:50 -0400
Received: by an-out-0708.google.com with SMTP id d30so1561645and
	for <linux-lvm@redhat.com.>; Tue, 20 Mar 2007 01:29:49 -0700 (PDT)
Message-ID: <da32294e0703200129i2f26bd98w800a034f87f15a36@mail.gmail.com>
Date: Tue, 20 Mar 2007 16:29:49 +0800
From: francism <francism501@gmail.com>
In-Reply-To: <da32294e0703200017u4b443169g6402a29a3979cf54@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <da32294e0703200017u4b443169g6402a29a3979cf54@mail.gmail.com>
Subject: [linux-lvm] device(disk) sleep on lvcreate
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

Hi All,

Im new to this mail list, does anyone experience an lvcreate lockup
with -s(snapshot).I had check the process and it seems the disk goes
to sleep, and cause
lvcreate to lockup.

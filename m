Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i94IpIr11777
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2004 14:51:18 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.196])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i94IpCjP029621
	for <linux-lvm@redhat.com>; Mon, 4 Oct 2004 14:51:13 -0400
Received: by mproxy.gmail.com with SMTP id v18so3688759rnb
	for <linux-lvm@redhat.com>; Mon, 04 Oct 2004 11:51:12 -0700 (PDT)
Message-ID: <f371d6ba04100411517a3e9f65@mail.gmail.com>
Date: Mon, 4 Oct 2004 11:51:12 -0700
From: L Dong <leona.dong@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] snapshot performance
Reply-To: L Dong <leona.dong@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi,

I'm using LVM1 on 2.4.18 without any problem. However, after I take a
snapshot of a volume, the write performance to the original volume is
degraded by about 5 times. Why such a big degrade?

Moreover, I expect only the first time write should involve copying
the original data block. So the later write operations into the
original volume should not have performance degradation. However, this
is not true. The latter writes are also very slow.

Should I upgrade to DM and LVM2? Will this improve snapshot performance?

Thanks for any help.

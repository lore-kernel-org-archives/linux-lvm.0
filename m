Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4S0BVNK004366
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 20:11:31 -0400
Received: from hu-out-0102.google.com (hu-out-0102.google.com [72.14.214.204])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4S0BO6m001116
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 20:11:25 -0400
Received: by hu-out-0102.google.com with SMTP id 35so246035hue
	for <linux-lvm@redhat.com>; Sat, 27 May 2006 17:11:19 -0700 (PDT)
Message-ID: <5485940d0605271711g6d372400s3ab56c79e0488338@mail.gmail.com>
Date: Sun, 28 May 2006 01:11:18 +0100
From: "C'est Pierre" <cestpierre@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] alternate link / multi-pathing
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

Hello,

How can I setup multi-pathing so that I can create a vg with a
physical device over two different fibre-channel links, so if one link
fails, LVM uses the other?

I am using the term alternate link but its origins are in hp-ux.

If you could point me to some documentation on it, I would appreciate it!

Thanks,
Pierre

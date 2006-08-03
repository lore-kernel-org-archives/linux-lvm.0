Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k73BTcjZ024305
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 07:29:38 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.179])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k73BTWO5007553
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 07:29:33 -0400
Received: by py-out-1112.google.com with SMTP id o67so3497842pye
	for <linux-lvm@redhat.com>; Thu, 03 Aug 2006 04:29:32 -0700 (PDT)
Message-ID: <ebf0fc470608030427h355ca555q4656893374bee98e@mail.gmail.com>
Date: Thu, 3 Aug 2006 20:27:43 +0900
From: "Stanislaw Senotrusov" <senotrusov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] pvresize, resize 8e Linux LVM partition
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

I figured out.

The problem is that I'm missing some fundamentals. There is no need
for a "resize" command in fdisk, sinse it is a partition table,
nothing more. All I need is to delete a partition, then to create new
with the same type and start cylinder but ending at last cylinder.
Then write this table on disk and do pvresize.

Thank you for patience :)

--
Stas Senotrusov

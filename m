Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KBRiGn019412
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 07:27:44 -0400
Received: from wx-out-0506.google.com (wx-out-0506.google.com [66.249.82.232])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KBRZ15032486
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 07:27:35 -0400
Received: by wx-out-0506.google.com with SMTP id i30so434947wxd
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 04:27:35 -0700 (PDT)
Message-ID: <ada605fb0609200427k5e86c7f5ueddcd47d00f0b14c@mail.gmail.com>
Date: Wed, 20 Sep 2006 14:27:35 +0300
From: "John Que" <qwejohn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] pvcreate on a loopback device - error: (newbie)
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

I had tried to do some test with LVM on a loopback device
follwing some tutorials on the web.

I get errors.
what I do is this:

dd if=/dev/zero of=/work/tmp/disk-image count=10240
mke2fs /work/tmp/disk-image
mount -o loop /work/tmp/disk-image /work/loop/    78  14:23

pvcreate /dev/loop1

error:
 Failed to wipe new metadata area
  /dev/loop1: Format-specific setup of physical volume failed. Failed
to setup physical volume "/dev/loop1"


what did I do wrong ?

Regards,
John

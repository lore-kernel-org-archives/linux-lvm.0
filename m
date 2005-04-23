Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3N53IO19666
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 01:03:18 -0400
Received: from mail.samera.com.py (mail.samera.com.py [200.85.40.10])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3N53872014169
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 01:03:11 -0400
Received: from [192.168.1.1] (sojourner.samera.com [192.168.1.1])
	by mail.samera.com.py (8.12.8/8.12.8) with ESMTP id j3N52uKA028259
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2005 01:02:56 -0400
Message-ID: <4269D703.9030801@samera.com.py>
Date: Sat, 23 Apr 2005 01:02:59 -0400
From: "Oliver Schulze L." <oliver@samera.com.py>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Resizing root lvm
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

Hi,
I just installed the trial of RHEL4, I noted that the autopartition selected
a LVM configuration for the root partition.
I wanted to know if it is posible to add a new partition and then resize the
root partition.

I have tryied but could not make the ext3 filesistem to grow. The lv have
become bigger, but not the filesystem.

How can I resize the filesystem too?

Thanks
Oliver

-- 
Oliver Schulze L.
<oliver@samera.com.py>

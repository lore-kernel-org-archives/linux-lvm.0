Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3N7PX8H031855
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 03:25:33 -0400
Received: from ti-out-0910.google.com (ti-out-0910.google.com [209.85.142.185])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3N7P1RG008059
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 03:25:02 -0400
Received: by ti-out-0910.google.com with SMTP id 11so994121tim.7
	for <linux-lvm@redhat.com>; Wed, 23 Apr 2008 00:25:00 -0700 (PDT)
Message-ID: <1cafab770804230025q585c565awc8a70c8b9b2d2345@mail.gmail.com>
Date: Wed, 23 Apr 2008 15:25:00 +0800
From: "Xinwei Hu" <hxinwei@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: [linux-lvm] clvmd on openais
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

Hi all,
  clvmd-openais.c uses saLckResourceLockAsync and
saLckResourceUnlockAsync. But they then pthread_cond_wait the lock
operation to finished.

  Since we have to wait, why not switch to use saLckResourceLock and
saLckResourceUnlock directly ? Are there any reasons behind this ?

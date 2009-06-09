Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n59LI1qO004683
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 17:18:01 -0400
Received: from mail-fx0-f214.google.com (mail-fx0-f214.google.com
	[209.85.220.214])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n59LHmqh029010
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 17:17:48 -0400
Received: by fxm10 with SMTP id 10so311909fxm.3
	for <linux-lvm@redhat.com>; Tue, 09 Jun 2009 14:17:47 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 10 Jun 2009 00:17:47 +0300
Message-ID: <cf917e520906091417n31a7a0e1i4e40d84ee8170d68@mail.gmail.com>
From: ajalkane <ajalkane@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Setting LVM logical volume filesystem type
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

Hi,

how can I set the filesystem type for LVM2 logical volume? For some
reason my logical volume /var, which is ext3, suddenly started to be
detected as solaris_mirror_member (or something to that effect) which
causes it to be unable to be automatically mounted. If I mount it
manually specifying the filesystem type as ext3 it works. Fsck reports
no errors.

This happened just suddenly. Naturally I would like to know how it
could corrupt like that. But it might be difficult. Right now I just
want my system to be usable again. How can I tell LVM that it is
indeed ext3 volume without reformatting the logical volume?

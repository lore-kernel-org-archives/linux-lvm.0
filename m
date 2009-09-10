Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8A6Je8e017041
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 02:19:40 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.157])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8A6JTcV028288
	for <linux-lvm@redhat.com>; Thu, 10 Sep 2009 02:19:30 -0400
Received: by fg-out-1718.google.com with SMTP id e12so1316033fga.9
	for <linux-lvm@redhat.com>; Wed, 09 Sep 2009 23:19:29 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 10 Sep 2009 09:19:29 +0300
Message-ID: <352f9c2a0909092319h2e115e07lbf867825c68c102e@mail.gmail.com>
From: pent 5971 <pent5971@gmail.com>
Subject: [linux-lvm] Understanding if a disk is partioned with LVM or not
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,
Im new to this LVM stuff and still couldnt read and understand enough.
But i have a RHEL 5x box (which i didnt installed) and we have
phsically added a new disk which i have to create a file system to be
able to use it.  df -h command gives normal /var /data / partions, but
id like ask how can i understand if the first disk/sytem is created
with LVM , and if so (any other box can be so in the future) what is
best way to add the disk and crete the file system?

Regards

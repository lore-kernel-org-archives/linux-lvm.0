Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1CDa7l1023165
	for <linux-lvm@redhat.com>; Wed, 12 Feb 2014 08:36:07 -0500
Received: from mail-yk0-f195.google.com (mail-yk0-f195.google.com
	[209.85.160.195])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1CDa357004574
	for <linux-lvm@redhat.com>; Wed, 12 Feb 2014 08:36:04 -0500
Received: by mail-yk0-f195.google.com with SMTP id 10so3569209ykt.2
	for <linux-lvm@redhat.com>; Wed, 12 Feb 2014 05:36:03 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 12 Feb 2014 08:36:03 -0500
Message-ID: <CAGd4S1QGxVXOG5FN0X20iobF8CvZrOSHGbB5WvfHSJ7gO0W6tQ@mail.gmail.com>
From: John Taylor <jtt77777@gmail.com>
Subject: [linux-lvm] vg_mda_free incorrect on lvm2-2.02.98 ?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
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

Hi All,

I'm trying to verify if  vgs -o vg_mda_free is correct for  lvm2-2.02.98

I'm running fedora 19 with lvm2-2.02.98 (specifically
vm2-2.02.98-14.fc19.x86_64). All of the hosts  show 0 for VMdaFree for
all vgs, and I'm fairly certain that's not the case.

Anyone else see this?

Thanks,
-John

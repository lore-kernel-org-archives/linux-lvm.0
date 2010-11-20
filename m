Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAKBw8tJ001606
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 06:58:08 -0500
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAKBvrqu006300
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 06:57:53 -0500
Received: by gxk23 with SMTP id 23so3460824gxk.33
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 03:57:52 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=VhzRaQJ8_FL_eGgAhMQu8kiLKpHQBEvDViXo5@mail.gmail.com>
References: <AANLkTi=VhzRaQJ8_FL_eGgAhMQu8kiLKpHQBEvDViXo5@mail.gmail.com>
Date: Sat, 20 Nov 2010 12:32:34 +0100
Message-ID: <AANLkTin+pqxOoq_pmvoVoRW_QQY2DmQcC7A-x1KoPDKK@mail.gmail.com>
From: Beat miller <beat.miller2@gmail.com>
Subject: [linux-lvm] Architecure of Striping
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

I am working on my bachelor thesis about LVM
During my research I could not find out, how striping was designed in LVM.
Where can I find a LVM architecture documentation?

Where can I finde a document how it was designed.
Is this correct, the stripsize the smalles unit in lvm?
Are regionsize (mirroring) and the stripsize the same unit, but with
diffrent requirements?

Is it best practis to use mdadm for mirroring and lvm above for striping?
Or are there some disadvantage?

Thank's
Beat

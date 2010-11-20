Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAKBhffJ000681
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 06:43:41 -0500
Received: from mail-gx0-f174.google.com (mail-gx0-f174.google.com
	[209.85.161.174])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAKBhPNi003053
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 06:43:25 -0500
Received: by gxk23 with SMTP id 23so3457416gxk.33
	for <linux-lvm@redhat.com>; Sat, 20 Nov 2010 03:43:25 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTi=VhzRaQJ8_FL_eGgAhMQu8kiLKpHQBEvDViXo5@mail.gmail.com>
References: <AANLkTi=VhzRaQJ8_FL_eGgAhMQu8kiLKpHQBEvDViXo5@mail.gmail.com>
Date: Sat, 20 Nov 2010 12:35:07 +0100
Message-ID: <AANLkTi=hj5P_enyRMwfvKipMxxJkigqEQ69mniYdS5Y3@mail.gmail.com>
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

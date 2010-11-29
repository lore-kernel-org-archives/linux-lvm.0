Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oATHVXRk023701
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 12:31:33 -0500
Received: from mail-yw0-f46.google.com (mail-yw0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oATHVLdM009501
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 12:31:21 -0500
Received: by ywl5 with SMTP id 5so2252769ywl.33
	for <linux-lvm@redhat.com>; Mon, 29 Nov 2010 09:31:21 -0800 (PST)
MIME-Version: 1.0
From: "redsnapper8t8@gmail.com" <redsnapper8t8@gmail.com>
Date: Mon, 29 Nov 2010 16:30:26 +0000
Message-ID: <AANLkTi=06Mqd6dSYAPNN80PVXhOj=A4sDNv3Fk2UY-GQ@mail.gmail.com>
Subject: [linux-lvm] PV UUID
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

Hi,

I have just experienced some issues relating to a PV UUID's not
matching up with the UUID on an EVA SAN presented LUN after a reboot.
The resolution was to recreate the PV with the new UUID using the
restorefile. I am currently diagnosing the issue and trying to figure
out how the UUID on the SAN LUN gets generated and how it may have
changed between reboots.

I am using CentOS release 5.5 (Final)

Linux 2.6.18-194.3.1.el5 #1 SMP Thu May 13 13:08:30 EDT 2010 x86_64
x86_64 x86_64 GNU/Linux

Any help would be greatly appreciated.

Regards,

John



-- 
_____________________________________
John Moylan

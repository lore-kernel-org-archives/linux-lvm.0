Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2AK9u106992
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 15:09:56 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.206])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2AK9nkU010583
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 15:09:49 -0500
Received: by wproxy.gmail.com with SMTP id i22so741328wra
	for <linux-lvm@redhat.com>; Fri, 10 Mar 2006 12:09:49 -0800 (PST)
Message-ID: <e9fa0e520603101209y3e0e6aa5y2dedde8bafa7f968@mail.gmail.com>
Date: Fri, 10 Mar 2006 15:09:49 -0500
From: "David Chin" <david.w.h.chin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Getting (non-root) LV to be mounted at boot
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

I've followed the instructions on the HOWTO, and was
able to create a logical volume, and then mount it as
ext3. Was able to read and write to it with no trouble.

I followed the instructions here, except with just one
IDE partition, /dev/hda1 that I set to have type "Linux LVM":

  http://www.tldp.org/HOWTO/LVM-HOWTO/recipethreescsi.html

I also added a line in my /etc/fstab:

  /dev/myvg/mylv  /mnt/bigdisk  ext3 defaults  1 0

However, when the machine is rebooted, it is unable
to mount this volume. In addition, the machine seems
to "forget" about any PVs, VGs, and LVs that were
created.

What am I missing?

Thanks in advance,
   Dave

--
Email: david.w.h.chin@gmail.com

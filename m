Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2JBVJLd017902
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 07:31:19 -0400
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.176])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2JBV3ng006420
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 07:31:04 -0400
Received: by wa-out-1112.google.com with SMTP id v33so388075wah.19
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2009 04:31:03 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 19 Mar 2009 17:01:03 +0530
Message-ID: <37d33d830903190431yf906795j45f2efd5e765a2fd@mail.gmail.com>
From: Sandeep K Sinha <sandeepksinha@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] liblvm IOCTL/sysfs interface
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi all,

I  would like to know if there is any means currently to know the complete
geometry of a LVM volume.
e.g, If a volume has 3 PV(targets).

So, we should be able to extract some information like.

Name of Volume.
Name of Volume Group.
Name, Range and size for each of the Physical devices involved.

I execute the following steps.

1. pvcreate /dev/sda5 /dev/sda6
2. vgcreate vg /dev/sda5 /dev/sda6
3. lvcreate vg -L 5G

So, I should see the information like.

lvol0
vg
target1 - /dev/sda5 ----  0 -- 10000 ( BEGIN  -- Length )
target2 - /dev/sda6 ----  10001 -- 4000


We do maintain these informations inside the kernel, We should atleast
have an ioctl or sysfs based interface to extract
these information.

Liblvm is under development, won't it be of a good use to provide such
a functionality.

Kindly suggest.

-- 
Regards,
Sandeep.





 	
�To learn is to change. Education is a process that changes the learner.�

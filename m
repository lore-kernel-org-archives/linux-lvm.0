Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6GD9LVg011335
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 09:09:21 -0400
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.173])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6GD8xAx019116
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 09:09:10 -0400
Received: by wf-out-1314.google.com with SMTP id 25so4748985wfc.6
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 06:08:59 -0700 (PDT)
Message-ID: <d5dce2210807160608i4598bac5mdf7d2473d673b7f5@mail.gmail.com>
Date: Wed, 16 Jul 2008 18:38:59 +0530
From: "himanshu padmanabhi" <himanshu.padmanabhi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_11561_13030263.1216213739190"
Subject: [linux-lvm] Important.....LVM + iSCSI
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
To: linux-lvm@redhat.com

------=_Part_11561_13030263.1216213739190
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Everyone.....

1. Actually I am a "iSCSI"(Phenomenon giving illusion of remote disk as
local one) guy.

Target exposes LV's.Initiator "*logs in*" to the LV's which he will see as
"Disks".

Initiator will make a LV on the "Disk" exposed from the target.Writes some
data on that mounted LV.

After Unmount,Initiator logged out of that disk.

When Initiator re-logins to the same disk,that LV is visible.But *WE CANNOT
MOUNT THAT.AND THUS DATA WRITTEN EARLIER BECOMES INACCESSIBLE.*
---------------------------------------------------------------------------------------------------------------------------------------------
2. When "/etc/lvm/lvm.conf" is read?One I know is at the time of
installation of LVM.

    At the time of "*Logout*" of the LV,we can add a filter in it to deny
showing LV's created on the Exposed disk.
---------------------------------------------------------------------------------------------------------------------------------------------
Experts opinion needed.

------=_Part_11561_13030263.1216213739190
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hello Everyone.....<br><br>1. Actually I am a &quot;iSCSI&quot;(Phenomenon giving illusion of remote disk as local one) guy.<br><br>Target exposes LV&#39;s.Initiator &quot;<b>logs in</b>&quot; to the LV&#39;s which he will see as &quot;Disks&quot;.<br>
<br>Initiator will make a LV on the &quot;Disk&quot; exposed from the target.Writes some data on that mounted LV. <br><br>After Unmount,Initiator logged out of that disk.<br><br>When Initiator re-logins to the same disk,that LV is visible.But <b>WE CANNOT MOUNT THAT.AND THUS DATA WRITTEN EARLIER BECOMES INACCESSIBLE.</b><br>
---------------------------------------------------------------------------------------------------------------------------------------------<br>2. When &quot;/etc/lvm/lvm.conf&quot; is read?One I know is at the time of installation of LVM.<br>
<br>&nbsp;&nbsp;&nbsp; At the time of &quot;<b>Logout</b>&quot; of the LV,we can add a filter in it to deny showing LV&#39;s created on the Exposed disk.<br>---------------------------------------------------------------------------------------------------------------------------------------------<br>
Experts opinion needed.<br><br></div>

------=_Part_11561_13030263.1216213739190--

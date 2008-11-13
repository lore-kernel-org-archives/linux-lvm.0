Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAD9t1mP017090
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 04:55:01 -0500
Received: from yx-out-2324.google.com (yx-out-2324.google.com [74.125.44.30])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAD9rN5Y004285
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 04:54:02 -0500
Received: by yx-out-2324.google.com with SMTP id 31so330183yxl.81
	for <linux-lvm@redhat.com>; Thu, 13 Nov 2008 01:53:23 -0800 (PST)
Message-ID: <d5dce2210811130153t665c9548y47d1522aa9d78c84@mail.gmail.com>
Date: Thu, 13 Nov 2008 15:23:22 +0530
From: "himanshu padmanabhi" <himanshu.padmanabhi@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_2885_8875191.1226570002966"
Subject: [linux-lvm] [BUG IN MS?]MS initiator reboots if lv+snapshot added
	as a lun
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
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_2885_8875191.1226570002966
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

*Problem*

One IET target is having 2 luns as "Parent LV" and "its snapshot".

When MS initiator connects to it,it gets rebooted.

I came to know through forum that it is due to same disk signatures of the
two disks on initiator side.

If I attach "Parent LV" and "its snapshot" to different targets,then windows
initiator is behaving well.

But in Open-iSCSI initiator under linux,both cases work well,
*
Issues

*both parent lv and its snapshot are taking same IDs probably.How can i
change the id of snapshot.It determines ID internally through timestamps and
some other things.Both takes UUID obviously different.Windows might see
these either as two copies of the same volume or two paths to the same
volume, but their data diverges which causes Windows to freak out.Windows
stores a volume identifier in the MBR/GPT when a disk is first recognized
and uses that identifier for identification of storage volumes.But I cannot
make changes on client(initiator) side as my product is server machine.

basically *what changes should be made on the target side so that initiator
will recognize both as different disks?
*
-- 
Thanks and Regards,
Himanshu Padmanabhi

------=_Part_2885_8875191.1226570002966
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<span class="nfakPe"><b>Problem</b><br><br>One IET target is having 2 luns as &quot;Parent LV&quot; and &quot;its snapshot&quot;.<br><br>When MS initiator connects to it,it gets rebooted.<br><br>I came to know through forum that it is due to same disk signatures of the two disks on initiator side.<br>
<br>If I attach &quot;Parent LV&quot; and &quot;its snapshot&quot; to different targets,then windows initiator is behaving well.<br><br></span>But in Open-iSCSI initiator under linux,both cases work well,<span class="nfakPe"></span><br clear="all">
<b><br>Issues<br><br></b>both parent lv and its snapshot are taking same IDs probably.How can i change the id of snapshot.It determines ID internally through timestamps and some other things.Both takes UUID obviously different.Windows might see these either as two copies of the same volume or two paths to the same volume, but their data diverges which causes Windows to freak out.Windows stores a volume identifier in the MBR/GPT when a disk is first recognized and uses that identifier for identification of storage volumes.But I cannot make changes on client(initiator) side as my product is server machine.<br>
<br>basically <b>what changes should be made on the target side so that initiator will recognize both as different disks?<br></b><br>-- <br>Thanks and Regards,<br>Himanshu Padmanabhi<br><br>

------=_Part_2885_8875191.1226570002966--

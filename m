Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n3LFmlpS015648
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 11:48:47 -0400
Received: from pluto.sivell.com (z-t3.aifi.com [65.112.245.198])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n3LFmFms006927
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 11:48:34 -0400
Received: from ef.sivell.com (ef [192.168.249.210]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n3LFp8f8023490
	for <linux-lvm@redhat.com>; Tue, 21 Apr 2009 10:51:08 -0500
Message-ID: <49EDEA93.1090406@sivell.com>
Date: Tue, 21 Apr 2009 10:47:31 -0500
From: vu pham <vu@sivell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] re-activate lv after reboot ?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

My server uses iscsiadm to access a remote iscsi device. VG and LV are 
created on that device and can be accessed just fine.
The problem is after reboot, the LVs are in inactive mode and I have to 
run vgchange -a y to activate the VG on the iscsi device or to put that 
command /etc/rcd./rc.local.

Is there any way to automatically to activate those LVs/VGs when the 
iscsi device starts ?

Thanks,
Vu

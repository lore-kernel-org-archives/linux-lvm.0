Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7NKpQa08272
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2004 16:51:26 -0400
Received: from bureau8.utcc.utoronto.ca (bureau8.utcc.utoronto.ca
	[128.100.132.18])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7NKpEe1006985
	for <linux-lvm@redhat.com>; Mon, 23 Aug 2004 16:51:19 -0400
Message-ID: <1093294244.412a58a4dbdc9@webmail.utoronto.ca>
Date: Mon, 23 Aug 2004 16:50:44 -0400
From: mike.czajka@utoronto.ca
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Subject: [linux-lvm] FS recovery from lost vg, pv data
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello;

I have a (probably common and detested) LVM1 recovery question: how can i get
the data off my /dev/hda3 (LVM partition) which previously housed a VG and a few
LVs whose metadata is now lost, having done a 'pvcreate -ff /dev/hda3' and a
'vgcreate vg /dev/hda3'? The actual data is in a few reiserfs3 partitions of
unknown sizes (unknown number of LVs, approximately 4). 

I removed my /dev/hdb PV using vgreduce, after attempting a pvmove (but it
seemed that it wasn't used). After a reboot I couldn't mount my root LV (it was
a very bad idea to make a root lv), and after booting using a bootCD vgscan
exited with 'error pv_read_pe can't get data of volume group from physical
volume' (roughly). So this is when I tried 'pvcreate -ff' and created a new vg.
However, I cannot guess at the LV information. 

Any help would be greatly appreciated.

Thanks,
-Mike

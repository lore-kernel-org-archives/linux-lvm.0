Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9JFikr01954
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2004 11:44:46 -0400
Received: from orogeno.ija.csic.es (orogeno.ija.csic.es [193.144.102.12])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9JFiV2k021843
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2004 11:44:41 -0400
Received: from orogeno.ija.csic.es (localhost.localdomain [127.0.0.1])
	by orogeno.ija.csic.es (8.12.8/8.12.8) with ESMTP id i9JET6dR031489
	for <linux-lvm@redhat.com>; Tue, 19 Oct 2004 16:29:06 +0200
Received: (from apache@localhost)
	by orogeno.ija.csic.es (8.12.8/8.12.8/Submit) id i9JET6er031487
	for linux-lvm@redhat.com; Tue, 19 Oct 2004 16:29:06 +0200
Message-ID: <1098196146.417524b2aac5a@orogeno.ija.csic.es>
Date: Tue, 19 Oct 2004 16:29:06 +0200
From: iflecha@ija.csic.es
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] damaged disk in a logical volume
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

Hi,

I was working with a logical volume which was built with four disks. The fourth
one has been damaged (I don't know the cause), even mkfs fails, probably some
damaged sector. I would like to know if it's possible to recover some data from
the other disks. I tried to remove the damaged disk from the logical volume but
I can't deal with any physical volume if one of them are bad.

My file.vg:

maltes01 {
        id = "iHkB9I-og1A-TrIV-ZefG-Ai0W-5rk5-52kR1t"
        seqno = 0
        status = ["RESIZEABLE", "READ", "WRITE"]
        extent_size = 8192              # 4 Megabytes
        max_lv = 255
        max_pv = 255

        physical_volumes {

                pv0 {
                        id = "TPWYqO-TXGt-CIjl-fQQN-rMnZ-tpjQ-GuhJc3"
                        device = "/dev/sda"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 17501        # 68.3633 Gigabytes
                }

                pv1 {
                        id = "5eFxOP-YwQI-ns89-YW51-YNnY-xmmB-HIBwWJ"
                        device = "/dev/sdb"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 17537        # 68.5039 Gigabytes
                }

                pv2 {
                        id = "UvlyW9-hY4u-50Zp-plNV-1Fco-R0hr-vgbIiM"
                        device = "/dev/sdc"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 17537        # 68.5039 Gigabytes
                }

                pv3 {
                        id = "BSWMyc-bEfD-vfTJ-px8U-G8nt-M8J6-QHvHnz"
                        device = "/dev/sdd"     # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 384
                        pe_count = 4379 # 17.1055 Gigabytes
                }
        }

}

Any idea? Thanks in advance

-------------------------------------------------
This mail sent through IMP: http://horde.org/imp/

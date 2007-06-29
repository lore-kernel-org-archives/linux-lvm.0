Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5TA8Caq002581
	for <linux-lvm@redhat.com>; Fri, 29 Jun 2007 06:08:12 -0400
From: Turbo Fredriksson <turbo@bayour.com>
Date: Fri, 29 Jun 2007 12:08:06 +0200
Message-ID: <87ps3fdqex.fsf@pumba.bayour.com>
MIME-Version: 1.0
Sender: Turbo Fredriksson <turbo@pumba.redhat.com>
Subject: [linux-lvm] Forcibly remove broken disk from LV
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I have a disk that only gives SCSI errors etc which
I want to remove from the VG. But vgreduce only hangs
and so does pvremove...

If I physically remove the disk, the vg/pv/lv etc isn't
accessible so the vgreduce won't work (claims that it
can't find any PV's etc).

So how do I remove the disk?

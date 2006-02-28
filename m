Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1S185128895
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 20:08:05 -0500
Received: from relay1.uol.com.br (relay1.uol.com.br [200.221.4.108])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1S183Pn021651
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 20:08:04 -0500
Received: from shark1.mail.sys.intranet (unknown [172.26.5.52])
	by shark1.mail.sys.intranet (Postfix) with SMTP id B49E8B12A
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 22:07:52 -0300 (BRT)
Date: Mon, 27 Feb 2006 22:07:51 -0300
Message-Id: <IVDHT3$4D014995332A7BD8339106C2CBEA1897@uol.com.br>
MIME-Version: 1.0
From: "renato\.shimizu" <renato.shimizu@uol.com.br>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM - vgimport
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
To: linux-lvm <linux-lvm@redhat.com>
Cc: "renato.shimizu" <renato.shimizu@uol.com.br>

Hi experts

I need some help about this problem. 
I need to backup my volume group oravg. So, I�m using shadow image (BCV) on my disks on same server, it�s same I make dd if=/dev/sdc1 of=/dev/sdd1 bs=1024k, but after it sync on disks, there are on pvscan /dev/sdc1 and /dev/sdd1 with same name. 
I can�t to import with "vgimport -f copy_oravg /dev/sdd1", because the disks is using same name allocate "oravg".
Can I change volume group in physical volumes inactive?
Can I change UUID on physical volumes inactive?
I see that HP-UX there are vgchgid command?
http://docs.hp.com/en/B2355-90692/vgchgid.1M.html

Thanks in advanced.

Best regards.

Renato.

 

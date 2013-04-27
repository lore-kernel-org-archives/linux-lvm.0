Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r3R8xBtd020058
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 04:59:11 -0400
Received: from nm31-vm1.bullet.mail.bf1.yahoo.com
	(nm31-vm1.bullet.mail.bf1.yahoo.com [72.30.239.9])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r3R8xA9e014426
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 04:59:10 -0400
Message-ID: <1367053149.42959.YahooMailNeo@web163001.mail.bf1.yahoo.com>
Date: Sat, 27 Apr 2013 01:59:09 -0700 (PDT)
From: Mahmood Naderan <nt_mahmood@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] problem mounting the lvm drive
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

Dear all
I had created a LVM from 3 physical volumes and here is the output of "lvdisplay"

$ lvdisplay
� --- Logical volume ---
� LV Name��������������� /dev/orcafiler1/orcavolume
� VG
 Name��������������� orcafiler1
� LV UUID��������������� ViopUK-WTiy-bwzw-jpkL-oeF9-AvQV-Q0J6Fi
� LV Write Access������� read/write
� LV Status������������� NOT available
� LV Size��������������� 2.73 TiB
� Current LE������������ 715401
� Segments�������������� 1
� Allocation������������ inherit
� Read ahead sectors���� auto


However there is no /dev/orcafiler1/orcavolume.
As a result when I want to mount it, I get an error

$ mount /dev/orcafiler1/orcavolume /data
mount: special device
 /dev/orcafiler1/orcavolume does not exist



I have to say, there was no problem with this drive before. After a reboot I get this error.
Indeed there are some files on the lvm but I can not mount it.
Any feedback is appreciated.


Regards,
Mahmood

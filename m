Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6CJZULp020645
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2012 15:35:30 -0400
Received: from nm1-vm0.bullet.mail.ne1.yahoo.com
	(nm1-vm0.bullet.mail.ne1.yahoo.com [98.138.91.74])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q6CJZTMB006222
	for <linux-lvm@redhat.com>; Thu, 12 Jul 2012 15:35:29 -0400
Message-ID: <1342121728.93896.YahooMailNeo@web121605.mail.ne1.yahoo.com>
Date: Thu, 12 Jul 2012 12:35:28 -0700 (PDT)
From: DacioMF <daciomf@yahoo.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Switch between mirrored master/slave devices
Reply-To: DacioMF <daciomf@yahoo.com.br>,
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

I have a logical volume mirrored between /dev/mapper/mpath0 and /dev/mapper/mpath3:
# lvs -a -o +devices
� LV������������������ VG������ Attr���� LSize�� Pool Origin Data%� Move Log Copy%� Convert Devices���������������������������������� 
� vm01-disk����������� VMMIRROR mwi-aom-�� 7.00g���������������������������� 100.00�������� vm01-disk_mimage_0(0),vm01-disk_mimage_1(0)
� [vm01-disk_mimage_0] VMMIRROR iwi-aom-�� 7.00g������������������������������������������� /dev/mapper/mpath3(0)�������������������� 
� [vm01-disk_mimage_1] VMMIRROR iwi-aom-�� 7.00g������������������������������������������� /dev/mapper/mpath0(0)

The master device (/dev/mapper/mpath0) failed and i repair it without any problem, but now my master device is /dev/mapper/mpath3.
I want to change my master device back to /dev/mapper/mpath0 again. How can i do this?
�
DacioMF
Analista de Redes e Infraestrutura

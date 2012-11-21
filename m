Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qALFW7gv024956
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2012 10:32:07 -0500
Received: from nm27-vm0.bullet.mail.bf1.yahoo.com
	(nm27-vm0.bullet.mail.bf1.yahoo.com [98.139.213.139])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qALFW5Oa015776
	for <linux-lvm@redhat.com>; Wed, 21 Nov 2012 10:32:06 -0500
Message-ID: <1353511924.98782.YahooMailNeo@web140004.mail.bf1.yahoo.com>
Date: Wed, 21 Nov 2012 07:32:04 -0800 (PST)
From: DacioMF <daciomf@yahoo.com.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Sync LVs in RAID
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

Hi,

I have a logical volume in RAID1 like the following:
� LV������� VG����� Attr���� LSize� Pool Origin Data%� Move Log Copy%� Convert� 
� vm01-disk VMRAID rwi-a-m- 50,00g���������������������������� 100,00������� 
� vm01-swap VMRAID rwi-a-m-� 4,00g���������������������������� 100,00

One of my physical devices failed and i continuous writing in the other device without any problems.
I replaced the failed device but his data is not syncronized with other.

What i have to do to make the sync?


DacioMF
Analista de Redes e Infraestrutura

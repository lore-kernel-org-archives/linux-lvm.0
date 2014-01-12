Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0C4xTFJ008132
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2014 23:59:29 -0500
Received: from nm24-vm0.bullet.mail.bf1.yahoo.com
	(nm24-vm0.bullet.mail.bf1.yahoo.com [98.139.213.161])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0C4xRbb026266
	for <linux-lvm@redhat.com>; Sat, 11 Jan 2014 23:59:28 -0500
References: <1389500888.48728.YahooMailNeo@web161702.mail.bf1.yahoo.com>
	<52D21B4F.50504@alteeve.ca>
Message-ID: <1389502767.50207.YahooMailNeo@web161703.mail.bf1.yahoo.com>
Date: Sat, 11 Jan 2014 20:59:27 -0800 (PST)
From: Tom+Dale <tdmyth@yahoo.com>
In-Reply-To: <52D21B4F.50504@alteeve.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Logical Volume Inaccessible
Reply-To: Tom+Dale <tdmyth@yahoo.com>,
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
To: Digimer <lists@alteeve.ca>, LVM general discussion and development <linux-lvm@redhat.com>


>What does 'pvscan; vgscan; lvscan' show? If the LVs show 'inactive', try 

>'lvchange -ay <lv_path>', then 'lvscan' should show the LV as 'ACTIVE'. 
>If so, try mounting the LV.
>-- 
>Digimer
>Papers and Projects: https://alteeve.ca/w/
>What if the cure for cancer is trapped in the mind of a person without 
>access to education?

Here is what I got:

[root@localhost ~]# pvscan
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� No matching physical volumes found
[root@localhost ~]# lvscan
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
[root@localhost ~]# vgscan
� Reading all physical volumes.� This may take a while...
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
[root@localhost ~]# lvchange -ay /dev/sda2
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 0: Input/output error
� /dev/sda2: read failed after 0 of 1024 at 4096: Input/output error
� /dev/sda2: read failed after 0 of 2048 at 0: Input/output error
� Volume group "sda2" not found
� Skipping volume group sda2
[root@localhost ~]# 

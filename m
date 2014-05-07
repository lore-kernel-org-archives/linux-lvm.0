Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s477XAB2024048
	for <linux-lvm@redhat.com>; Wed, 7 May 2014 03:33:10 -0400
Received: from nm16.bullet.mail.bf1.yahoo.com (nm16.bullet.mail.bf1.yahoo.com
	[98.139.212.175])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s477X8CB031442
	for <linux-lvm@redhat.com>; Wed, 7 May 2014 03:33:08 -0400
References: 
Message-ID: <1399447987.73696.YahooMailNeo@web141603.mail.bf1.yahoo.com>
Date: Wed, 7 May 2014 00:33:07 -0700 (PDT)
From: Mahmood Naderan <nt_mahmood@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Add a disk from remote node to LVM
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


Hello,
Is it possible to add a network drive to an existing LVM? I have created a group on the main node (N1) and have added three local drives. Now I want to add a remote disk from another node (N2). In other words, I want to add N2:/dev/sdb to N1:/dev/tigerfiler/tigervolume


Is that possible? How? All examples I see are trying to add extra local drives and not remote drives.


Here are some info


# vgdisplay
� --- Volume group ---
� VG Name�������������� tigerfiler1
� System ID

Format��������������� lvm2
� Metadata Areas������� 3
� Metadata Sequence No� 2
� VG Access������������ read/write
� VG Status������������ resizable
� MAX LV��������������� 0
� Cur LV��������������� 1
� Open LV�������������� 1
� Max
PV��������������� 0
� Cur PV��������������� 3
� Act PV��������������� 3
� VG Size�������������� 2.73 TiB
� PE Size�������������� 4.00 MiB
� Total PE������������� 715401
� Alloc PE / Size������ 715401 / 2.73 TiB
� Free� PE / Size������ 0 / 0
� VG
UUID�������������� 8Ef8Vj-bDc7-H4ia-D3X4-cDpY-kE9Z-njc8lj



pvdisplay
� --- Physical volume ---
� PV Name�������������� /dev/sdb
� VG Name�������������� tigerfiler1
� PV Size�������������� 931.51 GiB / not usable 1.71 MiB
� Allocatable���������� yes (but full)
� PE Size�������������� 4.00 MiB

Total PE������������� 238467
� Free PE�������������� 0
� Allocated PE��������� 238467
� PV UUID�������������� FmC77z-9UaR-FhYa-ONHZ-EazF-5Hm2-8zmUuj

� --- Physical volume ---
� PV Name�������������� /dev/sdc
� VG Name�������������� tigerfiler1
� PV Size�������������� 931.51 GiB / not usable 1.71 MiB
� Allocatable���������� yes (but full)
� PE Size�������������� 4.00 MiB
� Total PE������������� 238467
� Free PE�������������� 0
� Allocated PE��������� 238467
� PV UUID�������������� 1jBQUn-gkkD-37I3-R3nL-KeHA-Hn2A-4zgNcR

� --- Physical volume ---
� PV Name�������������� /dev/sdd
� VG Name�������������� tigerfiler1
� PV Size�������������� 931.51 GiB / not usable 1.71 MiB
� Allocatable���������� yes (but full)
� PE Size�������������� 4.00 MiB
� Total PE������������� 238467
� Free PE�������������� 0
� Allocated PE��������� 238467
� PV
UUID�������������� mxi8jW-O868-iPse-IfY7-ag3m-R3vZ-gS3Jdx



Regards,
Mahmood����

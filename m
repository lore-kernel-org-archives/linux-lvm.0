Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0EHcHr30694
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 12:38:17 -0500
Received: from svsmail.gsfc.nasa.gov (svsmail.gsfc.nasa.gov [128.183.34.28])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0EHcGJH020381
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 12:38:16 -0500
Received: from [128.183.34.47] (nu.gsfc.nasa.gov [128.183.34.47])
	by svsmail.gsfc.nasa.gov (Postfix) with ESMTP id 5990780200
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 12:38:11 -0500 (EST)
Message-ID: <41E80382.1000403@svs.gsfc.nasa.gov>
Date: Fri, 14 Jan 2005 12:38:10 -0500
From: "Randall A. Jones" <rajones@svs.gsfc.nasa.gov>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] understanding large LVM volumes
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
To: linux-lvm@redhat.com

Hello.
I am trying to understand what the size limitations of VGs are for LVM2.
I am running 2.6.10-1.741_FC3smp, lvm2-2.00.25
The HOWTO document has really helped my understanding of the general 
concepts involved.

My goal is to create a 4+TB VG with current devices and then be able to 
expand this VG to 10+TB when new resources become available.

My questions are as follows. 
What is the maximum size of a single VG?
How does the Physical Extent size affect the maximum VG size?
How does one go about chosing a PE size for a VG? 

Does anyone have experience with very large LVM VGs?
I want to ensure that I choose a good PE size when creating this large 
VG and that
I don't paint myself into a corner, making it difficult to grow to 10TB 
when the time
comes.

Any information, suggestions, or experiences for/with large volumes would
be much appreciated.

As a test, I created a VG with 3 devices totaling 4.3TB.  I used only 
defaults.

[root@damascus ~]# pvscan

  PV /dev/sdc1   VG testvg   lvm2 [431.99 GB / 0    free]

  PV /dev/sdd1   VG testvg   lvm2 [1.95 TB / 0    free]

  PV /dev/sde1   VG testvg   lvm2 [1.95 TB / 0    free]

  Total: 3 [4.33 TB] / in use: 3 [4.33 TB] / in no VG: 0 [0   ]

[root@damascus ~]# vgdisplay

  --- Volume group ---

  VG Name               testvg

  System ID             

  Format                lvm2

  Metadata Areas        3

  Metadata Sequence No  3

  VG Access             read/write

  VG Status             resizable

  MAX LV                0

  Cur LV                1

  Open LV               1

  Max PV                0

  Cur PV                3

  Act PV                3

  VG Size               4.33 TB

  PE Size               4.00 MB

  Total PE              1134586

  Alloc PE / Size       1134586 / 4.33 TB

  Free  PE / Size       0 / 0   

  VG UUID               hnKF8h-Infa-wKiE-KtUT-OByG-q0pe-Nd4taB


Thank you,
Randall


-- 
..:.::::
Randall Jones     GST      NASA Goddard Space Flight Center
HPC Visualization Support       http://hpcvis.gsfc.nasa.gov
Scientific Visualization Studio    http://svs.gsfc.nasa.gov
rajones@svs.gsfc.nasa.gov      Code 610.3      301-286-2239

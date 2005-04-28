Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3SGrJO01887
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 12:53:19 -0400
Received: from breemxgw3s01.ras (relay1.rasnet.it [213.156.34.249])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3SGrDce023610
	for <linux-lvm@redhat.com>; Thu, 28 Apr 2005 12:53:13 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Thu, 28 Apr 2005 18:53:12 +0200
Message-ID: <BFCF159FFD14F444B205968F32DBD5BB01700347@MAILEX01.rasgroup.ita.localnet>
From: "Magni Fabrizio" <Fabrizio.Magni@rasnet.it>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] duplicated PVs
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
To: linux-lvm@redhat.com

Hello,
recently I switched from an old SLES7 to a brand new SLES9 adding a
qlogic card.
Now my system see duplicated PVs.

I tried to follow the adive on multipath faq inserting this line 

filter = [ "r/sd.*/", "a/.*/" ]

in my /etc/lvm/lvm.conf.

No luck.

I'm still getting:

# pvscan
  Found duplicate PV gvIlwNObhtjL6LM3frAHzanQM51ChpJI: using /dev/sde1
not /dev/sdq1
  Found duplicate PV Q3mHMG3rzT0Klr6neMsWxwMXmJX5v7dC: using /dev/sdf1
not /dev/sdr1
  Found duplicate PV vrwuiYGd1oQ5wLIdYEX2YXwvbhJLZfkK: using /dev/sdg1
not /dev/sds1
  Found duplicate PV oXp36gSyE0QvLCS1PF26xpknoA0HJlkN: using /dev/sdh1
not /dev/sdt1
  Found duplicate PV 53GzwRqPmFGWtPBB3NvsvZzlVLXsQS3q: using /dev/sdi1
not /dev/sdu1
  Found duplicate PV nostyfnXrf7HiCPb5CZBUTjmmOuWXpbX: using /dev/sdj1
not /dev/sdv1
  Found duplicate PV DROdioaS5eWp3x6S0m3nOH7J7MjOTEL8: using /dev/sdk1
not /dev/sdw1
  Found duplicate PV OLHFaKOhDCTi2F4Wr7JV7GWPpQ8KINtq: using /dev/sdl1
not /dev/sdx1
  Found duplicate PV N9gwQytO9eb1jnd3SUKsGPKqbUt8xBMq: using /dev/sdm1
not /dev/sda1
  Found duplicate PV AqbigkFpgnqCypskZpW5AUdaEi0GHi6r: using /dev/sdn1
not /dev/sdb1
  Found duplicate PV t08y1Tbr3ltk5h7Gaxmf8eyG60Tv3M17: using /dev/sdo1
not /dev/sdc1
  Found duplicate PV 9lsZWyLqrb3nWSY1F8nH3MzccOUH6VsQ: using /dev/sdp1
not /dev/sdd1
  PV /dev/sdx1   VG oradata3_f   lvm2 [37.25 GB / 384.00 MB free]
  PV /dev/sdw1   VG oradata4_h   lvm2 [37.25 GB / 888.00 MB free]
  PV /dev/sdv1   VG oradata4_g   lvm2 [37.25 GB / 384.00 MB free]
  PV /dev/sdu1   VG oradata8_r   lvm2 [37.25 GB / 2.06 GB free]
  PV /dev/sdt1   VG oradata2_d   lvm2 [37.25 GB / 192.00 MB free]
  PV /dev/sdd1   VG oradata6_l   lvm2 [37.25 GB / 2.06 GB free]
  PV /dev/sds1   VG oradata3_e   lvm2 [37.25 GB / 88.00 MB free]
  PV /dev/sdc1   VG oradata1_a   lvm2 [37.25 GB / 188.00 MB free]
  PV /dev/sdr1   VG oradata2_c   lvm2 [37.25 GB / 284.00 MB free]
  PV /dev/sdb1   VG oradata5_i   lvm2 [37.25 GB / 2.06 GB free]
  PV /dev/sdq1   VG oradata1_b   lvm2 [37.25 GB / 88.00 MB free]
  PV /dev/sda1   VG oradata5_j   lvm2 [37.25 GB / 2.06 GB free]
  Total: 12 [447.00 GB] / in use: 12 [447.00 GB] / in no VG: 0 [0   ]


Any idea?

Many thanks
Fabrizio

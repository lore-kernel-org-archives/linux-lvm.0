Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2JMQAj22857
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 17:26:10 -0500
Received: from webmail-outgoing.us4.outblaze.com
	(webmail-outgoing.us4.outblaze.com [205.158.62.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2JMQ8WA006509
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 17:26:08 -0500
Received: from wfilter.us4.outblaze.com (wfilter.us4.outblaze.com
	[205.158.62.180])
	by webmail-outgoing.us4.outblaze.com (Postfix) with QMQP id
	382D618015B5
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 22:26:02 +0000 (GMT)
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: "chris laycock" <the.brain@mad.scientist.com>
Date: Fri, 19 Mar 2004 17:25:58 -0500
Message-Id: <20040319222558.DB43D22E1D@ws1-10.us4.outblaze.com>
Subject: [linux-lvm] Lost 2 disks in a hour
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

Looking for some advice.

Lost 2 disks from a Redhat 9 system, 1 from a 3 disk VG, no stripping and the other the system disk. 
I've rebuilt the system and I now want to recover the surviving 2 disks.

A pvscan gives the following result:

pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sda1"  is associated to unknown VG "datavg" (run vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to unknown VG "datavg" (run vgscan)
pvscan -- total: 2 [45.75 GB] / in use: 2 [45.75 GB] / in no VG: 0 [0]

and vgscan:

vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "datavg" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

I realise that I need to re-create the datavg but having lost the root partition I am unsure how to go about it without loosing any more data......

Thanks in advance

Regards,

Chris.

-- 
___________________________________________________________
Sign-up for Ads Free at Mail.com
http://promo.mail.com/adsfreejump.htm

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1IG7Gi09070
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 11:07:16 -0500
Received: from mail.gmx.net (pop.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1IG7Fb03666
	for <linux-lvm@redhat.com>; Wed, 18 Feb 2004 11:07:15 -0500
From: "Stefan Jenkner" <jenkner@gmx.de>
MIME-Version: 1.0
Message-ID: <15173.1077120428@www19.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Lost free PV  -> error reading VG
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 18 11:07:23 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

Hi Folks!

I had a vg "debian" with the pvs /dev/hda2 /dev/hda3 /dev/hda4
I wanted to remove /dev/hda4, so i did:  pvmove -v /dev/hda4 
Everything went well, so I removed /dev/hda4, but _without_ the use of:
vgreduce debian /dev/hda4 :-( 
I also did: pvcreate /dev/hda4 , so /dev/hda4 seems to be an empty pv, and
it does not know that it belongs
to the vg "debian".

And now, I get:

root@ttyp0[root]# vgscan 
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of
volume group "debian" from physical volume(s)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

root@ttyp0[root]# pvscan 
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda2"  is associated to unknown VG "debian" (run
vgscan)
pvscan -- inactive PV "/dev/hda3"  is associated to unknown VG "debian" (run
vgscan)
pvscan -- inactive PV "/dev/hda4" is in no VG  [23.85 GB]
pvscan -- total: 3 [57.24 GB] / in use: 2 [33.38 GB] / in no VG: 1 [23.85
GB]

How can I recover my vg? There are no backups :-(
How can I tell the vg "debian" to do not use: the empty pv /dev/hda4?
Or, how can I tell /dev/hda4 that it belongs to the vg "debian"?
There is no lvmconf too :-(

What additional information do you need to be able to help me?

Thanks
 Stefan

-- 
GMX ProMail (250 MB Mailbox, 50 FreeSMS, Virenschutz, 2,99 EUR/Monat...)
jetzt 3 Monate GRATIS + 3x DER SPIEGEL +++ http://www.gmx.net/derspiegel +++

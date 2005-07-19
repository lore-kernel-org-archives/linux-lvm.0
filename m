Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6J8SiV06925
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 04:28:44 -0400
Received: from relais-inet.francetelecom.com (relais-inet.francetelecom.com
	[212.234.67.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6J8Sa0R007263
	for <linux-lvm@redhat.com>; Tue, 19 Jul 2005 04:28:37 -0400
Received: from prive-Rline3.com ([192.168.1.32] [192.168.1.32]) by
	Rline3.francetelecom.com with ESMTP for linux-lvm@redhat.com;
	Tue, 19 Jul 2005 10:28:27 +0200
Received: from smtp2.smtpft.francetelecom.fr ([193.249.133.11]
	[193.249.133.11]) by Rline3.francetelecom.com with ESMTP for
	linux-lvm@redhat.com; Tue, 19 Jul 2005 10:28:27 +0200
Received: from [10.179.105.158] ([10.179.105.158]) by
	smtp2.smtpft.francetelecom.fr (Netscape Messaging Server 4.15)
	with ESMTP id IJV8VE00.XFZ for <linux-lvm@redhat.com>; Tue, 19
	Jul 2005 10:28:26 +0200 
Message-Id: <42DCB9A9.4050404@francetelecom.com>
Date: Tue, 19 Jul 2005 10:28:25 +0200
From: "GARIN N Ext ROSI/SIPROD" <ngarin.ext@francetelecom.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm lost after reboot !? how to recover UUID?
References: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
In-Reply-To: <E53A3797-0C45-494C-BFC3-852900BBE149@kitchhiking.org>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

kitchhiking.org a =EF=BF=BDcrit :

> Hi,
>
> I'm using LVM only for about a month now and it ran flawless until =20
> today.
>
> After rebooting the system all my PVs/VGs/LVs were gone, "mount" saying
> e.g.:
>
> > mount: /dev/WD2000JB-182GB/srv is not a valid block device
>
> /etc/lvmtab now is an empty file, /etc/lvmtab.d, /etc/lvm/backup and
> /etc/lvm/archive are empty as well.
>
> This is strange because etc/lvm/lvm.conf says that backups and archives
> should be created but i can't find anything.
>
> What remains are some files in /etc/lvmconf named =20
> "WD2000JB-182GB.conf" and
> "IBM80G2.conf" and some older versions of those.
>
> I read on the web *) about recovering the data using pvcreate/=20
> vgcfgrestore,
> but since "/etc/lvm/backup" and "/etc/lvm/archive" are empty I don't =20
> know
> how to retrieve the UUIDs of my PVs.
> *) http://codeworks.gnomedia.com/archives/2005/general/lvm_recovery/
>
> Of course I don't have any further backup of these, since I first =20
> read about their
> importance doing that when digging for hints howto recover my data.
>
> (stupid me (tm))
>
> The System is running Debian Sarge stable (2.4.27-2) on a
> P3/Intel BX with 3 harddrives attached to it. LVM is Version 1.08
>
> from /etc/fstab:
>
> #lvm
> /dev/WD2000JB-182GB/mld  /home/mld       auto  =20
> suid,dev,exec              0 0
> /dev/WD2000JB-182GB/srv  /srv/foo        auto  =20
> suid,noexec,nodev          0 0
> /dev/IBM80G2/costa_home  /home/costa     auto  =20
> suid,noexec,nodev          0 0
>
> where:
>
> /dev/WD2000JB-182GB/ is situated on /dev/hda (a 200GB Harddisk)
> /dev/IBM80G2/costa_home sits on /dev/hde (an 80GB Harddisk attached =20
> to an onboard
>                                           HPT366 ATA66 Controller)
>
> pvdisplay /dev/WD2000JB-182GB says:
>
> > cserver:/etc/lvm# pvdisplay /dev/hde
> > pvdisplay -- ERROR "pv_read(): pv_create_name_from_kdev_t" no  VALID=20
> physical volume "/dev/hde"
>
> vgdisplay just returns:
>
> > cserver:/etc/lvm# vgdisplay
> > vgdisplay -- no volume groups found
>
> If any of you has a clou how i could recover my data (or just the =20
> UUIDs) or
> maybe rebuild the LVM I'd be really grateful.
>
> Hope to hear from you,
> Constantin
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
Hi,

To retrieve the UUIDs of your PVs :

[root@pn root]# pvscan -u
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdas" with UUID=20
"02MxKG-wGQT-FpaX-kj1j-aIGi-NXPM-7t38Bt" of VG "datavg" [33.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdat" with UUID=20
"BRRj5q-taYQ-hz5c-Hull-1vlX-PeGQ-lngHG0" of VG "datavg" [33.66 GB / 864=20
MB free]
pvscan -- ACTIVE   PV "/dev/sda2" with UUID=20
"EIfzic-F5XB-yqYr-5wY7-lGSQ-gglM-6KsmF3" of VG "rootvg" [33.60 GB / 9.89=20
GB free]
pvscan -- ACTIVE   PV "/dev/sdb " with UUID=20
"mhVisK-IgAk-F6m3-RDjG-TJ1T-cH6S-tmeDPs" of VG "datavg" [33.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdc " with UUID=20
"Xe03YQ-6gTw-M7DA-0ODR-sfXT-Ti1v-527o1W" of VG "datavg" [33.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdd " with UUID=20
"tL0Ew7-OcSB-2mbD-r0yH-MRvY-7DSM-MDzzRv" of VG "datavg" [33.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sde " with UUID=20
"QNEj7S-r445-xZd3-WVyP-EFU9-WEQS-FnIx38" of VG "datavg" [33.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdf " with UUID=20
"OUL3A2-h1EM-v8w8-Y2UN-vii8-79Qo-7hloOj" of VG "datavg" [33.66 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/sdg " with UUID=20
"4ryusb-84Et-22md-QwaQ-Jk3w-iXVB-r5p4gj" of VG "datavg" [33.66 GB / 0 free]

or
[root@pn root]# pvscan -u | sed -e 's/["|-]//g'
pvscan  ACTIVE   PV /dev/sdas with UUID 02MxKGwGQTFpaXkj1jaIGiNXPM7t38Bt=20
of VG datavg [33.66 GB / 0 free]
pvscan  ACTIVE   PV /dev/sdat with UUID BRRj5qtaYQhz5cHull1vlXPeGQlngHG0=20
of VG datavg [33.66 GB / 864 MB free]
pvscan  ACTIVE   PV /dev/sda2 with UUID EIfzicF5XByqYr5wY7lGSQgglM6KsmF3=20
of VG rootvg [33.60 GB / 9.89 GB free]
pvscan  ACTIVE   PV /dev/sdb  with UUID mhVisKIgAkF6m3RDjGTJ1TcH6StmeDPs=20
of VG datavg [33.66 GB / 0 free]
pvscan  ACTIVE   PV /dev/sdc  with UUID Xe03YQ6gTwM7DA0ODRsfXTTi1v527o1W=20
of VG datavg [33.66 GB / 0 free]
pvscan  ACTIVE   PV /dev/sdd  with UUID tL0Ew7OcSB2mbDr0yHMRvY7DSMMDzzRv=20
of VG datavg [33.66 GB / 0 free]
pvscan  ACTIVE   PV /dev/sde  with UUID QNEj7Sr445xZd3WVyPEFU9WEQSFnIx38=20
of VG datavg [33.66 GB / 0 free]
pvscan  ACTIVE   PV /dev/sdf  with UUID OUL3A2h1EMv8w8Y2UNvii879Qo7hloOj=20
of VG datavg [33.66 GB / 0 free]
pvscan  ACTIVE   PV /dev/sdg  with UUID 4ryusb84Et22mdQwaQJk3wiXVBr5p4gj=20
of VG datavg [33.66 GB / 0 free]

And compare UUID with the backup files. Backup files are in binary=20
format but you can find some informations with the command strings :

[root@pn root]# strings  /etc/lvmconf/datavg.conf
datavg
3W      pFW     PYW     0lW
gnVb174BNhliAYzpfTck3Tia2F6WA5w4
/dev/sdb
datavg
pndracap1119470784
mhVisKIgAkF6m3RDjGTJ1TcH6StmeDPs
/dev/sdc
datavg
pndracap1119471248
Xe03YQ6gTwM7DA0ODRsfXTTi1v527o1W
/dev/sdd
datavg
pndracap1119471272
tL0Ew7OcSB2mbDr0yHMRvY7DSMMDzzRv
/dev/sde
datavg
pndracap1119471281
QNEj7Sr445xZd3WVyPEFU9WEQSFnIx38
/dev/sdf
datavg
pndracap1119471287
xHW
OUL3A2h1EMv8w8Y2UNvii879Qo7hloOj
/dev/sdg
datavg
pndracap1119471296
X[W
4ryusb84Et22mdQwaQJk3wiXVBr5p4gj
/dev/sdas
datavg
pndracap1120640174
8nW
02MxKGwGQTFpaXkj1jaIGiNXPM7t38Bt
/dev/sdat
datavg
pndracap1120640188
BRRj5qtaYQhz5cHull1vlXPeGQlngHG0
/dev/datavg/lv_data
datavg


You can change UUIDs in the backup file like this example :
[root@pn root]# cat /etc/lvmconf/datavg.conf | \
sed -e=20
"s/mhVisKIgAkF6m3RDjGTJ1TcH6StmeDPs/YJVxbrHC4WXnpqFKBHB0Cio2Ig2P1kaL/g" | \
sed -e=20
"s/Xe03YQ6gTwM7DA0ODRsfXTTi1v527o1W/t6xBPE3iiuspQbCRdV7wKoQDizuhDOUH/g" | \
sed -e=20
"s/tL0Ew7OcSB2mbDr0yHMRvY7DSMMDzzRv/WmD7qbnNUihw42CuS7a6aGRfHFHlDLEr/g" | \
sed -e=20
"s/QNEj7Sr445xZd3WVyPEFU9WEQSFnIx38/pfHJyx4MsvR2T365GYBDRySBcks5HUyP/g" | \
sed -e=20
"s/OUL3A2h1EMv8w8Y2UNvii879Qo7hloOj/Bi7y8xCxoYcTsU0cvGwd8EOpLDT5ywZL/g" | \
sed -e=20
"s/4ryusb84Et22mdQwaQJk3wiXVBr5p4gj/jGgc15WsZ6Q34r1cQdxE3bLIg60qdFmR/g"   \
 > /tmp/datavgbcv.conf


And restore all disk :
[root@pn root]# vgcfgrestore -f /tmp/datavgbcv.conf -n datavgbcv -o=20
/dev/sdaw /dev/sdbc
[root@pn root]# vgcfgrestore -f /tmp/datavgbcv.conf -n datavgbcv -o=20
/dev/sdax /dev/sdbd
[root@pn root]# vgcfgrestore -f /tmp/datavgbcv.conf -n datavgbcv -o=20
/dev/sday /dev/sdbe
[root@pn root]# vgcfgrestore -f /tmp/datavgbcv.conf -n datavgbcv -o=20
/dev/sdaz /dev/sdbf
[root@pn root]# vgcfgrestore -f /tmp/datavgbcv.conf -n datavgbcv -o=20
/dev/sdaa /dev/sdbg
[root@pn root]# vgcfgrestore -f /tmp/datavgbcv.conf -n datavgbcv -o=20
/dev/sdab /dev/sdbh


=20
regards

Nicolas GARIN.

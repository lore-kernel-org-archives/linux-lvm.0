Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAP9Q4V12411
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 04:26:04 -0500
Received: from dgate2a.fujitsu-siemens.com (dgate2a.fujitsu-siemens.com
	[217.115.66.122])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAP9Q1I5024751
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 04:26:02 -0500
Received: from pdbzex0e.pdb.fsc.net (pdbzex0e.pdb.fsc.net [172.25.96.69])
	by plim.pdb.fsc.net (8.12.6/8.12.6/SuSE Linux 0.6) with ESMTP id
	jAP9PrT2024991
	for <linux-lvm@redhat.com>; Fri, 25 Nov 2005 10:25:53 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5F1A2.3B3FDE36"
Date: Fri, 25 Nov 2005 10:25:01 +0100
Message-ID: <ADC8F7AA316AF74EBEC87590CCDA6162069CB7E6@PDBEX02E.pdb.fsc.net>
From: "Laurenz, Dirk" <Dirk.Laurenz@fujitsu-siemens.com>
Subject: [linux-lvm] URGENT: vgchange -an doesn't work on any vg!
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
To: linux-lvm@redhat.com
Cc: "Lutz, Mathias" <Mathias.Lutz@fujitsu-siemens.com>, "Ehlerding,
	Diedrich" <Diedrich.Ehlerding@fujitsu-siemens.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C5F1A2.3B3FDE36
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
=20
i've the following problem on a suse sles 9.
after about one night of using lvm on a cluster or single node
and issuing randomly pvscan,lvscan,vgscan commands a deactivation
of a vg isn't possible anymore.
=20
lvm is running on top of a dm-multipath.
=20
Here're the versions:
   hges3301:~ # rpm -qa | egrep 'lvm|device-mapper|kernel-bigsmp'
   lvm2-2.00.33-1.3
   device-mapper-1.01.01-1.2
   kernel-bigsmp-2.6.5-7.201
=20
Nothing is mounted
hges3301:~ # cat /proc/mounts | grep vgAGES009
hges3301:~ #

Here's the vgchange output:
        Processing: vgchange -vvvan vgAGES009
        O_DIRECT will be used
      Setting global/locking_type to 1
      Setting global/locking_dir to /var/lock/lvm
      File-based locking enabled.
    Using volume group(s) on command line
      Locking /var/lock/lvm/V_vgAGES009 RB
    Finding volume group "vgAGES009"
        Opened /dev/sda1 RO
        /dev/sda1: block size is 1024 bytes
      /dev/sda1: No label detected
        Opened /dev/sda5 RO
        /dev/sda5: block size is 4096 bytes
      /dev/sda5: No label detected
        Opened /dev/sda6 RO
        /dev/sda6: block size is 4096 bytes
      /dev/sda6: No label detected
        Opened /dev/sda7 RO
        /dev/sda7: block size is 4096 bytes
      /dev/sda7: No label detected
        Opened /dev/sda8 RO
        /dev/sda8: block size is 2048 bytes
      /dev/sda8: lvm2 label detected
        Opened /dev/dm-8 RO
        /dev/dm-8: block size is 4096 bytes
      /dev/dm-8: No label detected
        Opened /dev/sda9 RO
        /dev/sda9: block size is 512 bytes
      /dev/sda9: lvm2 label detected
        Opened /dev/dm-9 RO
        /dev/dm-9: block size is 4096 bytes
      /dev/dm-9: No label detected
        Opened /dev/dm-10 RO
        /dev/dm-10: block size is 4096 bytes
      /dev/dm-10: No label detected
        Opened /dev/dm-11 RO
        /dev/dm-11: block size is 4096 bytes
      /dev/dm-11: No label detected
        Opened /dev/dm-12 RO
        /dev/dm-12: block size is 4096 bytes
      /dev/dm-12: No label detected
        Opened /dev/dm-13 RO
        /dev/dm-13: block size is 4096 bytes
      /dev/dm-13: No label detected
        Opened /dev/dm-14 RO
        /dev/dm-14: block size is 4096 bytes
      /dev/dm-14: No label detected
        Opened /dev/dm-15 RO
        /dev/dm-15: block size is 4096 bytes
      /dev/dm-15: No label detected
        Opened /dev/dm-16 RO
        /dev/dm-16: block size is 4096 bytes
      /dev/dm-16: No label detected
        Opened /dev/dm-17 RO
        /dev/dm-17: block size is 4096 bytes
      /dev/dm-17: No label detected
        Opened /dev/dm-18 RO
        /dev/dm-18: block size is 4096 bytes
      /dev/dm-18: No label detected
        Opened /dev/dm-19 RO
        /dev/dm-19: block size is 4096 bytes
      /dev/dm-19: No label detected
        Opened /dev/dm-20 RO
        /dev/dm-20: block size is 4096 bytes
      /dev/dm-20: No label detected
        Opened /dev/sdb5 RO
        /dev/sdb5: block size is 4096 bytes
      /dev/sdb5: No label detected
        Opened /dev/dm-21 RO
        /dev/dm-21: block size is 4096 bytes
      /dev/dm-21: lvm2 label detected
        Opened /dev/sdb6 RO
        /dev/sdb6: block size is 4096 bytes
      /dev/sdb6: No label detected
        Opened /dev/dm-22 RO
        /dev/dm-22: block size is 4096 bytes
      /dev/dm-22: lvm2 label detected
        Opened /dev/sdb7 RO
        /dev/sdb7: block size is 4096 bytes
      /dev/sdb7: No label detected
        Opened /dev/dm-23 RO
        /dev/dm-23: block size is 4096 bytes
      /dev/dm-23: lvm2 label detected
        Opened /dev/sdb8 RO
        /dev/sdb8: block size is 4096 bytes
      /dev/sdb8: No label detected
        Opened /dev/dm-24 RO
        /dev/dm-24: block size is 4096 bytes
      /dev/dm-24: lvm2 label detected
        Opened /dev/dm-25 RO
        /dev/dm-25: block size is 4096 bytes
      /dev/dm-25: lvm2 label detected
        Opened /dev/dm-26 RO
        /dev/dm-26: block size is 4096 bytes
      /dev/dm-26: lvm2 label detected
        Opened /dev/dm-27 RO
        /dev/dm-27: block size is 4096 bytes
      /dev/dm-27: lvm2 label detected
        Opened /dev/dm-28 RO
        /dev/dm-28: block size is 4096 bytes
      /dev/dm-28: lvm2 label detected
        Opened /dev/dm-29 RO
        /dev/dm-29: block size is 4096 bytes
      /dev/dm-29: lvm2 label detected
        Opened /dev/dm-30 RO
        /dev/dm-30: block size is 4096 bytes
      /dev/dm-30: lvm2 label detected
        Opened /dev/dm-31 RO
        /dev/dm-31: block size is 4096 bytes
      /dev/dm-31: lvm2 label detected
        Opened /dev/dm-32 RO
        /dev/dm-32: block size is 4096 bytes
      /dev/dm-32: lvm2 label detected
        Opened /dev/dm-33 RO
        /dev/dm-33: block size is 4096 bytes
      /dev/dm-33: lvm2 label detected
        Opened /dev/dm-34 RO
        /dev/dm-34: block size is 4096 bytes
      /dev/dm-34: No label detected
        Opened /dev/dm-35 RO
        /dev/dm-35: block size is 512 bytes
      /dev/dm-35: No label detected
        Opened /dev/dm-36 RO
        /dev/dm-36: block size is 4096 bytes
      /dev/dm-36: No label detected
        Opened /dev/dm-37 RO
        /dev/dm-37: block size is 512 bytes
      /dev/dm-37: No label detected
        Opened /dev/dm-38 RO
        /dev/dm-38: block size is 512 bytes
      /dev/dm-38: No label detected
        Opened /dev/dm-39 RO
        /dev/dm-39: block size is 512 bytes
      /dev/dm-39: No label detected
        Opened /dev/dm-40 RO
        /dev/dm-40: block size is 4096 bytes
      /dev/dm-40: No label detected
        Opened /dev/dm-41 RO
        /dev/dm-41: block size is 4096 bytes
      /dev/dm-41: No label detected
        Opened /dev/dm-42 RO
        /dev/dm-42: block size is 4096 bytes
      /dev/dm-42: No label detected
      /dev/dm-23: lvm2 label detected
        Read vgAGES009 metadata (4) from /dev/dm-23 at 5632 size 842
      Setting activation/missing_stripe_filler to /dev/ioerror
        Getting device info for vgAGES009-lvsambaconf
        dm version   O
        dm info  =
4R42axbS0S8Q58kuWy7WblAGvltm6aZpsFNEKeFEuDBgWcxMfGE0rmMaWqpFIKWS O
  Can't deactivate volume group "vgAGES009" with 1 open logical =
volume(s)
      Unlocking /var/lock/lvm/V_vgAGES009
        Closed /dev/sda1
        Closed /dev/sda5
        Closed /dev/sda6
        Closed /dev/sda7
        Closed /dev/sda8
        Closed /dev/dm-8
        Closed /dev/sda9
        Closed /dev/dm-9
        Closed /dev/dm-10
        Closed /dev/dm-11
        Closed /dev/dm-12
        Closed /dev/dm-13
        Closed /dev/dm-14
        Closed /dev/dm-15
        Closed /dev/dm-16
        Closed /dev/dm-17
        Closed /dev/dm-18
        Closed /dev/dm-19
        Closed /dev/dm-20
        Closed /dev/sdb5
        Closed /dev/dm-21
        Closed /dev/sdb6
        Closed /dev/dm-22
        Closed /dev/sdb7
        Closed /dev/dm-23
        Closed /dev/sdb8
        Closed /dev/dm-24
        Closed /dev/dm-25
        Closed /dev/dm-26
        Closed /dev/dm-27
        Closed /dev/dm-28
        Closed /dev/dm-29
        Closed /dev/dm-30
        Closed /dev/dm-31
        Closed /dev/dm-32
        Closed /dev/dm-33
        Closed /dev/dm-34
        Closed /dev/dm-35
        Closed /dev/dm-36
        Closed /dev/dm-37
        Closed /dev/dm-38
        Closed /dev/dm-39
        Closed /dev/dm-40
        Closed /dev/dm-41
        Closed /dev/dm-42



=20
=20
hges3301:~ # cat /etc/multipath.conf
#
# name  : defaults
# desc  : multipath-tools default settings
#
defaults {
        polling_interval 30
}
multipaths {
#       multipath {
#                wwid                    =
360060160ede91000bf97f0818590d911
#                alias                   ages001_1
#       }
#       multipath {
#                wwid                    =
360060160ede910000deb39888590d911
#                alias                   ages002_1
#       }
#        multipath {
#                wwid                    =
360060160ede91000c997f0818590d911
#                alias                   ages003_1
#        }
#       multipath {
#                wwid                    =
360060160ede91000ca97f0818590d911
#                alias                   ages004_1
#        }
       multipath {
                wwid                    =
360060160ede91000be97f0818590d911
                alias                   ages005_1
        }
        multipath {
                wwid                    =
360060160ede910000ceb39888590d911
                alias                   ages006_1
        }
        multipath {
                wwid                    =
360060160ede91000edc40b068590d911
                alias                   ages007_1
        }
        multipath {
                wwid                    =
360060160ede91000c897f0818590d911
                alias                   ages008_1
        }
        multipath {
                wwid                    =
360060160ede91000ecc40b068590d911
                alias                   ages009_1
        }
         multipath {
                wwid                    =
360060160ede91000c797f0818590d911
                alias                   ages010_1
        }
        multipath {
                wwid                    =
360060160ede91000c697f0818590d911
                alias                   ages011_1
        }
}

=20
=20
=20
Mit freundlichem Gru=DF,=20


Dirk Laurenz=20
Systems Engineer       =20
PSO - Professional Service Organisation=20
Fujitsu Siemens Computers=20
Hildesheimer Strasse 25=20
30880 Laatzen=20
Germany=20
Telephone:      +49 (511) 84 89 - 18 08=20
Telefax:        +49 (511) 84 89 - 25 18 08=20
Mobile: +49 (170) 22 10 781=20
Email:  mailto:dirk.laurenz@fujitsu-siemens.com =
<mailto:dirk.laurenz@fujitsu-siemens.com> =20
Internet:       http://www.fujitsu-siemens.com=20
            =
http://www.fujitsu-siemens.de/rl/servicesupport/itdienstleistungen/compet=
encecenter.html=20
*************************************************************************=
******************************************=20
=20
Mit freundlichem Gru=DF,=20


Dirk Laurenz=20
Systems Engineer       =20
PSO - Professional Service Organisation=20
Fujitsu Siemens Computers=20
Hildesheimer Strasse 25=20
30880 Laatzen=20
Germany=20
Telephone:      +49 (511) 84 89 - 18 08=20
Telefax:        +49 (511) 84 89 - 25 18 08=20
Mobile: +49 (170) 22 10 781=20
Email:  mailto:dirk.laurenz@fujitsu-siemens.com=20
Internet:       http://www.fujitsu-siemens.com=20
            =
http://www.fujitsu-siemens.de/rl/servicesupport/itdienstleistungen/compet=
encecenter.html=20
*************************************************************************=
******************************************=20

------_=_NextPart_001_01C5F1A2.3B3FDE36
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><HTML =
DIR=3Dltr><HEAD><META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1"></HEAD><BODY>=0A=
<DIV id=3DidOWAReplyText81256 dir=3Dltr>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" color=3D#000000 size=3D2>=0A=
<DIV id=3DidOWAReplyText81899 dir=3Dltr>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" color=3D#000000 =
size=3D2>Hello,</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>i've the following =
problem on a =0A=
suse sles 9.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>after about one night =
of using lvm =0A=
on a cluster or single node</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>and issuing randomly =0A=
pvscan,lvscan,vgscan commands a deactivation</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>of a vg isn't =
possible =0A=
anymore.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>lvm is running on top =
of a =0A=
dm-multipath.</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>Here're the =
versions:</FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>&nbsp;&nbsp; =
hges3301:~ # rpm -qa | =0A=
egrep 'lvm|device-mapper|kernel-bigsmp'<BR>&nbsp;&nbsp; =0A=
lvm2-2.00.33-1.3<BR>&nbsp;&nbsp; =
device-mapper-1.01.01-1.2<BR>&nbsp;&nbsp; =0A=
kernel-bigsmp-2.6.5-7.201</FONT></DIV><FONT face=3D"Courier New" =0A=
size=3D2></FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>=0A=
<DIV dir=3Dltr>&nbsp;</DIV>=0A=
<DIV dir=3Dltr>Nothing is mounted</DIV>=0A=
<DIV dir=3Dltr>hges3301:~ # cat /proc/mounts | grep =
vgAGES009<BR>hges3301:~ =0A=
#<BR></DIV>=0A=
<DIV dir=3Dltr>Here's the vgchange output:</DIV>=0A=
<DIV dir=3Dltr>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Processing: =
vgchange =0A=
-vvvan vgAGES009<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; O_DIRECT =
will be =0A=
used<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_type to =0A=
1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Setting global/locking_dir to =0A=
/var/lock/lvm<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; File-based locking =0A=
enabled.<BR>&nbsp;&nbsp;&nbsp; Using volume group(s) on command =0A=
line<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Locking /var/lock/lvm/V_vgAGES009 =0A=
RB<BR>&nbsp;&nbsp;&nbsp; Finding volume group =0A=
"vgAGES009"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened =
/dev/sda1 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda1: block size =
is 1024 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda1: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sda5 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda5: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda5: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sda6 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda6: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda6: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sda7 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda7: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda7: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sda8 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda8: block size =
is 2048 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda8: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-8 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-8: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-8: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sda9 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda9: block size =
is 512 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda9: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-9 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-9: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-9: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-10 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-10: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-10: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-11 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-11: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-11: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-12 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-12: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-12: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-13 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-13: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-13: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-14 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-14: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-14: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-15 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-15: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-15: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-16 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-16: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-16: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-17 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-17: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-17: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-18 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-18: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-18: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-19 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-19: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-19: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-20 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-20: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-20: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sdb5 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb5: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb5: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-21 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-21: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-21: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sdb6 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb6: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb6: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-22 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-22: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-22: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sdb7 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb7: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb7: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-23 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-23: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-23: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/sdb8 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb8: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sdb8: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-24 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-24: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-24: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-25 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-25: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-25: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-26 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-26: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-26: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-27 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-27: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-27: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-28 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-28: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-28: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-29 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-29: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-29: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-30 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-30: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-30: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-31 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-31: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-31: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-32 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-32: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-32: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-33 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-33: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-33: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-34 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-34: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-34: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-35 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-35: block size =
is 512 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-35: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-36 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-36: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-36: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-37 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-37: block size =
is 512 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-37: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-38 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-38: block size =
is 512 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-38: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-39 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-39: block size =
is 512 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-39: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-40 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-40: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-40: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-41 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-41: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-41: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Opened /dev/dm-42 =0A=
RO<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-42: block size =
is 4096 =0A=
bytes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-42: No label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/dm-23: lvm2 label =0A=
detected<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Read vgAGES009 =
metadata =0A=
(4) from /dev/dm-23 at 5632 size 842<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Setting =0A=
activation/missing_stripe_filler to =0A=
/dev/ioerror<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Getting =
device info =0A=
for vgAGES009-lvsambaconf<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
dm =0A=
version&nbsp;&nbsp; O<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dm =0A=
info&nbsp; =
4R42axbS0S8Q58kuWy7WblAGvltm6aZpsFNEKeFEuDBgWcxMfGE0rmMaWqpFIKWS =0A=
O<BR>&nbsp; Can't deactivate volume group "vgAGES009" with 1 open =
logical =0A=
volume(s)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Unlocking =0A=
/var/lock/lvm/V_vgAGES009<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
Closed =0A=
/dev/sda1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sda5<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sda6<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sda7<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sda8<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-8<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sda9<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-9<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-10<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-11<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-12<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-13<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-14<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-15<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-16<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-17<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-18<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-19<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-20<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sdb5<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-21<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sdb6<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-22<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sdb7<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-23<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/sdb8<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-24<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-25<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-26<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-27<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-28<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-29<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-30<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-31<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-32<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-33<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-34<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-35<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-36<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-37<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-38<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-39<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-40<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-41<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Closed =0A=
/dev/dm-42<BR><BR></DIV>=0A=
<DIV dir=3Dltr><BR>&nbsp;</DIV></FONT>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2>hges3301:~ # cat =0A=
/etc/multipath.conf<BR>#<BR># name&nbsp; : defaults<BR># desc&nbsp; : =0A=
multipath-tools default settings<BR>#<BR>defaults =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; polling_interval =0A=
30<BR>}<BR>multipaths {<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
multipath =0A=
{<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000bf97f0818590d911<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages001_1<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede910000deb39888590d911<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages002_1<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000c997f0818590d911<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages003_1<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000ca97f0818590d911<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages004_1<BR>#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000be97f0818590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages005_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede910000ceb39888590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages006_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000edc40b068590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages007_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000c897f0818590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages008_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000ecc40b068590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages009_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000c797f0818590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages010_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
}<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; multipath =0A=
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; =0A=
wwid&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
360060160ede91000c697f0818590d911<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
alias&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
ages011_1<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
}<BR>}<BR></FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" size=3D2></FONT>&nbsp;</DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" color=3D#000000 =0A=
size=3D2></FONT>&nbsp;</DIV></DIV>=0A=
<DIV id=3DidSignature67443 dir=3Dltr>=0A=
<DIV><FONT color=3D#000000>=0A=
<DIV><FONT face=3D"Courier New" size=3D2>Mit freundlichem Gru=DF, =0A=
</FONT></DIV><BR><BR>=0A=
<DIV><FONT face=3D"Courier New" size=3D2>Dirk Laurenz <BR>Systems =0A=
Engineer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <BR>PSO - =
Professional =0A=
Service Organisation <BR>Fujitsu Siemens Computers <BR>Hildesheimer =
Strasse 25 =0A=
<BR>30880 Laatzen <BR>Germany </FONT></DIV>=0A=
<DIV><FONT face=3D"Courier New" =
size=3D2>Telephone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
+49 (511) 84 89 - 18 08 =
<BR>Telefax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
+49 (511) 84 89 - 25 18 08 <BR>Mobile: +49 (170) 22 10 781 =
<BR>Email:&nbsp; =0A=
</FONT><A href=3D"mailto:dirk.laurenz@fujitsu-siemens.com" =
target=3D_blank><FONT =0A=
face=3D"Courier New" =0A=
size=3D2>mailto:dirk.laurenz@fujitsu-siemens.com</FONT></A><FONT =0A=
face=3D"Courier New" size=3D2> =
<BR>Internet:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
</FONT><A =0A=
href=3D"/https/0/webmail.pdb.fsc.net/exchweb/bin/redir.asp?URL=3Dhttp://w=
ww.fujitsu-siemens.com" =0A=
target=3D_blank><FONT face=3D"Courier New" =0A=
size=3D2>http://www.fujitsu-siemens.com</FONT></A><FONT face=3D"Courier =
New" size=3D2> =0A=
<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT><A =0A=
href=3D"/https/0/webmail.pdb.fsc.net/exchweb/bin/redir.asp?URL=3Dhttp://w=
ww.fujitsu-siemens.de/rl/servicesupport/itdienstleistungen/competencecent=
er.html" =0A=
target=3D_blank><FONT face=3D"Courier New" =0A=
size=3D2>http://www.fujitsu-siemens.de/rl/servicesupport/itdienstleistung=
en/competencecenter.html</FONT></A><FONT =0A=
face=3D"Courier New" size=3D2> =0A=
<BR>*********************************************************************=
********************************************** =0A=
</FONT></DIV></FONT></DIV></DIV></FONT></DIV>=0A=
<DIV dir=3Dltr><FONT face=3D"Courier New" color=3D#000000 =0A=
size=3D2></FONT>&nbsp;</DIV></DIV>=0A=
<DIV id=3DidSignature15600 dir=3Dltr>=0A=
<DIV><FONT color=3D#000000 size=3D2>=0A=
<DIV><FONT face=3D"Courier New"><FONT size=3D2>Mit freundlichem =
Gru=DF,</FONT> =0A=
</FONT></DIV><BR><BR>=0A=
<DIV><FONT face=3D"Courier New"><FONT size=3D2>Dirk Laurenz</FONT> =
<BR><FONT =0A=
size=3D2>Systems Engineer&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =0A=
</FONT><BR><FONT size=3D2>PSO - Professional Service Organisation</FONT> =
<BR><FONT =0A=
size=3D2>Fujitsu Siemens Computers</FONT> <BR><FONT =
size=3D2>Hildesheimer Strasse =0A=
25</FONT> <BR><FONT size=3D2>30880 Laatzen</FONT> <BR><FONT =
size=3D2>Germany</FONT> =0A=
</FONT></DIV>=0A=
<DIV><FONT face=3D"Courier New"><FONT =0A=
size=3D2>Telephone:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; +49 (511) 84 89 - 18 =
08</FONT> =0A=
<BR><FONT size=3D2>Telefax:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
+49 (511) 84 =0A=
89 - 25 18 08</FONT> <BR><FONT size=3D2>Mobile: +49 (170) 22 10 =
781</FONT> =0A=
<BR><FONT size=3D2>Email:&nbsp; <A =
href=3D"mailto:dirk.laurenz@fujitsu-siemens.com" =0A=
target=3D_blank>mailto:dirk.laurenz@fujitsu-siemens.com</A></FONT> =
<BR><FONT =0A=
size=3D2>Internet:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <A =0A=
href=3D"/https/0/webmail.pdb.fsc.net/exchweb/bin/redir.asp?URL=3Dhttp://w=
ww.fujitsu-siemens.com" =0A=
target=3D_blank>http://www.fujitsu-siemens.com</A></FONT> <BR><FONT =0A=
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; <A =0A=
href=3D"/https/0/webmail.pdb.fsc.net/exchweb/bin/redir.asp?URL=3Dhttp://w=
ww.fujitsu-siemens.de/rl/servicesupport/itdienstleistungen/competencecent=
er.html" =0A=
target=3D_blank>http://www.fujitsu-siemens.de/rl/servicesupport/itdienstl=
eistungen/competencecenter.html</A></FONT> =0A=
<BR><FONT =0A=
size=3D2>****************************************************************=
***************************************************</FONT> =0A=
</FONT></DIV></FONT></DIV></DIV></BODY></HTML>
------_=_NextPart_001_01C5F1A2.3B3FDE36--

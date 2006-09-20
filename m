Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KF6f95020223
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 11:06:41 -0400
Received: from mail.sea-aeroportimilano.it (h85-20-248-12.albacom.net
	[85.20.248.12] (may be forged))
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KF6bpP029783
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 11:06:38 -0400
From: "de Toma Alessandro" <detoma.alessandro@sea-aeroportimilano.it>
Date: Wed, 20 Sep 2006 17:08:53 +0200
Message-ID: <MNELLEMHKKBIPIBBIOKOOEHOFDAA.detoma.alessandro@sea-aeroportimilano.it>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0000_01C6DCD7.735FB7D0"
Subject: [linux-lvm] using LVM with SAN
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

This is a multi-part message in MIME format.

------=_NextPart_000_0000_01C6DCD7.735FB7D0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Dear All,
we have create a vg on a LINUX RH ES4 UP2.
The storage is a CX500 and the multypath software is POWERPATH 4.5.

During the creation of VG we are this worning:
# vgcreate VolGroupSUN01 /dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdc1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdd1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdg1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdh1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdk1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdl1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdo1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdp1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdc1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdd1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdg1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdh1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdk1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdl1 not
/dev/emcpowerb1
Found duplicate PV fPxLqOcxkEO2Umku09icOn5oJ1IC5H84: using /dev/sdo1 not
/dev/emcpowera1
Found duplicate PV TbW7QvjcOLzZo2zSOfyH7CqFQOOQniEd: using /dev/sdp1 not
/dev/emcpowerb1
Volume group "VolGroupSUN01" successfully created
This is correct?
When we umount the volume:
[root@mezzicluslin02 ~]# umount /dev/VolGroupSUN00/LogVolSUN00
/home/SUNstorage
umount: /dev/mapper/VolGroupSUN00-LogVolSUN00: not mounted
umount: /dev/mapper/VolGroupSUN00-LogVolSUN00: not mounted

This is correct?
Kind regards,


Sea S.p.a.
Sistemi Informativi
U.O. Sistemisti
de Toma Alessandro
tel.: 02-74863612
cell.: 335-1036464 


------=_NextPart_000_0000_01C6DCD7.735FB7D0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
	filename="winmail.dat"

eJ8+IjUPAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEGgAMADgAAANYHCQAUABEACAAAAAMAFgEB
A5AGAAwIAAAlAAAACwACAAEAAAALACMAAAAAAAMAJgAAAAAACwApAAAAAAADADYAAAAAAB4AcAAB
AAAAEwAAAHVzaW5nIExWTSB3aXRoIFNBTgAAAgFxAAEAAAAWAAAAAcbcxqp336IXBKFiRtCP6W9s
t9ZsoAAAAgEdDAEAAAAuAAAAU01UUDpERVRPTUEuQUxFU1NBTkRST0BTRUEtQUVST1BPUlRJTUlM
QU5PLklUAAAACwABDgAAAABAAAYOAAjAj8bcxgECAQoOAQAAABgAAAAAAAAAx4vpw2WMzUu0x22T
EdLrIsKAAAALAB8OAQAAAAIBCRABAAAAvAMAALgDAADICQAATFpGdUcB1+oDAAoAcmNwZzEyNZYy
APgLYG4OEDA0AegnAqQEZAIAY2gKwHNl+HQwIAhVB7ICgwBQA9T/ENkHEwKDDlADVBDZB20CgEp9
CoF2CJB3awuAZDo0DGBjAFALAwu1IETCZQrBQWxsLAqiCoDod2UgEQB2GYAFABiQgnQZgGEgdmcg
AiBBGlFMSU5VWAfwSAAgRVM0IFVQMpIuGRRUaBmAc3QFsBxhZxmABAAaUUNYNUYwEWAAcGQgdByB
bXB1bHR5CrAeIBygbw0BgHcKwB0TUE9XRRBSUEFUG3A0LjV7HAUZFEQIcQ8gHhMZ82nDGrEfECBW
RyAZcR9Sux4gHTF3BbADAA8gOiComQswc2IPQAFAc2ElIlkAQCAjGnEZ9VYG8EeBA2B1cFNVTjAl
0EIvAQB2L2VtDfBvZRlwciUQXGwLgBmARlsIYB3xZCcAKIBjGiJQAFYgZlB4THFPAGN4a0VPMlVt
EGt1MDkN4E9uNQBvSjFJQzVIOHA0OiB1AJAhoSeDc+JkF4Agbm8FQCeLJXADKH8phlRiVzdRdgJq
KzBMelpvMnoAU09meUg3Q3EgRlFPT1EDAEVk/SwNZC0PKD8pTypfK28sdn8OEDL/Li8vPzBPMV8s
hWi/OM8z/zUPNh83Lyx2az6v3znfOu87/z0PLHZsRI8/v+9Az0HfQu8sdm9Kb0WfRq/3R79Izyx2
cFBPS39Mj02f/06vLH9Qz1e/Uu9T/1UPMt//Vy9YP1lPWl84L1x/Y29en/9fr2C/Po9i32PvZP9m
D0Pf/2gvbx9qT2tfbG9KP26Pb5//cK9xv0+Pc996z3X/dw94H9dV73o8JqF1B4AgCcAm8bQgIiar
IhygF3BjB5Dkc2YecGx5GeULMSDDPwEwFXAjgh0xBaEJcGN0+j8ZFFccgAOgGXGHAIEBuwVAHiJ2
huMkNiXBWwNgZX9wQAeAenoN4ApAc8GAoTAyIH5dJfCMZYOFgyaqMC9Mb2cmocuQ84VwaANwZS8n
IRy1n4CUjGRbAIWDAMBwcASQ/ZBsLZFZWwCFQoxzicGTL/+UP5VPll8UMwvwF1CJ9hgkq4qPGSNL
FyEgCXBnCxE+cxkFJEoZIwZgGmBTLmhwLmEcBVMEABowbdBpIEluAhByAMAiUMMW0BkUVS5PLgYA
oYT/HLCilQEAFXADcRjBiOEd4WcDYBkUGjBsLlsAj0AtwDc0ODYzNg4gGRSHiNAY4KYBMzM1LQ9A
vaagNKggCuMg5haRAKlwCwABgAggBgAAAAAAwAAAAAAAAEYAAAAAA4UAAAAAAAADAAOACCAGAAAA
AADAAAAAAAAARgAAAAAQhQAAAAAAAAMAB4AIIAYAAAAAAMAAAAAAAABGAAAAAFKFAACOagEAHgAJ
gAggBgAAAAAAwAAAAAAAAEYAAAAAVIUAAAEAAAAEAAAAOS4wAB4ACoAIIAYAAAAAAMAAAAAAAABG
AAAAADaFAAABAAAAAQAAAAAAAAAeAAuACCAGAAAAAADAAAAAAAAARgAAAAA3hQAAAQAAAAEAAAAA
AAAAHgAMgAggBgAAAAAAwAAAAAAAAEYAAAAAOIUAAAEAAAABAAAAAAAAAAsADYAIIAYAAAAAAMAA
AAAAAABGAAAAAIKFAAABAAAACwBAgAggBgAAAAAAwAAAAAAAAEYAAAAADoUAAAAAAAADAEKACCAG
AAAAAADAAAAAAAAARgAAAAARhQAAAAAAAAMAQ4AIIAYAAAAAAMAAAAAAAABGAAAAABiFAAAAAAAA
AwBYgAggBgAAAAAAwAAAAAAAAEYAAAAAAYUAAAAAAAALAGmACCAGAAAAAADAAAAAAAAARgAAAAAG
hQAAAAAAAAIB+A8BAAAAEAAAAMeL6cNljM1LtMdtkxHS6yICAfoPAQAAABAAAADHi+nDZYzNS7TH
bZMR0usiAgH7DwEAAABZAAAAAAAAADihuxAF5RAaobsIACsqVsIAAFBTVFBSWC5ETEwAAAAAAAAA
AE5JVEH5v7gBAKoAN9luAAAARTpccG9zdGEgZGkgb3V0bG9va1xvdXRsb29rLnBzdAAAAAADAP4P
BQAAAAMADTT9NwAAAgF/AAEAAABIAAAAPE1ORUxMRU1IS0tCSVBJQkJJT0tPT0VIT0ZEQUEuZGV0
b21hLmFsZXNzYW5kcm9Ac2VhLWFlcm9wb3J0aW1pbGFuby5pdD4AAwAGENw7kt8DAAcQLAcAAAMA
EBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABERUFSQUxMLFdFSEFWRUNSRUFURUFWR09OQUxJTlVY
UkhFUzRVUDJUSEVTVE9SQUdFSVNBQ1g1MDBBTkRUSEVNVUxUWVBBVEhTT0ZUV0FSRUlTUE9XRVJQ
QVRINDVEVVJJTkdUAAAAAJcE

------=_NextPart_000_0000_01C6DCD7.735FB7D0--

Subject: RE: [linux-lvm] Red Hat Advanced Server + LVM
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C33891.884C4DC2"
Message-ID: <689F43A6CF84E541A721C5C3FD5ADECC02F5B6@blr-m3-msg.wipro.com>
content-class: urn:content-classes:message
From: "Sharad Tiwari" <sharad.tiwari@wipro.com>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Jun 23 08:10:10 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C33891.884C4DC2
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

hi all,

         While testing the LVM2 I came across this scenario.

If I have created a volume group(say 'testvg') containg two physical =
volumes say /dev/sda5 and /dev/sda6, and then remove one of the physical =
volume say /dev/sda6 and then do a pvdisplay it shows /dev/sda6 as an =
unknown device ...=20

Also on doing a vgdisplay the volume group testvg I get the following on =
stdout ...

[root@earth root]# vgdisplay
Entering CP VMS CP_VMS_vgdisplay function
  Couldn't find device with uuid =
'U5Jw21-3AWD-F7t3-a7CI-cpd1-EVAZ-u3LtgX'.
  Couldn't find all physical volumes for volume group testvg.
  Volume group "testvg" doesn't exist
[root@earth root]#

Now doing a vgreduce gives the proper result. So I did not understand =
why we are prividing this feature (using pvremove) of removing a =
physical volume from  an existing VG.


The following is the sequence of commands issued.( after creating the =
PVs and VGs) ...


[root@xyz root]# pvdisplay
Entering CP VMS CP_VMS_pvdisplay function
  --- Physical volume ---
  PV Name               /dev/sda8
  VG Name               testvg
  PV Size               496.00 MB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              124
  Free PE               49
  Allocated PE          75
  PV UUID               0m0xxl-xRK3-ojHc-TU8x-BgSF-sy6C-2vKquU

  --- Physical volume ---
  PV Name               /dev/sda7
  VG Name               testvg
  PV Size               396.00 MB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              99
  Free PE               99
  Allocated PE          0
  PV UUID               U5Jw21-3AWD-F7t3-a7CI-cpd1-EVAZ-u3LtgX

[root@xyz root]# pvremove -ff /dev/sda7
Entering CP VMS CP_VMS_pvremove function
Really WIPE LABELS from physical volume "/dev/sda7" of volume group =
"testvg" [y/n]? y
  WARNING: Wiping physical volume label from /dev/sda7 of volume group =
"testvg"
  Labels on physical volume "/dev/sda7" successfully wiped
[root@earth root]# pvdisplay
Entering CP VMS CP_VMS_pvdisplay function
  Couldn't find device with uuid =
'U5Jw21-3AWD-F7t3-a7CI-cpd1-EVAZ-u3LtgX'.
  --- Physical volume ---
  PV Name               /dev/sda8
  VG Name               testvg
  PV Size               496.00 MB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              124
  Free PE               49
  Allocated PE          75
  PV UUID               0m0xxl-xRK3-ojHc-TU8x-BgSF-sy6C-2vKquU

  --- Physical volume ---
  PV Name               unknown device
  VG Name               testvg
  PV Size               396.00 MB / not usable 0
  Allocatable           yes
  PE Size (KByte)       4096
  Total PE              99
  Free PE               99
  Allocated PE          0
  PV UUID               U5Jw21-3AWD-F7t3-a7CI-cpd1-EVAZ-u3LtgX


The other question is ... if I have a VG spanning across two PVs and =
then create an LV ( big enough to span across two disks ... ) and then =
do a vgreduce to remove one of the PV, it allows me to do that but does =
not change the size of the LV or VG being printed ...

Are these known bugs and what is the work around ?

Thanks for the help.

Sharad.

------_=_NextPart_001_01C33891.884C4DC2
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhUHAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEALgAAAFJFOiBbbGludXgtbHZtXSBS
ZWQgSGF0IEFkdmFuY2VkIFNlcnZlciArIExWTQD0DgEFgAMADgAAANMHBgAWAA0ACgAUAAAAIQEB
IIADAA4AAADTBwYAFgANAAoAFAAAACEBAQmAAQAhAAAANDJFQTc2NDc4N0I2MzI0NEEzMjc0NUQ4
ODhFODAzMzEA7gYBA5AGAPgMAAA3AAAAAwAmAAAAAAADADYAAAAAAEAAOQDCTUyIkTjDAR4APQAB
AAAABQAAAFJFOiAAAAAAAgFHAAEAAAAvAAAAYz11czthPSA7cD1XaXBybztsPUJMUi1NMy1NU0ct
MDMwNjIyMDc0MDIwWi0xMQAAHgBJAAEAAAAuAAAAUmU6IFtsaW51eC1sdm1dIFJlZCBIYXQgQWR2
YW5jZWQgU2VydmVyICsgTFZNAAAAQABOAADBn3MbN8MBHgBaAAEAAAAcAAAAbGludXgtbHZtLWFk
bWluQHNpc3RpbmEuY29tAAIBWwABAAAAVQAAAAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAAGxpbnV4
LWx2bS1hZG1pbkBzaXN0aW5hLmNvbQBTTVRQAGxpbnV4LWx2bS1hZG1pbkBzaXN0aW5hLmNvbQAA
AAACAVwAAQAAACEAAABTTVRQOkxJTlVYLUxWTS1BRE1JTkBTSVNUSU5BLkNPTQAAAAAeAF0AAQAA
ABYAAABIZWlueiBKIC4gTWF1ZWxzaGFnZW4AAAACAV4AAQAAAEsAAAAAAAAAgSsfpL6jEBmdbgDd
AQ9UAgAAAABIZWlueiBKIC4gTWF1ZWxzaGFnZW4AU01UUABtYXVlbHNoYWdlbkBzaXN0aW5hLmNv
bQAAAgFfAAEAAAAdAAAAU01UUDpNQVVFTFNIQUdFTkBTSVNUSU5BLkNPTQAAAAAeAGYAAQAAAAUA
AABTTVRQAAAAAB4AZwABAAAAHAAAAGxpbnV4LWx2bS1hZG1pbkBzaXN0aW5hLmNvbQAeAGgAAQAA
AAUAAABTTVRQAAAAAB4AaQABAAAAGAAAAG1hdWVsc2hhZ2VuQHNpc3RpbmEuY29tAB4AcAABAAAA
KgAAAFtsaW51eC1sdm1dIFJlZCBIYXQgQWR2YW5jZWQgU2VydmVyICsgTFZNAAAAAgFxAAEAAAAb
AAAAAcM3HYtHOVhe9JJ2TLS7gMwndDtyNQBc9o01AB4AdAABAAAAFgAAAGxpbnV4LWx2bUBzaXN0
aW5hLmNvbQAAAB4AGgwBAAAADgAAAFNoYXJhZCBUaXdhcmkAAAAeAB0OAQAAACoAAABbbGludXgt
bHZtXSBSZWQgSGF0IEFkdmFuY2VkIFNlcnZlciArIExWTQAAAAIBCRABAAAA5gUAAOIFAAD7DgAA
TFpGdUh7CMIDAAoAcmNwZzEyNeIyA0N0ZXgFQQEDAff/CoACpAPkBxMCgA/zAFAEVj8IVQeyESUO
UQMBAgBjaOEKwHNldDIGAAbDESX2MwRGE7cwEiwRMwjvCfe2OxgfDjA1ESIMYGMAUDMLCQFkMzYW
UAumIGjkaSAHQGwsCqIKhAqAiiAeJlcc8GxlIA6wVHN0C4BnHwBoHvBMhFZNFEBJIGNhB4C7HRAF
AG8EER+QBAAgBPAjCfAKwGlvLh1qSWabIBET4HYe8AUAZWEOsNJkHRAgdgbwdSBhCcABCGBwKHNh
eSAn4R8SdmcnKSAwAiELcYEfcXdvIHBoeQ3RLwdAI9UhMSTBLwEAdi/Qc2RhNR0QbiOgJ7b8Niwo
Qx+RA6AYIARgIxG/AiAqISKwH5ImbSdrNik4xmQmQCPAcHZkBAALUYUk0GkFQHNob3cEIIcsOQQg
A5F1bmtuLqDvLUEn0A3gHvAuMNAK4x2m+EFscyZAAiAtUR9SI8F+Zy3WH5Ij6h8DJUAgEWf/FCAf
gwIQHTAuoB9SMiEfMF0tYHUFQDDRHWpbA2BvbHRAI2AAIGgpwDfhXXYjMsgdZEUCMAZxH2FDXFAg
H+AF8DpwXzqhX/Uy2GYv4GMfQAIgHcYIUfhsZG4k8DWAC4AjoDBlIwPwOFF1dWkjoCdVADVKdzIx
LTNBAFdELUY3dDMtoGE3Q0ktDfBkP0AARVZBWi11M0zwdGdYJyHVPN4dISZfXzWBBcAzvyVAQWdW
RHoifSUEIi1RB5A9Qg7ABAB09zdvOHUdak4uoDJJGCEa0L0kMWkjECDiKtEDYHASgdUYIHM9EHQw
8FMmQCAg/y3QI6AwEAVAL+AEgR8wKFL+dyZwPjAgcRggTHFL8D6wOx9UISFmI2EIcB7wKHX/AJAf
YS2wKdQlcCqBKdMydD8q/gNSHiADkUgDH1JWR3sh2x1kVDVrISEfkhQQca8KUDwQKmMFoG0DgWQE
IOMEAQpQZC4oHRABgBKBcyNDH1ZQVi+SI6BVIHPHJXA23UhaeHl6OHYtt+85jzqaLbg7/i1iAFrA
Kw1/YgEdxlrQB7AgUmRsJ7Y4PUWnR2QfHiElBGN5U2mCemReNDk2LjAWUPxNQiegTfQksAJgHvAB
QH8d1THQF7AgQAGRHuFkaHkLB5Bjd0VoxChLQnm3DrAlcGmlMGoQHcZUN/CvJsFuEWRrDiA0HcZG
CdGfcI9p8WuNI5Fwmjc1Y3kQVVVJRGRtMG0wgHh4bC14Uks/4ABvakhjLVRVOAB4LUJnU0Ytc4B5
NkMtMnZLV+C+VR1sYg9jH2afZTg3Ze/3Zv9oD31NM2ofay9sP21P525fb29wfyA5c7dyT4ot/3RP
d1R1z31LPv9AD0ESXD/7XUwp1S0BIH4uXv9gBinVnTv8UiNgHTAk0FdJhvHgTEFCRUwF8FQDKv4+
In43R2AqgURrRvdbeTAvbl0/hjAdxldBwFJOSU5HOh6gBSDnUUMrDQtgYmUDIFQDfjf3nG9G9h3G
TKESBCAyIZq/+5vJTRBjIWAEEDvwmWID8P9MsAsxSH9dr5YfX89g3zzf/z3vkG+Rf0Eceu97/39/
ZT//fy+AP4FPaX+Db4R/hY+Gn/+Hr4i/cO+Kz3MPjO91L47//3dPeF95b7H/sw+0Hx4nL+z/tk+3
X7hvgf+6j7ufvK+9v/++z7/fwu+Kf4uPxC+Nr8Zf/4/Pr9+R71WPKiEfkQXAV+H/HzEyISEhMNIG
kCLGI8DP8f8t8ABwAwAygiClJjFa1imDjyNEL6If0FEAIGJpH3DrCfAIYGc4YHQmQOci56r9LdFr
5dQlcCzcS1fq0Snf/1rBKSAuUR0hLqIgYerRLWH/H5AjcOoQNqFHgk3zE9EfYP8e8VeS0nIqhenR
BbHP8aEgf1FDqpEjgjbdBxDyYxQQIPswBPFAZ1r0TvDxEVdVJjDccmtPUQhgKGE/VbwAcE/sMUQi
H5IfoGxwIdtTLRPhYVlgHWR9/KAAAB4ANRABAAAAPgAAADw2ODlGNDNBNkNGODRFNTQxQTcyMUM1
QzNGRDVBREVDQzAyRjVCNkBibHItbTMtbXNnLndpcHJvLmNvbT4AAAAeAEcQAQAAAA8AAABtZXNz
YWdlL3JmYzgyMgAACwDyEAEAAAAfAPMQAQAAAGwAAABSAEUAJQAzAEEAIABbAGwAaQBuAHUAeAAt
AGwAdgBtAF0AIABSAGUAZAAgAEgAYQB0ACAAQQBkAHYAYQBuAGMAZQBkACAAUwBlAHIAdgBlAHIA
IAAlADIAQgAgAEwAVgBNAC4ARQBNAEwAAAALAPYQAAAAAEAABzCeN3xlkTjDAUAACDAcsE6IkTjD
AQMA3j/kBAAAAwDxPwkEAAAeAPg/AQAAAA4AAABTaGFyYWQgVGl3YXJpAAAAAgH5PwEAAABcAAAA
AAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC9PPVdJUFJPL09VPUZJUlNUIEFETUlOSVNUUkFU
SVZFIEdST1VQL0NOPVJFQ0lQSUVOVFMvQ049U0hBUlRJVwAeAPo/AQAAABUAAABTeXN0ZW0gQWRt
aW5pc3RyYXRvcgAAAAACAfs/AQAAAB4AAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAALgAA
AAMA/T/kBAAAAwAZQAAAAAADABpAAAAAAAMAHUAAAAAAAwAeQAAAAAAeADBAAQAAAAgAAABTSEFS
VElXAB4AMUABAAAACAAAAFNIQVJUSVcAHgAyQAEAAAAcAAAAbGludXgtbHZtLWFkbWluQHNpc3Rp
bmEuY29tAB4AM0ABAAAAGAAAAG1hdWVsc2hhZ2VuQHNpc3RpbmEuY29tAB4AOEABAAAACAAAAFNI
QVJUSVcAHgA5QAEAAAACAAAALgAAAAsAKQAAAAAACwAjAAAAAAADAAYQ7KS/uAMABxBNCAAAAwAQ
EAAAAAADABEQAQAAAB4ACBABAAAAZQAAAEhJQUxMLFdISUxFVEVTVElOR1RIRUxWTTJJQ0FNRUFD
Uk9TU1RISVNTQ0VOQVJJT0lGSUhBVkVDUkVBVEVEQVZPTFVNRUdST1VQKFNBWVRFU1RWRylDT05U
QUlOR1RXT1BIWVMAAAAAAgF/AAEAAAA+AAAAPDY4OUY0M0E2Q0Y4NEU1NDFBNzIxQzVDM0ZENUFE
RUNDMDJGNUI2QGJsci1tMy1tc2cud2lwcm8uY29tPgAAAIC1

------_=_NextPart_001_01C33891.884C4DC2--

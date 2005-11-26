Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAQ8DIV17755
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 03:13:18 -0500
Received: from smtp.kliff.de (smtp.kliff.de [80.239.136.89])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jAQ8DH30008452
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 03:13:17 -0500
Received: from DC-EX-001.evendi.local ([85.183.128.34])
	by smtp.kliff.de (8.11.6/8.11.6) with ESMTP id jAQ8DBP24440
	for <linux-lvm@redhat.com>; Sat, 26 Nov 2005 09:13:11 +0100
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C5F261.3E238725"
Subject: AW: [linux-lvm] Activation problem with vgremove
Date: Sat, 26 Nov 2005 09:13:11 +0100
Message-ID: <AE41C3C123D61B45B457F3037275842F151FFC@DC-EX-001.evendi.local>
References: <AE41C3C123D61B45B457F3037275842F1E03E2@DC-EX-001.evendi.local>
From: "Marcus Franke" <MFranke@evendi.de>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C5F261.3E238725
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
=20
Ok, had my timeframe, rebooted the server but still the volumegroup
is marked as active. I cannot remove it :(
=20
How can this be and how can I change this? I need to remove the lvm
from the drive. And I want it to happen the clean way.
=20
Not just fdisking it from the drive and let the informations of the lvm
remain somewhere in the config..
=20
=20
Marcus

________________________________

Von: linux-lvm-bounces@redhat.com im Auftrag von Marcus Franke
Gesendet: Fr 25.11.2005 13:49
An: linux-lvm@redhat.com
Betreff: [linux-lvm] Activation problem with vgremove



Hello all,

I am doing a reconfiguration of one of my servers and am facing
the following problem:

I have one disk using the lvm.

On this disk there is one volumegroup which had two logical
volumes.

I unmounted those volumes and tried to lvremove them. The
first one went down the river without a problem. The second
one I was not able to lvremove it, after a reboot of the
machine, I could remove the logical volume.

Now, I have the problem I want to delete the volume group
too, but vgremove fails like the logical volume. Somewhere
it is marked as active.

[root@master]/mnt# vgremove -v Volume01
vgremove -- locking logical volume manager
vgremove -- checking volume group name "Volume01"
vgremove -- checking volume group "Volume01" activity
vgremove -- ERROR: can't remove active volume group "Volume01"

System is RHEL3 with kernel:
2.4.21-37.ELsmp #1 SMP Wed Sep 7 13:28:55 EDT 2005 i686 i686 i386
GNU/Linux

Where can I remove the active flag for the volume group? As I do not
want to reboot the machine again as the next timeframe for reboot will
be
not before tomorrow morning.


Regards,
Marcus

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



------_=_NextPart_001_01C5F261.3E238725
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+Ig0IAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAMQAAAEFXOiBbbGludXgtbHZtXSBB
Y3RpdmF0aW9uIHByb2JsZW0gd2l0aCB2Z3JlbW92ZQAAEgEFgAMADgAAANUHCwAaAAkADQALAAYA
KAEBIIADAA4AAADVBwsAGgAJAA0ACwAGACgBAQmAAQAhAAAAMTBBNTEwOTQ3MEY1Q0Q0NDg3Qzkx
NTY0Nzc3RkU5MEQADgcBA5AGAMgTAAA4AAAAAwA2AAAAAABAADkAJYcjPmHyxQEeAD0AAQAAAAUA
AABBVzogAAAAAAIBRwABAAAAMAAAAGM9REU7YT0gO3A9ZVZlbmRpO2w9REMtRVgtMDAxLTA1MTEy
NjA4MTMxMVotNzk0AB4ASQABAAAALQAAAFtsaW51eC1sdm1dIEFjdGl2YXRpb24gcHJvYmxlbSB3
aXRoIHZncmVtb3ZlAAAAAEAATgAA8KqwvvHFAR4AWgABAAAAHQAAAGxpbnV4LWx2bS1ib3VuY2Vz
QHJlZGhhdC5jb20AAAAAAgFbAAEAAABXAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAAbGludXgt
bHZtLWJvdW5jZXNAcmVkaGF0LmNvbQBTTVRQAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20A
AAIBXAABAAAAIgAAAFNNVFA6TElOVVgtTFZNLUJPVU5DRVNAUkVESEFULkNPTQAAAB4AXQABAAAA
DgAAAE1hcmN1cyBGcmFua2UAAAACAV4AAQAAAD0AAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAABN
YXJjdXMgRnJhbmtlAFNNVFAATUZyYW5rZUBldmVuZGkuZGUAAAAAAgFfAAEAAAAXAAAAU01UUDpN
RlJBTktFQEVWRU5ESS5ERQAAHgBmAAEAAAAFAAAAU01UUAAAAAAeAGcAAQAAAB0AAABsaW51eC1s
dm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAB4AaAABAAAABQAAAFNNVFAAAAAAHgBpAAEAAAASAAAA
TUZyYW5rZUBldmVuZGkuZGUAAAAeAHAAAQAAACEAAABBY3RpdmF0aW9uIHByb2JsZW0gd2l0aCB2
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
SEVMM1z/1OO/45/gOnKMYGztD2WvY70yLoI0qWAxLTM3LmhgJHNt/oAjMTYATVCkIFcLUVNl/oA3
qbKQMjg6NZRwRUSSUPGpc2k2OMXwcONor9TyPGkzcQBqv2vPY8xHTvhVL0ybMnMfdC9jz3bf+3fv
ePlX/SNe8eNhIjlfxfxmbJ1x6/DREC2/Ls/+Yf4/nRD9gONw48BQ0BtQea9/er94zCzGHVUT4iEl
DFBn3zQwE8AZwRPijGB4LPGc8P+7EJ1gf5F+0n/P1PIdVb/g79zwgj+DT3jMYjafi+94vV8bQo3g
ftEbssHAcv5Qd/eI3zsEfuBu6IE8X48PeL+/lD+VT5Zfl2+Yf5mHUv4wudcgZHPdb5sfmS1N1yD+
Y/QQnZ+er5k/oS+iP6NJ/l+m/6gPqNqj/6UPoxyz5/+SPzsFNEBKI/PQgi+q76v/X7QPtR+wn6MP
uE1B1MRoCbsBPSK1QHRwczroLy93uTAuszhDMDQxfUtRL69SteDr8LqRsrUiv9scDMAiAK2ifoD8
wG4S0BB7SFlQXoBMSU6eS2DwuL+5z7refX3bwQciAOewDrBcY2YxXP8h8Nwpvm+/f7rdzr/X2s9P
9dGmMs4xQdsQs9+077X8H1yQ/xGtj9TyE+JMVk3B3MBPVy1UTwxQFOCXtt+378OhdCIAcC5+4Lxn
L89Rz5B2QM8gLdLU/7vPvN+96tIf0yrBj8Ke1r//0ynHr8d/yI/Jn8qvy7/ebwXgwjXhES9GT05U
/+Fp3O/h4FIi3ijiaFIT4m9VDnY337JQ4A4w0NEv2ERJVuSf6L9n3XFSMxPtH+4vNTjfwUJPRH5Z
4A3fsO9f8eFvoN/QSChUTUzgAH30EAAAHgA1EAEAAABAAAAAPEFFNDFDM0MxMjNENjFCNDVCNDU3
RjMwMzcyNzU4NDJGMTUxRkZDQERDLUVYLTAwMS5ldmVuZGkubG9jYWw+AB4AORABAAAAQAAAADxB
RTQxQzNDMTIzRDYxQjQ1QjQ1N0YzMDM3Mjc1ODQyRjFFMDNFMkBEQy1FWC0wMDEuZXZlbmRpLmxv
Y2FsPgAeAEcQAQAAAA8AAABtZXNzYWdlL3JmYzgyMgAACwDyEAEAAAAfAPMQAQAAAG4AAABBAFcA
JQAzAEEAIABbAGwAaQBuAHUAeAAtAGwAdgBtAF0AIABBAGMAdABpAHYAYQB0AGkAbwBuACAAcABy
AG8AYgBsAGUAbQAgAHcAaQB0AGgAIAB2AGcAcgBlAG0AbwB2AGUALgBFAE0ATAAAAAAACwD2EAAA
AABAAAcwzV7egWDyxQFAAAgwznIvPmHyxQEDAN4/r28AAAMA8T8HBAAAHgD4PwEAAAAOAAAATWFy
Y3VzIEZyYW5rZQAAAAIB+T8BAAAAXgAAAAAAAADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAvTz1F
VkVOREkvT1U9RVJTVEUgQURNSU5JU1RSQVRJVkUgR1JVUFBFL0NOPVJFQ0lQSUVOVFMvQ049TUZS
QU5LRQAAAB4A+j8BAAAAFQAAAFN5c3RlbSBBZG1pbmlzdHJhdG9yAAAAAAIB+z8BAAAAHgAAAAAA
AADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAuAAAAAwD9P+QEAAADABlAAAAAAAMAGkAAAAAAAwAd
QAAAAAADAB5AAAAAAB4AMEABAAAACAAAAE1GUkFOS0UAHgAxQAEAAAAIAAAATUZSQU5LRQAeADJA
AQAAAB0AAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAB4AM0ABAAAAEgAAAE1GcmFu
a2VAZXZlbmRpLmRlAAAAHgA4QAEAAAAIAAAATUZSQU5LRQAeADlAAQAAAAIAAAAuAAAAAwB2QP//
//8LACkAAAAAAAsAIwAAAAAAAwAGEAkIDD0DAAcQsgUAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAA
AGUAAABIRUxMTyxPSyxIQURNWVRJTUVGUkFNRSxSRUJPT1RFRFRIRVNFUlZFUkJVVFNUSUxMVEhF
Vk9MVU1FR1JPVVBJU01BUktFREFTQUNUSVZFSUNBTk5PVFJFTU9WRUlUOihIT1dDAAAAAAIBfwAB
AAAAQAAAADxBRTQxQzNDMTIzRDYxQjQ1QjQ1N0YzMDM3Mjc1ODQyRjE1MUZGQ0BEQy1FWC0wMDEu
ZXZlbmRpLmxvY2FsPgDPYA==

------_=_NextPart_001_01C5F261.3E238725--

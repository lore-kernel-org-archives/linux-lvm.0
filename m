Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7UGG4307292
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 12:16:04 -0400
Received: from m4s07.vlinux.de ([83.151.27.105])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i7UGFwHj004117
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 12:15:58 -0400
Received: from pd9e1a25d.dip.t-dialin.net ([217.225.162.93]
	helo=lothlorien.homelinux.net)
	by m4s07.vlinux.de with asmtp (Exim 3.35 #1 (Debian))
	id 1C1opW-0003Or-00
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 18:16:26 +0200
Received: from helge (helo=localhost)
	by lothlorien.homelinux.net with local-esmtp (Exim 3.35 #1 (Debian))
	id 1C1op1-000345-00
	for <linux-lvm@redhat.com>; Mon, 30 Aug 2004 18:15:55 +0200
Date: Mon, 30 Aug 2004 18:15:55 +0200 (CEST)
From: Helge Bahmann <hcb@chaoticmind.net>
Message-ID: <Pine.LNX.4.44.0408301759420.11166-200000@lothlorien.homelinux.net>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-1463747071-364778334-1093882555=:11166"
Sender: Helge Bahmann <hcb@chaoticmind.net>
Subject: [linux-lvm] lvm1: kernel BUG caused by broken snapshot volume --
 how to drop it?
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
To: linux-lvm@redhat.com

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.
  Send mail to mime@docserver.cac.washington.edu for more info.

---1463747071-364778334-1093882555=:11166
Content-Type: TEXT/PLAIN; charset=US-ASCII

Hello,

Basically subject says it; calling "lvremove /dev/raid5/snapshot" causes a
kernel bug (decoded oops attached), subsequently lvm is in locked state
and no further operations are possible

How do I drop this volume? (the data inside the volume is of no
importance, it's just a backup snapshot, but the other volumes must not
be damaged)

I should add that this machine is serving files for some 100 users, so it
is kind of important that I do not make any mistake...

The system is SLES8; kernel version is 2.4.21, lvm userspace is 1.0.5, but
I don't know what (if any) lvm-related patches Suse may have applied...

Best regards and TIA
-- 
Helge Bahmann <hcb@chaoticmind.net>                     /| \__
The past: Smart users in front of dumb terminals       /_|____\
                                                     _/\ |   __)
$ ./configure                                        \\ \|__/__|
checking whether build environment is sane... yes     \\/___/ |
checking for AIX... no (we already did this)            |

---1463747071-364778334-1093882555=:11166
Content-Type: TEXT/plain; name="oops.txt"
Content-Transfer-Encoding: BASE64
Content-ID: <Pine.LNX.4.44.0408301815550.11166@lothlorien.homelinux.net>
Content-Description: 
Content-Disposition: attachment; filename="oops.txt"

a3N5bW9vcHMgMi40LjUgb24gaTY4NiAyLjQuMjEtMjQxLXNtcC4gIE9wdGlv
bnMgdXNlZA0KICAgICAtViAoZGVmYXVsdCkNCiAgICAgLWsgL3Byb2Mva3N5
bXMgKGRlZmF1bHQpDQogICAgIC1sIC9wcm9jL21vZHVsZXMgKGRlZmF1bHQp
DQogICAgIC1vIC9saWIvbW9kdWxlcy8yLjQuMjEtMjQxLXNtcC8gKGRlZmF1
bHQpDQogICAgIC1tIC9ib290L1N5c3RlbS5tYXAtMi40LjIxLTI0MS1zbXAg
KGRlZmF1bHQpDQoNCldhcm5pbmc6IFlvdSBkaWQgbm90IHRlbGwgbWUgd2hl
cmUgdG8gZmluZCBzeW1ib2wgaW5mb3JtYXRpb24uICBJIHdpbGwNCmFzc3Vt
ZSB0aGF0IHRoZSBsb2cgbWF0Y2hlcyB0aGUga2VybmVsIGFuZCBtb2R1bGVz
IHRoYXQgYXJlIHJ1bm5pbmcNCnJpZ2h0IG5vdyBhbmQgSSdsbCB1c2UgdGhl
IGRlZmF1bHQgb3B0aW9ucyBhYm92ZSBmb3Igc3ltYm9sIHJlc29sdXRpb24u
DQpJZiB0aGUgY3VycmVudCBrZXJuZWwgYW5kL29yIG1vZHVsZXMgZG8gbm90
IG1hdGNoIHRoZSBsb2csIHlvdSBjYW4gZ2V0DQptb3JlIGFjY3VyYXRlIG91
dHB1dCBieSB0ZWxsaW5nIG1lIHRoZSBrZXJuZWwgdmVyc2lvbiBhbmQgd2hl
cmUgdG8gZmluZA0KbWFwLCBtb2R1bGVzLCBrc3ltcyBldGMuICBrc3ltb29w
cyAtaCBleHBsYWlucyB0aGUgb3B0aW9ucy4NCg0Ka2VybmVsIEJVRyBhdCBt
ZW1vcnkuYzo1MzEhDQppbnZhbGlkIG9wZXJhbmQ6IDAwMDAgMi40LjIxLTI0
MS1zbXAgIzEgU01QIFR1ZSBBdWcgMTAgMTU6NTU6MzQgVVRDIDIwMDQNCkNQ
VTogICAgMA0KRUlQOiAgICAwMDEwOls8YzAxMzllYmI+XSAgICBOb3QgdGFp
bnRlZA0KVXNpbmcgZGVmYXVsdHMgZnJvbSBrc3ltb29wcyAtdCBlbGYzMi1p
Mzg2IC1hIGkzODYNCkVGTEFHUzogMDAwMTAyNDYNCmVheDogMDAwMDAwMDAg
ICBlYng6IGMxMGJmYTUwICAgZWN4OiAwMDAwMDAwYiAgIGVkeDogYzI3ZmU4
NDANCmVzaTogYzI3ZmZkMTAgICBlZGk6IDAwMDAwMDAwICAgZWJwOiAwMDAw
MDAxMiAgIGVzcDogY2RkMDNkNjgNCmRzOiAwMDE4ICAgZXM6IDAwMTggICBz
czogMDAxOA0KUHJvY2VzcyBsdnJlbW92ZSAocGlkOiAxODA0LCBzdGFja3Bh
Z2U9Y2RkMDMwMDApDQpTdGFjazogYzEwYmZhNTAgZjU0MWZlYTAgYzAxM2Ez
NTggYzEwYmZhNTAgZjU0ODAwMDAgZjU0ODAwMDAgZjU0ODRhMDAgZjU0YTVm
NzYgDQogICAgICAgZjU0MWZlYTAgZjU0ODAwMDAgZjU0ZjgwMDAgZjU0YTNi
N2YgZjU0ODAwMDAgZjU5NWFkYzAgZjU0ODRiNzAgMDAwMDAwMDAgDQogICAg
ICAgNDAwNGZlMjEgZjU0ZjgwMDAgYmZmZmVkMDAgZjU0YTA4NGIgMDAwMDAw
MDAgZjU0YWFmZTAgZmZmZmZmZmYgY2NiMTkxOTAgDQpDYWxsIFRyYWNlOiAg
ICAgICAgIFs8YzAxM2EzNTg+XSAoMjApIFs8ZjU0YTVmNzY+XSAoMTYpIFs8
ZjU0YTNiN2Y+XSAoMzIpDQogIFs8ZjU0YTA4NGI+XSAoMDgpIFs8ZjU0YWFm
ZTA+XSAoMTIpIFs8YzAyOGJjNDQ+XSAoNjgpIFs8YzAyNWQyNmQ+XSAoMjAp
DQogIFs8YzAyOGVhOTY+XSAoMDgpIFs8YzAxNDIxZDU+XSAoNDgpIFs8YzAx
M2I5Y2M+XSAoMTAwKSBbPGMwMTNjMDc4Pl0gKDUyKQ0KICBbPGMwMTcwZjIw
Pl0gKDE2KSBbPGMwMTU2YjA1Pl0gKDU2KSBbPGMwMTU2ZDAxPl0gKDI4KSBb
PGMwMTU1MGVhPl0gKDI4KQ0KICBbPGMwMTU0ZjY4Pl0gKDI4KSBbPGMwMTZi
Nzc2Pl0gKDI4KSBbPGMwMTU1MzgyPl0gKDI0KSBbPGMwMTA5NzE3Pl0gKDYw
KQ0KQ29kZTogMGYgMGIgMTMgMDIgODYgZWIgMmUgYzAgZWIgYzIgOGQgNzQg
MjYgMDAgOGQgYmMgMjcgMDAgMDAgMDAgDQoNCg0KPj5FSVA7IGMwMTM5ZWJi
IDx1bnBpbl9wdGVfcGFnZSs1Yi83MD4gICA8PT09PT0NCg0KPj5lYng7IGMx
MGJmYTUwIDxfZW5kK2MxYmQ3OC8yZDljMzg4Pg0KPj5lZHg7IGMyN2ZlODQw
IDxfZW5kKzIzNWFiNjgvMmQ5YzM4OD4NCj4+ZXNpOyBjMjdmZmQxMCA8X2Vu
ZCsyMzVjMDM4LzJkOWMzODg+DQo+PmVzcDsgY2RkMDNkNjggPFtpZGUtY2Rd
LmRhdGEuZW5kKzQyNDAwOS8xYjIwMzAxPg0KDQpUcmFjZTsgYzAxM2EzNTgg
PHVubWFwX2tpb2J1ZiszOC82MD4NClRyYWNlOyBmNTRhNWY3NiA8W2x2bS1t
b2RdbHZtX3NuYXBzaG90X3JlbGVhc2UrOTYvMTAwPg0KVHJhY2U7IGY1NGEz
YjdmIDxbbHZtLW1vZF1sdm1fZG9fbHZfcmVtb3ZlKzEzZi8zMDA+DQpUcmFj
ZTsgZjU0YTA4NGIgPFtsdm0tbW9kXWx2bV9jaHJfaW9jdGwrMzliLzZkMD4N
ClRyYWNlOyBmNTRhYWZlMCA8W2x2bS1tb2RdbHZfcmVxKzAvYTA+DQpUcmFj
ZTsgYzAyOGJjNDQgPHRjcF9jbGVhbl9ydHhfcXVldWUrMzM0LzM0MD4NClRy
YWNlOyBjMDI1ZDI2ZCA8X19rZnJlZV9za2IrMTBkLzE3MD4NClRyYWNlOyBj
MDI4ZWE5NiA8dGNwX3Jjdl9lc3RhYmxpc2hlZCs0YTYvODgwPg0KVHJhY2U7
IGMwMTQyMWQ1IDxmaWxlbWFwX25vcGFnZSsxYzUvMjQwPg0KVHJhY2U7IGMw
MTNiOWNjIDxkb19ub19wYWdlK2RjLzRjMD4NClRyYWNlOyBjMDEzYzA3OCA8
aGFuZGxlX21tX2ZhdWx0K2M4LzIwMD4NClRyYWNlOyBjMDE3MGYyMCA8ZHB1
dCszMC8xNTA+DQpUcmFjZTsgYzAxNTZiMDUgPGdldF9jaHJmb3BzKzE1NS8x
NzA+DQpUcmFjZTsgYzAxNTZkMDEgPGNocmRldl9vcGVuKzcxL2IwPg0KVHJh
Y2U7IGMwMTU1MGVhIDxkZW50cnlfb3BlbisxN2EvMWQwPg0KVHJhY2U7IGMw
MTU0ZjY4IDxmaWxwX29wZW4rNjgvNzA+DQpUcmFjZTsgYzAxNmI3NzYgPHN5
c19pb2N0bCtmNi8yZDI+DQpUcmFjZTsgYzAxNTUzODIgPHN5c19vcGVuK2Ey
L2MwPg0KVHJhY2U7IGMwMTA5NzE3IDxzeXN0ZW1fY2FsbCszMy8zOD4NCg0K
Q29kZTsgIGMwMTM5ZWJiIDx1bnBpbl9wdGVfcGFnZSs1Yi83MD4NCjAwMDAw
MDAwIDxfRUlQPjoNCkNvZGU7ICBjMDEzOWViYiA8dW5waW5fcHRlX3BhZ2Ur
NWIvNzA+ICAgPD09PT09DQogICAwOiAgIDBmIDBiICAgICAgICAgICAgICAg
ICAgICAgdWQyYSAgICAgIDw9PT09PQ0KQ29kZTsgIGMwMTM5ZWJkIDx1bnBp
bl9wdGVfcGFnZSs1ZC83MD4NCiAgIDI6ICAgMTMgMDIgICAgICAgICAgICAg
ICAgICAgICBhZGMgICAgKCVlZHgpLCVlYXgNCkNvZGU7ICBjMDEzOWViZiA8
dW5waW5fcHRlX3BhZ2UrNWYvNzA+DQogICA0OiAgIDg2IGViICAgICAgICAg
ICAgICAgICAgICAgeGNoZyAgICVjaCwlYmwNCkNvZGU7ICBjMDEzOWVjMSA8
dW5waW5fcHRlX3BhZ2UrNjEvNzA+DQogICA2OiAgIDJlICAgICAgICAgICAg
ICAgICAgICAgICAgY3MNCkNvZGU7ICBjMDEzOWVjMiA8dW5waW5fcHRlX3Bh
Z2UrNjIvNzA+DQogICA3OiAgIGMwIGViIGMyICAgICAgICAgICAgICAgICAg
c2hyICAgICQweGMyLCVibA0KQ29kZTsgIGMwMTM5ZWM1IDx1bnBpbl9wdGVf
cGFnZSs2NS83MD4NCiAgIGE6ICAgOGQgNzQgMjYgMDAgICAgICAgICAgICAg
ICBsZWEgICAgMHgwKCVlc2ksMSksJWVzaQ0KQ29kZTsgIGMwMTM5ZWM5IDx1
bnBpbl9wdGVfcGFnZSs2OS83MD4NCiAgIGU6ICAgOGQgYmMgMjcgMDAgMDAg
MDAgMDAgICAgICBsZWEgICAgMHgwKCVlZGksMSksJWVkaQ0KDQoNCjEgd2Fy
bmluZyBpc3N1ZWQuICBSZXN1bHRzIG1heSBub3QgYmUgcmVsaWFibGUuDQo=
---1463747071-364778334-1093882555=:11166--

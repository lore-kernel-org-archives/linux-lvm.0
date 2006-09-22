Message-ID: <45146347.3070804@ce.jp.nec.com>
Date: Fri, 22 Sep 2006 18:27:19 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------080302060604090203030008"
Subject: [linux-lvm] [PATCH LVM2 0/2] fix alloc anywhere and addition of
	disklog
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
To: linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>, Jonathan Brassow <jbrassow@redhat.com>

This is a multi-part message in MIME format.
--------------080302060604090203030008
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

Following patches will fix 2 problems:
  - 'lvcreate --alloc anywhere' cannot allocates log
    on the same PV with mimage. This prevents us to create a mirror LV
    on a VG with 2 PVs.
  - 'lvconvert' from corelog allocates log from the same PV
    with other image. It spoils redundancy.
(See attached metadata for examples)

This patch does the following changes:
  (1/2) fix-mirror-alloc-anywhere.patch
          - split log specific parts from _find_parallel_space() and
            _alloc_parallel_area()
          - determine log PV before doing other allocation
          - use constraints correctly
             * log allocation should avoid all PVs used by other parts of the LV
             * other allocation should avoid log PV and parallel PVs of
               corresponding lv segment (unchanged)
  (2/2) fix-lvconvert-allocate-disklog.patch
          - lvconvert to setup constraints properly

The 2nd patch itself is trivial and depends on the 1st patch for
the allocation logic to work correctly.

The patch has no effects on non-mirror allocation.
The patch was tested on the combinations of following scenarios:
  - normal or anywhere allocation policy
  - creation, corelog to disklog conversion, or linear to mirror conversion
  - VG with 2 PVs or more than 2 PVs

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------080302060604090203030008
Content-Type: text/plain;
 name="testvg0-lvconvert-corelog.vg"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="testvg0-lvconvert-corelog.vg"

IyBHZW5lcmF0ZWQgYnkgTFZNMjogRnJpIFNlcCAxNSAwMTo1MjowNyAyMDA2Cgpjb250ZW50
cyA9ICJUZXh0IEZvcm1hdCBWb2x1bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlv
biA9ICJDcmVhdGVkICpiZWZvcmUqIGV4ZWN1dGluZyAnbHZjb252ZXJ0IC1tIDEgdGVzdHZn
MC9sdjAnIgoKY3JlYXRpb25faG9zdCA9ICJ0ZXRzdW8ubGFiIgkjIExpbnV4IHRldHN1by5s
YWIgMi42LjktNDIuRUxzbXAgIzEgU01QIFdlZCBKdWwgMTIgMjM6Mjc6MTcgRURUIDIwMDYg
aTY4NgpjcmVhdGlvbl90aW1lID0gMTE1ODI5OTUyNwkjIEZyaSBTZXAgMTUgMDE6NTI6MDcg
MjAwNgoKdGVzdHZnMCB7CglpZCA9ICJhNUUyTnItNzFaNy1ZaGFKLVBQdG8tUUphTy1Vd1ZS
LVh1eDJ0TyIKCXNlcW5vID0gMgoJc3RhdHVzID0gWyJSRVNJWkVBQkxFIiwgIlJFQUQiLCAi
V1JJVEUiXQoJZXh0ZW50X3NpemUgPSA4MTkyCQkjIDQgTWVnYWJ5dGVzCgltYXhfbHYgPSAw
CgltYXhfcHYgPSAwCgoJcGh5c2ljYWxfdm9sdW1lcyB7CgoJCXB2MCB7CgkJCWlkID0gIjFX
OVBmNS1KSzFCLTF6ZG8tcWF5SS1sSWNoLTRyUGMtRHI2WDhKIgoJCQlkZXZpY2UgPSAiL2Rl
di9kbS0wIgkjIEhpbnQgb25seQoKCQkJc3RhdHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCXBl
X3N0YXJ0ID0gMzg0CgkJCXBlX2NvdW50ID0gNAkjIDE2IE1lZ2FieXRlcwoJCX0KCgkJcHYx
IHsKCQkJaWQgPSAiaE1iUjdpLVJxdEMtUHBLSy0yaVpELUNNblgteXl0Ui1TMm1ySDYiCgkJ
CWRldmljZSA9ICIvZGV2L2RtLTEiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9D
QVRBQkxFIl0KCQkJcGVfc3RhcnQgPSAzODQKCQkJcGVfY291bnQgPSA0CSMgMTYgTWVnYWJ5
dGVzCgkJfQoKCQlwdjIgewoJCQlpZCA9ICJndVNjMnItVHc0ay1ha001LXRqWjUtNlY5bS1o
d0NCLWZhWTEwSiIKCQkJZGV2aWNlID0gIi9kZXYvZG0tMiIJIyBIaW50IG9ubHkKCgkJCXN0
YXR1cyA9IFsiQUxMT0NBVEFCTEUiXQoJCQlwZV9zdGFydCA9IDM4NAoJCQlwZV9jb3VudCA9
IDQJIyAxNiBNZWdhYnl0ZXMKCQl9Cgl9CgoJbG9naWNhbF92b2x1bWVzIHsKCgkJbHYwIHsK
CQkJaWQgPSAieTEzUzIzLWNHQ3AtTmNKVS00NXZ5LXlRdXotdjIzMS1sTmtGaTEiCgkJCXN0
YXR1cyA9IFsiUkVBRCIsICJXUklURSIsICJWSVNJQkxFIl0KCQkJc2VnbWVudF9jb3VudCA9
IDEKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4dGVudF9jb3Vu
dCA9IDEJIyA0IE1lZ2FieXRlcwoKCQkJCXR5cGUgPSAibWlycm9yIgoJCQkJbWlycm9yX2Nv
dW50ID0gMgoJCQkJcmVnaW9uX3NpemUgPSAxMDI0CgoJCQkJbWlycm9ycyA9IFsKCQkJCQki
bHYwX21pbWFnZV8wIiwgMCwKCQkJCQkibHYwX21pbWFnZV8xIiwgMAoJCQkJXQoJCQl9CgkJ
fQoKCQlsdjBfbWltYWdlXzAgewoJCQlpZCA9ICJ2aTJCWnAtMVc5Vy1UNDJTLUFYNncta0lx
Qy1iTXRuLWJPdHhkUSIKCQkJc3RhdHVzID0gWyJSRUFEIiwgIldSSVRFIl0KCQkJc2VnbWVu
dF9jb3VudCA9IDEKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4
dGVudF9jb3VudCA9IDEJIyA0IE1lZ2FieXRlcwoKCQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJ
CXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXIKCgkJCQlzdHJpcGVzID0gWwoJCQkJCSJwdjAi
LCAwCgkJCQldCgkJCX0KCQl9CgoJCWx2MF9taW1hZ2VfMSB7CgkJCWlkID0gIkcwU3FGVi1Z
VzNLLUMzM1UtemwySS1Qdkc4LVFHdXMtaTBpdnpuIgoJCQlzdGF0dXMgPSBbIlJFQUQiLCAi
V1JJVEUiXQoJCQlzZWdtZW50X2NvdW50ID0gMQoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRf
ZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2NvdW50ID0gMQkjIDQgTWVnYWJ5dGVzCgoJCQkJdHlw
ZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxpbmVhcgoKCQkJCXN0cmlw
ZXMgPSBbCgkJCQkJInB2MSIsIDAKCQkJCV0KCQkJfQoJCX0KCX0KfQo=
--------------080302060604090203030008
Content-Type: text/plain;
 name="testvg0-lvcreate-anywhere.vg"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="testvg0-lvcreate-anywhere.vg"

IyBHZW5lcmF0ZWQgYnkgTFZNMjogRnJpIFNlcCAxNSAwMTo1MzoxNCAyMDA2Cgpjb250ZW50
cyA9ICJUZXh0IEZvcm1hdCBWb2x1bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlv
biA9ICJDcmVhdGVkICpiZWZvcmUqIGV4ZWN1dGluZyAnbHZjcmVhdGUgLWwxIC1tMSAtbiBs
djAgdGVzdHZnMCciCgpjcmVhdGlvbl9ob3N0ID0gInRldHN1by5sYWIiCSMgTGludXggdGV0
c3VvLmxhYiAyLjYuOS00Mi5FTHNtcCAjMSBTTVAgV2VkIEp1bCAxMiAyMzoyNzoxNyBFRFQg
MjAwNiBpNjg2CmNyZWF0aW9uX3RpbWUgPSAxMTU4Mjk5NTk0CSMgRnJpIFNlcCAxNSAwMTo1
MzoxNCAyMDA2Cgp0ZXN0dmcwIHsKCWlkID0gIlV4VlZHNS1INnhRLVZTQm4tMlJMRi14S0tY
LVIwZTYtWElSWjdqIgoJc2Vxbm8gPSAxCglzdGF0dXMgPSBbIlJFU0laRUFCTEUiLCAiUkVB
RCIsICJXUklURSJdCglleHRlbnRfc2l6ZSA9IDgxOTIJCSMgNCBNZWdhYnl0ZXMKCW1heF9s
diA9IDAKCW1heF9wdiA9IDAKCglwaHlzaWNhbF92b2x1bWVzIHsKCgkJcHYwIHsKCQkJaWQg
PSAiYjN2bUpLLUV6NlItWmVtUS03SU1wLVhpZDMtUFhYdS1wcXpJRWMiCgkJCWRldmljZSA9
ICIvZGV2L2RtLTAiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0K
CQkJcGVfc3RhcnQgPSAzODQKCQkJcGVfY291bnQgPSA0CSMgMTYgTWVnYWJ5dGVzCgkJfQoK
CQlwdjEgewoJCQlpZCA9ICJVa2VZdmctQVI1RS1zb1NDLVBJbUctdXB5ay1PMTFTLWZrZkFO
dSIKCQkJZGV2aWNlID0gIi9kZXYvZG0tMSIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsi
QUxMT0NBVEFCTEUiXQoJCQlwZV9zdGFydCA9IDM4NAoJCQlwZV9jb3VudCA9IDQJIyAxNiBN
ZWdhYnl0ZXMKCQl9Cgl9Cgp9Cg==
--------------080302060604090203030008--

Message-ID: <4526D08C.8010303@ce.jp.nec.com>
Date: Fri, 06 Oct 2006 17:54:20 -0400
From: "Jun'ichi Nomura" <j-nomura@ce.jp.nec.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------000909020806070208090901"
Subject: [linux-lvm] [PATCH LVM2] (0/3) 'cling' allocation policy
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
To: linux-lvm@redhat.com, Alasdair Kergon <agk@redhat.com>

This is a multi-part message in MIME format.
--------------000909020806070208090901
Content-Type: text/plain; charset=ISO-2022-JP
Content-Transfer-Encoding: 7bit

Hi,

These series of patches implement 'cling' allocation policy.
Patches are applicable to LVM2 2.02.10.

In current implementation, 'normal' policy allows the allocation
like this (output of lvs -a -o+devices):
  LV             Devices
  lv0            lv0_mimage_0(0),lv0_mimage_1(0)
  [lv0_mimage_0] /dev/sdb(0)
  [lv0_mimage_0] /dev/sda(2)
  [lv0_mimage_1] /dev/sda(0)
  [lv0_mimage_1] /dev/sdb(2)
  [lv0_mlog]     /dev/sdc(0)
  dummy1         /dev/sda(1)
  dummy2         /dev/sdb(1)
  dummy3         /dev/sdc(1)

You see /dev/sda is used for both lv0_mimage_0 and lv0_mimage_1.
If this disk breaks, you lose the whole LV.

In this case, what I think is better is something like this:
  LV             Devices
  lv0            lv0_mimage_0(0),lv0_mimage_1(0)
  [lv0_mimage_0] /dev/sdb(0)
  [lv0_mimage_0] /dev/sdb(2)
  [lv0_mimage_1] /dev/sda(0)
  [lv0_mimage_1] /dev/sda(2)
  [lv0_mlog]     /dev/sdc(0)
  dummy1         /dev/sda(1)
  dummy2         /dev/sdb(1)
  dummy3         /dev/sdc(1)

With these patches, 'normal' allocation tries to do the latter first.

Attached is a VG metadata as a testcase.

Thanks,
-- 
Jun'ichi Nomura, NEC Corporation of America

--------------000909020806070208090901
Content-Type: text/plain;
 name="testvg0_alloc-cling.vg"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="testvg0_alloc-cling.vg"

IyBHZW5lcmF0ZWQgYnkgTFZNMjogU2F0IE9jdCAgNyAwMTo1NjoyMyAyMDA2Cgpjb250ZW50
cyA9ICJUZXh0IEZvcm1hdCBWb2x1bWUgR3JvdXAiCnZlcnNpb24gPSAxCgpkZXNjcmlwdGlv
biA9ICJDcmVhdGVkICpiZWZvcmUqIGV4ZWN1dGluZyAnbHZleHRlbmQgLWwrMSB0ZXN0dmcw
L2x2MCciCgpjcmVhdGlvbl9ob3N0ID0gInRldHN1by5sYWIiCSMgTGludXggdGV0c3VvLmxh
YiAyLjYuOS00Mi5FTHNtcCAjMSBTTVAgV2VkIEp1bCAxMiAyMzoyNzoxNyBFRFQgMjAwNiBp
Njg2CmNyZWF0aW9uX3RpbWUgPSAxMTYwMjAwNTgzCSMgU2F0IE9jdCAgNyAwMTo1NjoyMyAy
MDA2Cgp0ZXN0dmcwIHsKCWlkID0gIjFxOHV5MS1IZ3BPLUpwUUstRHZuNC1TWWxRLXI0NTIt
WVFhMFAwIgoJc2Vxbm8gPSA3CglzdGF0dXMgPSBbIlJFU0laRUFCTEUiLCAiUkVBRCIsICJX
UklURSJdCglleHRlbnRfc2l6ZSA9IDgxOTIJCSMgNCBNZWdhYnl0ZXMKCW1heF9sdiA9IDAK
CW1heF9wdiA9IDAKCglwaHlzaWNhbF92b2x1bWVzIHsKCgkJcHYwIHsKCQkJaWQgPSAiRWtB
aGVVLUU0MlMtbmhtYi1oM0xCLUNHRUctNE52WC1mMFBiRlAiCgkJCWRldmljZSA9ICIvZGV2
L2RtLTAiCSMgSGludCBvbmx5CgoJCQlzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KCQkJcGVf
c3RhcnQgPSAzODQKCQkJcGVfY291bnQgPSA0CSMgMTYgTWVnYWJ5dGVzCgkJfQoKCQlwdjEg
ewoJCQlpZCA9ICJFZTdxakMtcXRObS1UQmQ0LXFsMTktYVJaZy1tQ1hrLUNDczVVayIKCQkJ
ZGV2aWNlID0gIi9kZXYvZG0tMSIJIyBIaW50IG9ubHkKCgkJCXN0YXR1cyA9IFsiQUxMT0NB
VEFCTEUiXQoJCQlwZV9zdGFydCA9IDM4NAoJCQlwZV9jb3VudCA9IDQJIyAxNiBNZWdhYnl0
ZXMKCQl9CgoJCXB2MiB7CgkJCWlkID0gIjN3dmdrTy03cDFaLXlvSHktc3RXNC1aWTNwLVZI
ZzEtRFFlOWQ3IgoJCQlkZXZpY2UgPSAiL2Rldi9kbS0yIgkjIEhpbnQgb25seQoKCQkJc3Rh
dHVzID0gWyJBTExPQ0FUQUJMRSJdCgkJCXBlX3N0YXJ0ID0gMzg0CgkJCXBlX2NvdW50ID0g
NAkjIDE2IE1lZ2FieXRlcwoJCX0KCX0KCglsb2dpY2FsX3ZvbHVtZXMgewoKCQlsdjAgewoJ
CQlpZCA9ICJSSVdNa0Itc2xjTi00WnRBLWlWcmQtSElaTy1QRU8yLVozb21tcCIKCQkJc3Rh
dHVzID0gWyJSRUFEIiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJCQlzZWdtZW50X2NvdW50ID0g
MQoKCQkJc2VnbWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2NvdW50
ID0gMQkjIDQgTWVnYWJ5dGVzCgoJCQkJdHlwZSA9ICJtaXJyb3IiCgkJCQltaXJyb3JfY291
bnQgPSAyCgkJCQltaXJyb3JfbG9nID0gImx2MF9tbG9nIgoJCQkJcmVnaW9uX3NpemUgPSAx
MDI0CgoJCQkJbWlycm9ycyA9IFsKCQkJCQkibHYwX21pbWFnZV8wIiwgMCwKCQkJCQkibHYw
X21pbWFnZV8xIiwgMAoJCQkJXQoJCQl9CgkJfQoKCQlkdW1teTEgewoJCQlpZCA9ICJUbGZD
U0cta3prTi1mdjY1LXhkNWctSHBiMC1JM2RHLWs3VVZBSiIKCQkJc3RhdHVzID0gWyJSRUFE
IiwgIldSSVRFIiwgIlZJU0lCTEUiXQoJCQlzZWdtZW50X2NvdW50ID0gMQoKCQkJc2VnbWVu
dDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2NvdW50ID0gMQkjIDQgTWVn
YWJ5dGVzCgoJCQkJdHlwZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkjIGxp
bmVhcgoKCQkJCXN0cmlwZXMgPSBbCgkJCQkJInB2MCIsIDEKCQkJCV0KCQkJfQoJCX0KCgkJ
ZHVtbXkyIHsKCQkJaWQgPSAiaFd5WWNwLUZEMEotSmlGeS1kemlJLWcwRlotQmVncy1hWUVi
SjIiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklURSIsICJWSVNJQkxFIl0KCQkJc2VnbWVu
dF9jb3VudCA9IDEKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4dGVudCA9IDAKCQkJCWV4
dGVudF9jb3VudCA9IDEJIyA0IE1lZ2FieXRlcwoKCQkJCXR5cGUgPSAic3RyaXBlZCIKCQkJ
CXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXIKCgkJCQlzdHJpcGVzID0gWwoJCQkJCSJwdjEi
LCAxCgkJCQldCgkJCX0KCQl9CgoJCWR1bW15MyB7CgkJCWlkID0gIk5oSUoyNi0wN3cwLU9B
NmQtWkUxNC1nZWd4LW5WVzgtWVJNNXZxIgoJCQlzdGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUi
LCAiVklTSUJMRSJdCgkJCXNlZ21lbnRfY291bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlz
dGFydF9leHRlbnQgPSAwCgkJCQlleHRlbnRfY291bnQgPSAxCSMgNCBNZWdhYnl0ZXMKCgkJ
CQl0eXBlID0gInN0cmlwZWQiCgkJCQlzdHJpcGVfY291bnQgPSAxCSMgbGluZWFyCgoJCQkJ
c3RyaXBlcyA9IFsKCQkJCQkicHYyIiwgMQoJCQkJXQoJCQl9CgkJfQoKCQlsdjBfbWxvZyB7
CgkJCWlkID0gIk9QN3BWSS1Db2wwLXZLYlQtWndhci1NN0NDLWRaaVAtV2tWNzQwIgoJCQlz
dGF0dXMgPSBbIlJFQUQiLCAiV1JJVEUiXQoJCQlzZWdtZW50X2NvdW50ID0gMQoKCQkJc2Vn
bWVudDEgewoJCQkJc3RhcnRfZXh0ZW50ID0gMAoJCQkJZXh0ZW50X2NvdW50ID0gMQkjIDQg
TWVnYWJ5dGVzCgoJCQkJdHlwZSA9ICJzdHJpcGVkIgoJCQkJc3RyaXBlX2NvdW50ID0gMQkj
IGxpbmVhcgoKCQkJCXN0cmlwZXMgPSBbCgkJCQkJInB2MiIsIDAKCQkJCV0KCQkJfQoJCX0K
CgkJbHYwX21pbWFnZV8wIHsKCQkJaWQgPSAiMlRXdU5hLTM3UzItMW00Ty1TQzAyLXVERXEt
NWwxTy1BVDNDY0kiCgkJCXN0YXR1cyA9IFsiUkVBRCIsICJXUklURSJdCgkJCXNlZ21lbnRf
Y291bnQgPSAxCgoJCQlzZWdtZW50MSB7CgkJCQlzdGFydF9leHRlbnQgPSAwCgkJCQlleHRl
bnRfY291bnQgPSAxCSMgNCBNZWdhYnl0ZXMKCgkJCQl0eXBlID0gInN0cmlwZWQiCgkJCQlz
dHJpcGVfY291bnQgPSAxCSMgbGluZWFyCgoJCQkJc3RyaXBlcyA9IFsKCQkJCQkicHYxIiwg
MAoJCQkJXQoJCQl9CgkJfQoKCQlsdjBfbWltYWdlXzEgewoJCQlpZCA9ICJTMkVLSG4tQ3Jv
Vy1hRlM3LXB0RjUtbVlVby1EdVl0LU5tVDFZRCIKCQkJc3RhdHVzID0gWyJSRUFEIiwgIldS
SVRFIl0KCQkJc2VnbWVudF9jb3VudCA9IDEKCgkJCXNlZ21lbnQxIHsKCQkJCXN0YXJ0X2V4
dGVudCA9IDAKCQkJCWV4dGVudF9jb3VudCA9IDEJIyA0IE1lZ2FieXRlcwoKCQkJCXR5cGUg
PSAic3RyaXBlZCIKCQkJCXN0cmlwZV9jb3VudCA9IDEJIyBsaW5lYXIKCgkJCQlzdHJpcGVz
ID0gWwoJCQkJCSJwdjAiLCAwCgkJCQldCgkJCX0KCQl9Cgl9Cn0K
--------------000909020806070208090901--

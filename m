From: Adrian Head <ahead@bigpond.net.au>
MIME-Version: 1.0
Content-Type: Multipart/Mixed;
    boundary="------------Boundary-00=_88YXYKDH4JI8V9O7UVAD"
Message-Id: <E16XErl-0007zh-00@hermes.sistina.com>
Subject: [linux-lvm] LVM1 & XFS
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
Date: Sat Feb  2 23:08:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-xfs@oss.sgi.com, linux-lvm@sistina.com

--------------Boundary-00=_88YXYKDH4JI8V9O7UVAD
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 8bit

This is just a heads up for others...

Early 2002 I was trying to get LVM1, ext3, resierfs & XFS coexisting.  The 
SGI guys were able to generate a patch that fixed issues with LVM & XFS which 
can be found in the mailing list archives and modified lvm-snap.c.  At that 
time I was able to run a series of tests by hand and everything was OK; 
whereas if I put the cammands in a script it would die a death.  Because of 
other priorities I had to leave this ... so since LVM-1.0.2 was out and the 
XFS CVS keeps marching along and I had a few hours to spare I thought I would 
see if any of the issues have been resolved.

I have got the latest XFS from CVS (2002-02-02) and the latest LVM (1.0.2) 
from CVS and ran through my tests.  The tests outline follows:

# This is to test operational aspects of LVM
#  1.  Create LV
#  2.  mkfs on LV
#  3.  mount LV
#  3a. ls LV
#  4.  copy data onto LV
#  4a  ls LV
#  5.  copy data across LV
#  5a  ls LV
#  6.  copy data off LV
#  6a  ls LV
#  7.  overfill LV
#  7a. ls LV
#  8.  create snapshot
#  9.  mount snapshot
#  10. ls snapshot
#  11. overfill snapshot
#  12. ls snapshot

There still seems to be problems as I can run the tests by hand successfully 
but as soon as I put the commands in a script I get Oopses.

The positive side is that LVM-1.0.2 is way more robust than LVM-1.0.1 as when 
overflowing the snapshot fails; there are no kernel panics on the next reboot 
and no need for rescuing the LV associated with the snapshot.  However, when 
it does Oops it seems to hold the original LV open and therefore, the LV 
cannot be umounted properly - a reboot is the only way of getting the LV back 
to a usable state.

I have tried both vanilla linux-xfs+lvm-1.0.2 as well as 
linux-xfs+lvm-1.0.2+lvm-snap.c.patch and it still dies in the same place but 
the backtraces are different.  

The question I would like to ask any LVM gurus is why would there be a 
difference between running the tests by hand and running them in a script?

Attached is the test script...

-- 
Adrian Head

(Public Key available on request.)
--------------Boundary-00=_88YXYKDH4JI8V9O7UVAD
Content-Type: application/x-shellscript;
  name="lvm_test.sh"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="lvm_test.sh"

IyEvYmluL3NoCgojIFRoaXMgaXMgdG8gdGVzdCBvcGVyYXRpb25hbCBhc3BlY3RzIG9mIExWTQoj
ICAxLiAgQ3JlYXRlIExWCiMgIDIuICBta2ZzIG9uIExWCiMgIDMuICBtb3VudCBMVgojICAzYS4g
bHMgTFYKIyAgNC4gIGNvcHkgZGF0YSBvbnRvIExWCiMgIDRhICBscyBMVgojICA1LiAgY29weSBk
YXRhIGFjcm9zcyBMVgojICA1YSAgbHMgTFYKIyAgNi4gIGNvcHkgZGF0YSBvZmYgTFYKIyAgNmEg
IGxzIExWCiMgIDcuICBvdmVyZmlsbCBMVgojICA3YS4gbHMgTFYKIyAgOC4gIGNyZWF0ZSBzbmFw
c2hvdAojICA5LiAgbW91bnQgc25hcHNob3QKIyAgMTAuIGxzIHNuYXBzaG90CiMgIDExLiBvdmVy
ZmlsbCBzbmFwc2hvdAojICAxMi4gbHMgc25hcHNob3QKCmVjaG8gQWJvdXQgdG8gY3JlYXRlIFRF
U1QgTFYuLi4KbHZjcmVhdGUgLUwgMUcgLW4gVEVTVCAvZGV2L0hEQQplY2hvIFRFU1QgTFYgc2hv
dWxkIGhhdmUgYmVlbiBjcmVhdGVkLi4uCgplY2hvIEFib3V0IHRvIG1rZnMgb24gVEVTVCBMVi4u
Lgpta2ZzIC10IHhmcyAvZGV2L0hEQS9URVNUCmVjaG8gbWtmcyBzaG91bGQgaGF2ZSBiZWVuIHJ1
biBvbiBURVNUIExWLi4uCgplY2hvIEFib3V0IHRvIG1vdW50IFRFU1QgTFYuLi4KbW91bnQgLXQg
eGZzIC9kZXYvSERBL1RFU1QgL21udC90ZXN0CnRhaWwgL3Zhci9sb2cvbWVzc2FnZXMKZWNobyBU
RVNUIExWIHNob3VsZCBoYXZlIGJlZW4gbW91bnRlZC4uLgoKY2QgL21udC90ZXN0CgplY2hvIEFi
b3V0IHRvIGxzIFRFU1QgTFYuLi4KbHMgLWxhaAoKZWNobyBBYm91dCB0byBjb3B5IGRhdGEgdG8g
VEVTVCBMVi4uLgpjcCAvY2hyb290LzAxLnRhci5iejIgL21udC90ZXN0CmNwIC9jaHJvb3QvTUQ1
U1VNIC9tbnQvdGVzdAplY2hvIDI2ME0gb2YgZGF0YSBzaG91bGQgaGF2ZSBiZWVuIGNvcGllZC4u
LgoKZWNobyBBYm91dCB0byB2ZXJpZnkgZGF0YSBvbiBURVNUIExWLi4uCm1kNXN1bSAvbW50L3Rl
c3QvMDEudGFyLmJ6MgpjYXQgL21udC90ZXN0L01ENVNVTQplY2hvIC4uLiB3ZWxsIGFyZSB0aGV5
IGRpZmZlcmVudD8KCmVjaG8gQWJvdXQgdG8gY29weSBkYXRhIGFjcm9zcyB0aGUgVEVTVCBMVi4u
Lgp0YXIgLWp4ZiAwMS50YXIuYnoyCmxzIC1sYWgKdGFyIC1qY2YgMDIudGFyLmJ6MiAwMQpscyAt
bGFoCm1kNXN1bSAwMi50YXIuYnoyCmNhdCAvbW50L3Rlc3QvTUQ1U1VNCgplY2hvIEFib3V0IHRv
IG92ZXJmbG93IFRFU1QgTFYuLi4KY3AgLWZyIDAxIDAyID4vZGV2L251bGwgIDI+JjEKZWNobyBz
aG91bGQgc3RpbGwgYmUgc3RhbmRpbmcuLi4KCmxzIC1sYWgKCmVjaG8gQ29vbCAtIHN0aWxsIHN0
YW5kaW5nLi4uCgplY2hvIEFib3V0IHRvIGNsZWFuLXVwLi4uCnJtIC1mciAwMgoKZWNobyBBYm91
dCB0byBjcmVhdGUgc25hcHNob3QuLi4KbHZjcmVhdGUgLUw1ME0gLXMgLW4gU05BUCAvZGV2L0hE
QS9URVNUCmVjaG8gc25hcHNob3QgTFYgc2hvdWxkIGhhdmUgYmVlbiBjcmVhdGVkLi4uCgplY2hv
IEFib3V0IHRvIG1vdW50IHNuYXBzaG90Li4uCm1vdW50IC10IHhmcyAtbyBub3V1aWQsbm9yZWNv
dmVyeSAvZGV2L0hEQS9TTkFQIC9tbnQvc25hcHNob3QKZWNobyBTbmFwc2hvdCBzaG91bGQgaGF2
ZSBiZWVuIG1vdW50ZWQuLi4KCmVjaG8gQWJvdXQgdG8gbHMgc25hcHNob3QuLi4KbHMgLWxhaCAv
bW50L3NuYXBzaG90CgplY2hvIEFib3V0IHRvIG92ZXJmbG93IHNuYXBzaG90Li4uCmNwIC1mciAw
MSAwMiA+L2Rldi9udWxsICAyPiYxCmVjaG8gc2hvdWxkIHN0aWxsIGJlIHN0YW5kaW5nLi4uCgps
cyAtbGFoCgplY2hvIENvb2wgLSBzdGlsbCBzdGFuZGluZy4uLgoKZWNobyBBYm91dCB0byBjbGVh
bi11cC4uLgpybSAtZnIgMDIKCmVjaG8gQ29vbCAtIHN0aWxsIHN0YW5kaW5nLi4uCgplY2hvIGxl
dHMgY2xlYW4gdXAgZXZlcnl0aGluZy4uLgoKY2QgLwp1bW91bnQgL21udC9zbmFwc2hvdAp1bW91
bnQgL21udC90ZXN0Cmx2cmVtb3ZlIC1mIC9kZXYvSERBL1NOQVAKbHZyZW1vdmUgLWYgL2Rldi9I
REEvVEVTVAoKZWNobyBhbGwgZmluaXNoZWQuLi4=

--------------Boundary-00=_88YXYKDH4JI8V9O7UVAD--

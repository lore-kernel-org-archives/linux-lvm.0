Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p9IHDjDJ028608
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 13:13:45 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p9IHDi1U011781
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 13:13:44 -0400
Received: by iaek3 with SMTP id k3so1353043iae.33
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2011 10:13:44 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 18 Oct 2011 19:13:43 +0200
Message-ID: <CAGRgLy6mHYGGS-ydGCx_mWGuKE31TLu5xnAzkAb6ZoEHjzPW+A@mail.gmail.com>
From: Alexander Lyakas <alex.bolshoy@gmail.com>
Content-Type: multipart/mixed; boundary=001517740aba7dd80c04af95d806
Subject: [linux-lvm] Changing dev_t-devname mapping in lvmlib seems to be
	problematic
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

--001517740aba7dd80c04af95d806
Content-Type: text/plain; charset=ISO-8859-1

Hello Zdenek,
I am testing a following scenario:

I have 5 dm-linear devices, which I have setup manually using dmsetup.
Their table points at some local disks, like this:
/dev/mapper/alex0 => /dev/sda
/dev/mapper/alex1 => /dev/sdb

I create a VG on top of these 5 dm devices, using pvcreate and then
lvmlib APIs. The VG has no LVs at this point.
Later I teardown all the dm devices (using dmsetup remove).
Then I recreate the 5 dm devices, I give them the same names and setup
the same linear tables.

The difference is that I create them in different order.
So, for example, previously I had /dev/mapper/alex0 pointing at
/dev/sda, and it's real devnode was /dev/dm-0 (251:0), now
/dev/mapper/alex0 still points at /dev/sda, but its devnode is
/dev/dm-1 (251:1).
The names that I feed to LVM are always  /dev/mapper/alex0,
/dev/mapper/alex1 ...

In my application (at present) the lvm_t handle is not closed until
the application exits.

The issue that I see is in _cache.devices handling: it maps devt to
'struct device*' objects. So when searching for 251:1, a stale entry
for 251:1 is found (former /dev/mapper/alex1). So it contains an old
list of aliases in dev->aliases, and now a new name is added there, so
it contains now both /dev/mapper/alex0 and /dev/mapper/alex1 (and also
other names)...

In addition, this entry has dev->pvid of the /dev/mapper/alex1 PV.

Further I see a call to lvmcache_add with the following parameters:
pvid = correct pvid of /dev/mapper/alex0 (pointing at /dev/sda)
dev->pvid = the pvid of /dev/mapper/alex1

As a result, the _pvid_hash gets messed up...basically it ends up
having 4 PVs instead of 5. I am attaching a text file, which traces
the contents of the _pvid_hash during lvmcache_add call (I added some
prints there).

So it looks like having an open lib_t handle cannot survive such a
change in dev_t.

I have a couple of questions:
- Is my analysis (at least more or less) correct?
- Is this generally a bad idea to have dm-linear devices for PVs? (I
guarantee that dm-linear table is always setup correctly).
- Will using a fresh lib_t handle for each LVM operation solve this
issue? Because the command-line tools, when invoked, seem to work fine
(and they build a fresh cache each time). I will guarantee that nobody
else touches relevant dm devices during the LVM operation.
- I also see that LVM scans devices like /dev/disk/by-id... while in
lvm.conf I set the filter to accept only /dev/mapper/alex (all others
I set to reject). What am I missing?

Thanks for your help,
  Alex.

--001517740aba7dd80c04af95d806
Content-Type: text/plain; charset=US-ASCII; name="analysis_zdenek.txt"
Content-Disposition: attachment; filename="analysis_zdenek.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gtx5hb8f0

bHZtY2FjaGVfYWRkCk9jdCAxOCAxODowMToxOCB2Yy0wLTAtNy0wMS0tbmlnaHRseS0tMTE4IHBy
b2c6ICYmJiYmJiYmJiYgQmVmb3JlOiBwdmlkPTV4MkpReEtpNkdHM010dzBaclgyWVBSOVJDYVlV
MFoxLCBkZXY9MjUxOjUsIGRldi0+cHZpZD1DeDRnSzFOd1czSVVHVTdEajFUdzRUWEgwRzY1Zncy
UQoKX3B2aWRfaGFzaCBiZWZvcmU6Ck9jdCAxOCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzog
JiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4NzIyMTM4OiBrZXk9UFl6aXhmbUxURGRwSnJDUjY3a1Za
VEJDN1VTSlkwd3ksIHB2aWQ9UFl6aXhmbUxURGRwSnJDUjY3a1ZaVEJDN1VTSlkwd3ksIDI1MTo5
Ck9jdCAxOCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZv
IDB4NzBiMmE4OiBrZXk9Q3g0Z0sxTndXM0lVR1U3RGoxVHc0VFhIMEc2NWZ3MlEsIHB2aWQ9Q3g0
Z0sxTndXM0lVR1U3RGoxVHc0VFhIMEc2NWZ3MlEsIDI1MTo1Ck9jdCAxOCAxODowMToxOSBuaWdo
dGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4NzIxZDk4OiBrZXk9NXgySlF4
S2k2R0czTXR3MFpyWDJZUFI5UkNhWVUwWjEsIHB2aWQ9NXgySlF4S2k2R0czTXR3MFpyWDJZUFI5
UkNhWVUwWjEsIDI1MTozCk9jdCAxOCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYm
JiBsdm1jYWNoZV9pbmZvIDB4NzBiOWM4OiBrZXk9UUZ4OUIycGNFSEV6Z2JHSW1jVFBwWGVkUk9z
eDB0OXosIHB2aWQ9UUZ4OUIycGNFSEV6Z2JHSW1jVFBwWGVkUk9zeDB0OXosIDI1MToxCk9jdCAx
OCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4NzVh
ZWI4OiBrZXk9YW1mMGxPQ29hSnlvWENrZnNDYUJrV0RKaGdpcmN1ZlosIHB2aWQ9YW1mMGxPQ29h
SnlvWENrZnNDYUJrV0RKaGdpcmN1ZlosIDI1MTo3CgonZXhpc3RpbmcnIHBvaW50ZXI6Ck9jdCAx
OCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4NzIx
ZDk4OiBrZXk9NXgySlF4S2k2R0czTXR3MFpyWDJZUFI5UkNhWVUwWjEsIHB2aWQ9NXgySlF4S2k2
R0czTXR3MFpyWDJZUFI5UkNhWVUwWjEsIDI1MTozCgpFcnJvciBtZXNzYWdlOgpPY3QgMTggMTg6
MDk6MTggbmlnaHRseS0tMTE4IHByb2c6IEZvdW5kIGR1cGxpY2F0ZSBQViA1eDJKUXhLaTZHRzNN
dHcwWnJYMllQUjlSQ2FZVTBaMTogdXNpbmcgL2Rldi9tYXBwZXIvdnBhcnQtNTI0ODEgbm90IC9k
ZXYvZGlzay9ieS1pZC9kbS1uYW1lLXZwYXJ0LTUyNDgxCgpleGlzdGluZy0+ZGV2ID0gZGV2Ck9j
dCAxOCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4
NzIxZDk4OiBrZXk9NXgySlF4S2k2R0czTXR3MFpyWDJZUFI5UkNhWVUwWjEsIGRldi0+cHZpZD1D
eDRnSzFOd1czSVVHVTdEajFUdzRUWEgwRzY1ZncyUSwgMjUxOjUKCl9sdm1jYWNoZV91cGRhdGVf
cHZpZDoKcmVtb3ZlIGVudHJ5IHdpdGgga2V5IEN4NGdLMU53VzNJVUdVN0RqMVR3NFRYSDBHNjVm
dzJRCl9wdmlkX2hhc2g6Ck9jdCAxOCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYm
JiBsdm1jYWNoZV9pbmZvIDB4NzIyMTM4OiBrZXk9UFl6aXhmbUxURGRwSnJDUjY3a1ZaVEJDN1VT
Slkwd3ksIHB2aWQ9UFl6aXhmbUxURGRwSnJDUjY3a1ZaVEJDN1VTSlkwd3ksIDI1MTo5Ck9jdCAx
OCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4NzIx
ZDk4OiBrZXk9NXgySlF4S2k2R0czTXR3MFpyWDJZUFI5UkNhWVUwWjEsIHB2aWQ9NXgySlF4S2k2
R0czTXR3MFpyWDJZUFI5UkNhWVUwWjEsIDI1MTozCk9jdCAxOCAxODowMToxOSBuaWdodGx5LS0x
MTggcHJvZzogJiYmJiYmJiBsdm1jYWNoZV9pbmZvIDB4NzBiOWM4OiBrZXk9UUZ4OUIycGNFSEV6
Z2JHSW1jVFBwWGVkUk9zeDB0OXosIHB2aWQ9UUZ4OUIycGNFSEV6Z2JHSW1jVFBwWGVkUk9zeDB0
OXosIDI1MToxCk9jdCAxOCAxODowMToxOSBuaWdodGx5LS0xMTggcHJvZzogJiYmJiYmJiBsdm1j
YWNoZV9pbmZvIDB4NzVhZWI4OiBrZXk9YW1mMGxPQ29hSnlvWENrZnNDYUJrV0RKaGdpcmN1Zlos
IHB2aWQ9YW1mMGxPQ29hSnlvWENrZnNDYUJrV0RKaGdpcmN1ZlosIDI1MTo3CgonaW5mbycgcG9p
bnRlciBnZXRzIGRldi0+cHZpZCB1cGRhdGVkOgpPY3QgMTggMTg6MDE6MTkgbmlnaHRseS0tMTE4
IHByb2c6ICYmJiYmJiYgbHZtY2FjaGVfaW5mbyAweDcyMWQ5ODoga2V5PTV4MkpReEtpNkdHM010
dzBaclgyWVBSOVJDYVlVMFoxLCBkZXYtPnB2aWQ9IjV4MkpReEtpNkdHM010dzBaclgyWVBSOVJD
YVlVMFoxIiwgMjUxOjUKCnRyeWluZyB0byBpbnNlcnQgJ2luZm8nLCBidXQgYW5vdGhlciBlbnRy
eSB3aXRoIHRoZSBzYW1lIGtleSBhbHJlYWR5IGV4aXN0cy4uLgoKZnJvbSBoZXJlIHdlIGJhc2lj
YWxseSBsb3N0IG9uZSBQViBpbiBfcHZpZF9oYXNoCgoKCg==
--001517740aba7dd80c04af95d806--

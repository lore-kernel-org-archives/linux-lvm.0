Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m56ITPjk010794
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 14:29:26 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.158])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m56ISubm001252
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2008 14:28:56 -0400
Received: by fg-out-1718.google.com with SMTP id e21so886202fga.7
	for <linux-lvm@redhat.com>; Fri, 06 Jun 2008 11:28:55 -0700 (PDT)
Message-ID: <c7009a550806061128qae308cft58cb4e1386985cd@mail.gmail.com>
Date: Fri, 6 Jun 2008 11:28:55 -0700
From: "Jarrod Millman" <millman@berkeley.edu>
Sender: millman.ucb@gmail.com
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_16223_29296543.1212776935636"
Subject: [linux-lvm] lost /etc/lvm
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

------=_Part_16223_29296543.1212776935636
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

I have two large devices /dev/sdc and /dev/sdd, which both have lvm.
Yesterday the OS was reinstalled and /etc/lvm was overwritten (there
is no backup).  It also looks like anaconda placed a new disk label on
the two devices.  Fortunately, I was able to reconstruct a backup of
the lvm metadata for /dev/sdd, but am not sure how to do this for
/dev/sdc.  I believe I know what the metadata for /dev/sdc is, but I
don't know what any of the uuids are.  My basic question is whether I
can possibly create new uuids without totally hosing the system.

Let me explain what I did for /dev/sdd and what I am considering to /dev/sdc:

1. Created a new file containing the metadata for the volume group
called jetstor1 on /dev/sdd and put it in /etc/lvm/backup.  I was able
to find this information on the disk using:
 strings /dev/sdd

2. Removed the disk label on /dev/sdd using:
 dd if=/dev/zero of=/dev/sdd bs=1k count=1

3.  Used pvcreate to restore the metadata:
 pvcreate -u <snip: the pv uuid I recovered> /dev/sdd

4.  Restored the volume description using:
 vgcfgrestore -f jetstor1 jetstor1

5. Made the volume activate using:
 vgchange -ay

This process worked just fine for /dev/sdd, but 'strings /dev/sdc'
doesn't contain any backup of the metadata for some reason.  I believe
I know what all the information should be except for the uuids.  So my
question is can I just make up new uuids and if so how.  I have
attached what I believe the backup should be with the exception of not
knowing the uuids.

Thanks,

-- 
Jarrod Millman
Computational Infrastructure for Research Labs
10 Giannini Hall, UC Berkeley
phone: 510.643.4014
http://cirl.berkeley.edu/

------=_Part_16223_29296543.1212776935636
Content-Type: application/octet-stream; name=jetstor0
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fh542gey0
Content-Disposition: attachment; filename=jetstor0

Y29udGVudHMgPSAiVGV4dCBGb3JtYXQgVm9sdW1lIEdyb3VwIgp2ZXJzaW9uID0gMQoKamV0c3Rv
cjAgewogICAgICAgIGlkID0gIjxub3Qga25vd24+IgogICAgICAgIHNlcW5vID0gMgogICAgICAg
IHN0YXR1cyA9IFsiUkVTSVpFQUJMRSIsICJSRUFEIiwgIldSSVRFIl0KICAgICAgICBleHRlbnRf
c2l6ZSA9IDgxOTIgICAgICAgICAgICAgICMgNCBNZWdhYnl0ZXMKICAgICAgICBtYXhfbHYgPSAw
CiAgICAgICAgbWF4X3B2ID0gMAoKICAgICAgICBwaHlzaWNhbF92b2x1bWVzIHsKCiAgICAgICAg
ICAgICAgICBwdjAgewogICAgICAgICAgICAgICAgICAgICAgICBpZCA9ICI8bm90IGtub3duPiIg
CiAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZSA9ICIvZGV2L3NkYyIgICAgICMgSGludCBv
bmx5CgogICAgICAgICAgICAgICAgICAgICAgICBzdGF0dXMgPSBbIkFMTE9DQVRBQkxFIl0KICAg
ICAgICAgICAgICAgICAgICAgICAgZGV2X3NpemUgPSAyNTM5NTgxNDkxMiAgIyAxMS44MjU4IFRl
cmFieXRlcwogICAgICAgICAgICAgICAgICAgICAgICBwZV9zdGFydCA9IDM4NAogICAgICAgICAg
ICAgICAgICAgICAgICBwZV9jb3VudCA9IDMxMDAwNzUgICAgICAjIDExLjgyNTggVGVyYWJ5dGVz
CiAgICAgICAgICAgICAgICB9CiAgICAgICAgfQoKICAgICAgICBsb2dpY2FsX3ZvbHVtZXMgewoK
ICAgICAgICAgICAgICAgIHJhaWQwIHsKICAgICAgICAgICAgICAgICAgICAgICAgaWQgPSAiPG5v
dCBrbm93bj4iCiAgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9IFsiUkVBRCIsICJXUklU
RSIsICJWSVNJQkxFIl0KICAgICAgICAgICAgICAgICAgICAgICAgc2VnbWVudF9jb3VudCA9IDEK
CiAgICAgICAgICAgICAgICAgICAgICAgIHNlZ21lbnQxIHsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBzdGFydF9leHRlbnQgPSAwCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZXh0ZW50X2NvdW50ID0gMzEwMDA3NSAgIyAxMS44MjU4IFRlcmFieXRlcwoKICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICB0eXBlID0gInN0cmlwZWQiCiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgc3RyaXBlX2NvdW50ID0gMSAgICAgICAgIyBsaW5lYXIKCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgc3RyaXBlcyA9IFsKICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICJwdjAiLCAwCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgXQogICAgICAgICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICB9CiAgICAgICAg
fQp9Cg==
------=_Part_16223_29296543.1212776935636--

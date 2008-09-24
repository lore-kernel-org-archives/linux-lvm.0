Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8OKbkIO002398
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 16:37:47 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.230])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m8OKaMmA006220
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 16:36:22 -0400
Received: by rv-out-0506.google.com with SMTP id f6so78712rvb.51
	for <linux-lvm@redhat.com>; Wed, 24 Sep 2008 13:36:22 -0700 (PDT)
Message-ID: <db9fa2350809241336q29572ae9xf9ff6f4b5c2ce384@mail.gmail.com>
Date: Wed, 24 Sep 2008 22:36:22 +0200
From: "Kevin Maguire" <k.c.f.maguire@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_143710_6051797.1222288582116"
Subject: [linux-lvm] problem with devices / mirrors
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

------=_Part_143710_6051797.1222288582116
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi

# lvm version
  LVM version:     2.02.17 (2006-12-14)
  Library version: 1.02.13 (2006-11-28)
  Driver version:  4.7.0
# uname -a
Linux srv1 2.6.16.60-0.27-smp #1 SMP Mon Jul 28 12:55:32 UTC 2008 x86_64
x86_64 x86_64 GNU/Linux

This is a SLES 10 based system.

I was using 2 disks, with one partiotion on each (sda5/sdb5) as PVs.

One VG (vg01) was created on these underlying PVs.

The LVs were /dev/mapper/vg01-VM--m and /dev/mapper/vg01-ISO--m

(as listed in /etc/fstab)

I don't much care about the ISO one, it was just ISO images. The VM one was
VMware virtual machines.

I needed more disk space, so I changed these to linear volumes via lvconvert
-m0. It said it worked.

There seemed to be a few "devices" left hanging around, so i removed them
with dmsetup,

dmsetup remove vg01-ISO--m_mimage_0
dmsetup remove vg01-ISO--m_mimage_1

I then tried to remove the physical volume with pvremove. It told me I had
to use "-ff" so i did.

Now things look really bad :-(

My filesystem was/is still mounted, and I am right now rsyncing the data to
another system. But this does not look good:

# lvs -P -o +devices
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  LV   VG   Attr   LSize   Origin Snap%  Move Log Copy%  Devices
  VM-m vg01 -wi-ao 125.00G                               /dev/sda5(32000)

# pvscan  -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  PV /dev/sda5        VG vg01   lvm2 [348.61 GB / 223.61 GB free]
  PV unknown device   VG vg01   lvm2 [348.61 GB / 348.61 GB free]
  Total: 2 [697.21 GB] / in use: 2 [697.21 GB] / in no VG: 0 [0   ]

# vgscan  -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Reading all physical volumes.  This may take a while...
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  Found volume group "vg01" using metadata type lvm2

# lvscan  -P
  Partial mode. Incomplete volume groups will be activated read-only.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  Couldn't find device with uuid 'jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH'.
  ACTIVE            '/dev/vg01/VM-m' [125.00 GB] inherit

Ideas and or suggestions *really* appreciated! Am I correct to be really
concerned?

Kevin

------=_Part_143710_6051797.1222288582116
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">Hi<br><br># lvm version<br>&nbsp; LVM version:&nbsp;&nbsp;&nbsp;&nbsp; 2.02.17 (2006-12-14)<br>&nbsp; Library version: 1.02.13 (2006-11-28)<br>&nbsp; Driver version:&nbsp; 4.7.0<br># uname -a<br>Linux srv1 2.6.16.60-0.27-smp #1 SMP Mon Jul 28 12:55:32 UTC 2008 x86_64 x86_64 x86_64 GNU/Linux<br>
<br>This is a SLES 10 based system.<br><br>I was using 2 disks, with one partiotion on each (sda5/sdb5) as PVs.<br><br>One VG (vg01) was created on these underlying PVs. <br><br>The LVs were /dev/mapper/vg01-VM--m and /dev/mapper/vg01-ISO--m<br>
<br>(as listed in /etc/fstab)<br><br>I don&#39;t much care about the ISO one, it was just ISO images. The VM one was VMware virtual machines.<br><br>I needed more disk space, so I changed these to linear volumes via lvconvert -m0. It said it worked.<br>
<br>There seemed to be a few &quot;devices&quot; left hanging around, so i removed them with dmsetup, <br><br>dmsetup remove vg01-ISO--m_mimage_0<br>dmsetup remove vg01-ISO--m_mimage_1<br><br>I then tried to remove the physical volume with pvremove. It told me I had to use &quot;-ff&quot; so i did.<br>
<br>Now things look really bad :-(<br><br>My filesystem was/is still mounted, and I am right now rsyncing the data to another system. But this does not look good:<br><br># lvs -P -o +devices<br>&nbsp; Partial mode. Incomplete volume groups will be activated read-only.<br>
&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>&nbsp; LV&nbsp;&nbsp; VG&nbsp;&nbsp; Attr&nbsp;&nbsp; LSize&nbsp;&nbsp; Origin Snap%&nbsp; Move Log Copy%&nbsp; Devices<br>
&nbsp; VM-m vg01 -wi-ao 125.00G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/sda5(32000)<br><br># pvscan&nbsp; -P<br>&nbsp; Partial mode. Incomplete volume groups will be activated read-only.<br>&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>
&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>&nbsp; PV /dev/sda5&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; VG vg01&nbsp;&nbsp; lvm2 [348.61 GB / 223.61 GB free]<br>&nbsp; PV unknown device&nbsp;&nbsp; VG vg01&nbsp;&nbsp; lvm2 [348.61 GB / 348.61 GB free]<br>
&nbsp; Total: 2 [697.21 GB] / in use: 2 [697.21 GB] / in no VG: 0 [0&nbsp;&nbsp; ]<br><br># vgscan&nbsp; -P<br>&nbsp; Partial mode. Incomplete volume groups will be activated read-only.<br>&nbsp; Reading all physical volumes.&nbsp; This may take a while...<br>
&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>&nbsp; Found volume group &quot;vg01&quot; using metadata type lvm2<br>
<br># lvscan&nbsp; -P<br>&nbsp; Partial mode. Incomplete volume groups will be activated read-only.<br>&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>&nbsp; Couldn&#39;t find device with uuid &#39;jGk0w0-UC8A-VMnX-riS4-QMVV-wYYH-pB2klH&#39;.<br>
&nbsp; ACTIVE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &#39;/dev/vg01/VM-m&#39; [125.00 GB] inherit<br><br>Ideas and or suggestions *really* appreciated! Am I correct to be really concerned?<br><br>Kevin<br></div>

------=_Part_143710_6051797.1222288582116--

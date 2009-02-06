Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n165QCBl000745
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 00:26:13 -0500
Received: from wa-out-1112.google.com (wa-out-1112.google.com [209.85.146.179])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n165Pucl012705
	for <linux-lvm@redhat.com>; Fri, 6 Feb 2009 00:25:56 -0500
Received: by wa-out-1112.google.com with SMTP id n4so319052wag.19
	for <linux-lvm@redhat.com>; Thu, 05 Feb 2009 21:25:55 -0800 (PST)
MIME-Version: 1.0
Date: Fri, 6 Feb 2009 12:25:55 +0700
Message-ID: <e8699ecc0902052125o3f7036e9u17c931051b3c9db2@mail.gmail.com>
From: J Cipto <jcipto@gmail.com>
Content-Type: multipart/alternative; boundary=00163645759457538c04623941b8
Subject: [linux-lvm] Recovering data from lost /dev/vg
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

--00163645759457538c04623941b8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Is there any way to recover data from lost /dev/vg?
The story is as follows :
The  linux server was connected to external storage  and a volume group
(namely /dev/vdisks) was created out of 8 LUNs from the storage.
For some reasons the presentation to the server was lost.
Representation was done and the server recognizes all the 8 LUNS but not the
volume group.
Found that /dev/vdisks was gone.

We need to recover the data, but to my understanding (i have a bit knowledge
of hpux) what need to be done is to recreate the /dev/vdisks and reimport
the volume.
Unfortunately, i don't know how to do it in linux.

Could someone provide me step by step information on how i can get back the
data?
FYI, there is no backup for the data and pvscan showed no devices found.


Thanks,

jcipto

--00163645759457538c04623941b8
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<div>Hi,</div>
<div>&nbsp;</div>
<div>Is there any way to recover data from lost /dev/vg?</div>
<div>The story is as follows&nbsp;:</div>
<div>The &nbsp;linux server was connected to external storage&nbsp; and a volume group (namely /dev/vdisks)&nbsp;was created out of 8 LUNs from the storage. </div>
<div>For some reasons the presentation to the server was lost. </div>
<div>Representation was done and the server recognizes all the 8 LUNS but not the volume group.</div>
<div>Found that /dev/vdisks was gone. </div>
<div>&nbsp;</div>
<div>We need to recover the data, but to my understanding (i have a bit knowledge of hpux) what need to be done is to recreate the /dev/vdisks and reimport the volume.</div>
<div>Unfortunately, i don&#39;t know how to do it in linux. </div>
<div>&nbsp;</div>
<div>Could someone provide me step by step information on how i can get back the data? </div>
<div>FYI, there is no backup for the data and pvscan showed no devices found. </div>
<div>&nbsp;</div>
<div>&nbsp;</div>
<div>Thanks,</div>
<div>&nbsp;</div>
<div>jcipto</div>

--00163645759457538c04623941b8--

Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 510D75C57B
	for <linux-lvm@redhat.com>; Thu,  1 Feb 2018 04:18:09 +0000 (UTC)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C4E7FC05B00B
	for <linux-lvm@redhat.com>; Thu,  1 Feb 2018 04:18:08 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id k15so12365619oib.1
	for <linux-lvm@redhat.com>; Wed, 31 Jan 2018 20:18:08 -0800 (PST)
MIME-Version: 1.0
Sender: chris@colorremedies.com
From: Chris Murphy <lists@colorremedies.com>
Date: Wed, 31 Jan 2018 21:18:07 -0700
Message-ID: <CAJCQCtTc=exYokfTp54+gqd=theoXrOf2fWwfaPSf7_eLz2mnQ@mail.gmail.com>
Subject: [linux-lvm] bogus WARNING: Device for PV not found or rejected by a
	filter.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Fedora 27 Server:
4.14.16-300.fc27.x86_64
lvm2-2.02.175-1.fc27.x86_64

Every 10 or so minutes in the journal, I'm getting what appears to be
a bogus warning. I say bogus because the PV is present, and I can
mount an XFS formatted LV found on this PV without error.

Jan 31 20:20:04 f27s.localdomain lvm[736]: WARNING: Device for PV
2zzRyd-4PXm-STvP-p5MA-dTsv-fJai-rAIpBH not found or rejected by a
filter.
Jan 31 20:20:04 f27s.localdomain lvm[736]: Cannot change VG 4vg while
PVs are missing.
Jan 31 20:20:04 f27s.localdomain lvm[736]: Consider vgreduce --removemissing.
Jan 31 20:20:04 f27s.localdomain lvm[736]: Cannot process volume group 4vg
Jan 31 20:20:04 f27s.localdomain lvm[736]: Failed command for 4vg-4pool-tpool.

vgdisplay -vv 4vg
https://paste.fedoraproject.org/paste/0KWAjAPBSg-fHjlGIBSyzA/raw

pvscan -vv
https://paste.fedoraproject.org/paste/HvutIxxAhy-rXJEuupytCg/raw

pvsck & vgck
https://paste.fedoraproject.org/paste/pFhpJh4fMqXCpbREW8hWIQ/raw

lvmdiskscan
https://paste.fedoraproject.org/paste/EdiSc4oQMUzRHPhxCfWYHw/raw

vgreduce --removemissing -t -vvvv 4vg
https://paste.fedoraproject.org/paste/TOTWyLcx4RBEkx67oe11PQ/raw

journal.log
https://drive.google.com/open?id=0B_2Asp8DGjJ9OThvS2Q3X3pWT3c



Decoder ring:
/dev/sdb is the relevant HDD in a USB enclosure
/dev/sdb1 is the only partition on it, LUKS
/dev/mapper/sdb is the unlocked LUKS device, which is also the PV in
question, and the only PV in the VG named "4vg"




-- 
Chris Murphy

Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mACHxEti022289
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 12:59:14 -0500
Received: from scexcdmz1.akbank.com (scexcdmz1.akbank.com [217.169.192.16])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mACHx2wi028261
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 12:59:03 -0500
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 12 Nov 2008 19:58:59 +0200
Message-ID: <B668DE010628694A85EC2A4C53DCF769261FA0D8@SA000011>
From: <Tuncel.Mutlu@akbank.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] device filter in lvm.conf
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi,

RedHat 5.2 - Kernel 2.6.18-92.el5 - x86_64 box - LVM2 lvm2-2.02.32-4.el5

I assume that this may be a trivial question but I haven't find the solution
anywhere, so I decided to ask you.

I have HDS USP-V disk and HDLM (Hitachi Dynamic Link Manager - HDS's
load-balancing and failover software). I have shown 1 disk over 4 paths to
the Linux and have created the HDLM device /dev/sddlmaa (the multipath and
failover device). This device's 4 paths are actually disk devices in Linux -
sdb, sdc, sdd and sde, but I don't want LVM to sees them, so I have changes
the lvm.conf to mask them, but to allow sda - where rootvg is.

Filter row is been changed to:

filter = [ "a/sda[1-9]$/" "a/sddlm*/" "r/.*/" ]

and types row has been added

types = [ "sddlmfdrv", 16 ]

This has been known to work on another Linux box, but not here. How must I
alter the filter so the LVM should accept sda and sddlm devices but reject
all others ?

Regards,

Tuncel

Bu e-posta ve muhtemel eklerinde verilen bilgiler ki�iye �zel ve gizli olup, yaln�zca mesajda belirlenen al�c� ile ilgilidir.Size yanl��l�kla ula�m��sa l�tfen g�ndericiye bilgi veriniz, mesaj� siliniz ve i�eri�ini ba�ka bir ki�iye a��klamay�n�z, herhangi bir ortama kopyalamay�n�z. Bu mesaj aksi s�zle�me ile belirtilmedik�e herhangi bir finansal i�lem teklifi, al�m�, sat�m� veya herhangi bir havalenin teyidi gibi bankac�l�k i�lemi yap�lmas� amac�n� ta��mamaktad�r.Verilen t�m bilgilerin do�rulu�u ve b�t�nl���n�n garantisi verilmemekte olup, �nceden bildirilmeksizin de�i�tirilebilecektir.Bu mesaj�n i�eri�i Bankam�z�n resmi g�r��lerini yans�tmayabilece�inden Akbank T.A.�. hi�bir hukuki sorumlulu�u kabul etmez.

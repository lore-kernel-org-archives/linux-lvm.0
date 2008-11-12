Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mACIUM6P010666
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 13:30:22 -0500
Received: from scexcdmz1.akbank.com (scexcdmz1.akbank.com [217.169.192.16])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mACITxVj015055
	for <linux-lvm@redhat.com>; Wed, 12 Nov 2008 13:30:09 -0500
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] device filter in lvm.conf
Date: Wed, 12 Nov 2008 20:29:57 +0200
Message-ID: <B668DE010628694A85EC2A4C53DCF769261FA16A@SA000011>
References: <B668DE010628694A85EC2A4C53DCF769261FA0D8@SA000011>
	<491B1C9D.3090401@redhat.com>
From: <Tuncel.Mutlu@akbank.com>
Content-Transfer-Encoding: 8bit
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

Removing /etc/lvm/cache/.cache seems to be working:)

Thanks a lot,

Tuncel

PS: By the way are you sure about sddlm* been the "sddl + 0 or more m". The
LVM has been accepting my filter now.

  --- Physical volumes ---
  PV Name               /dev/sddlmaa1
  PV UUID               ywH3QL-bVpp-wgZE-kNR8-KnOz-TGET-qQaJwW
  PV Status             allocatable
  Total PE / Free PE    2435 / 0

  PV Name               /dev/sddlmab1
  PV UUID               HSw0sJ-BNUx-Xxod-xm3o-dszW-oK9G-UXwGkn
  PV Status             allocatable
  Total PE / Free PE    275 / 230



-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of Bryn M. Reeves
Sent: Wednesday, November 12, 2008 8:13 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] device filter in lvm.conf

Tuncel.Mutlu@akbank.com wrote:
> filter = [ "a/sda[1-9]$/" "a/sddlm*/" "r/.*/" ]
>
> and types row has been added
>
> types = [ "sddlmfdrv", 16 ]
>
> This has been known to work on another Linux box, but not here. How must I
> alter the filter so the LVM should accept sda and sddlm devices but reject
> all others ?

When you say it doesn't work on this box, what actually happens? Do you
fail to filter out the individual paths, or do you fail to include the
multipath device that you want to use?

You may find that removing the cache (/etc/lvm/cache/.cache) after
editing the filters straightens things out (this should be automatic but
I've found that on some releases I've needed to manually remove it).

Also, is the filter really what you wanted?

 > filter = [ "a/sda[1-9]$/" "a/sddlm*/" "r/.*/" ]
                              ^^^^^^^^

This says to accept devices that have a string "sddl" followed by any
zero or more "m" characters. I don't know the naming scheme for HDLM,
but your example implies that they'd follow a pattern of
sddlm[a-z][a-z], or something.

Perhaps "a/sddlm.*/" would work better (sddlm followed by any number of
any character), since you're unlikely to have other device nodes with a
prefix of sddlm. You could tighten that up further as: "a|/dev/sddlm.*|"
if you liked (lvm filter expressions work like sed - you can uniformly
replace the '//' delimiters with other chars - I like pipes as it means
you need less \/ escaping when using paths).

Regards,
Bryn.

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Bu e-posta ve muhtemel eklerinde verilen bilgiler ki�iye �zel ve gizli olup, yaln�zca mesajda belirlenen al�c� ile ilgilidir.Size yanl��l�kla ula�m��sa l�tfen g�ndericiye bilgi veriniz, mesaj� siliniz ve i�eri�ini ba�ka bir ki�iye a��klamay�n�z, herhangi bir ortama kopyalamay�n�z. Bu mesaj aksi s�zle�me ile belirtilmedik�e herhangi bir finansal i�lem teklifi, al�m�, sat�m� veya herhangi bir havalenin teyidi gibi bankac�l�k i�lemi yap�lmas� amac�n� ta��mamaktad�r.Verilen t�m bilgilerin do�rulu�u ve b�t�nl���n�n garantisi verilmemekte olup, �nceden bildirilmeksizin de�i�tirilebilecektir.Bu mesaj�n i�eri�i Bankam�z�n resmi g�r��lerini yans�tmayabilece�inden Akbank T.A.�. hi�bir hukuki sorumlulu�u kabul etmez.

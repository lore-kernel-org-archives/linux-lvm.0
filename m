References: <90473b46-274c-55af-3887-f058f2cf05dd@gmail.com>
	<6dc75647-bec9-564d-23fa-aeb626678cf6@redhat.com>
From: Cesare Leonardi <celeonar@gmail.com>
Message-ID: <45bbdff9-b88c-4533-8aa5-9976564ed2bf@gmail.com>
Date: Mon, 26 Nov 2018 12:31:41 +0100
MIME-Version: 1.0
In-Reply-To: <6dc75647-bec9-564d-23fa-aeb626678cf6@redhat.com>
Content-Language: it-IT
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM RAID: task mdX_raid1:221 blocked for more than
	120 seconds
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-raid@vger.kernel.org

Resending, I erroneusly replied only to Zdenek, sorry.


On 26/11/18 09:49, Zdenek Kabelac wrote:
> It does look like 'freeze' happens during LV=EF=BF=BD resize of device
> (just wild guess from bug=3D913138)
>=20
> To track down the issue - there would need to be probably some=20
> communication with bug reporters - they would need to expose what they=20
> were doing plus state
> of dm tables and number of other things.

I can provide details about this, that was filed by me:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D913119

It's about a desktop PC, with two SSD (Samsung 850 EVO) on which i build=20
RAID1 using LVM.
# pvs
   PV         VG  Fmt  Attr PSize    PFree
   /dev/sdb3  vg0 lvm2 a--  <250,00g 15,98g
   /dev/sdc3  vg0 lvm2 a--  <250,00g 15,98g

# lvs
   LV    VG  Attr       LSize   Pool Origin Data%  Meta%  Move Log=20
Cpy%Sync Convert
   home  vg0 rwi-aor--- 200,00g 100,00
   root  vg0 rwi-aor---  30,00g 100,00
   swap0 vg0 rwi-aor---   4,00g 100,00

It's a desktop PC using Debian unstable, so it's rebooted quite often=20
due to frequent updates.
The freezes happens during normal work, without any resizing or any=20
maintenance on LVM going on. Most of the time I noted the freeze while I=20
was using Thunderbird. But eventually they resolve by themself: I wait=20
minutes and the system suddenly became responsive again. Sometimes I've=20
noted freezes but without any notice in dmesg: maybe they resolved=20
before some kernel threshold.
But most of the time another freeze will happen soon (it could be 1-2=20
hours but also minutes), so a reboot is really necessary.

I've not noticed any corruption due to these freeze but often they are=20
very long and very impacting. The only reliable workaround found was to=20
reboot with:
scsi_mod.use_blk_mq=3D0 dm_mod.use_blk_mq=3D0

Or to reboot with Debian kernel 4.16.16 (linux-image-4.16.0-2-amd) the=20
last that work without problem but also the last before Debian=20
maintaner's activated SCSI_MQ_DEFAULT and DM_MQ_DEFAULT.

To me the only evidence is that disabling blk-mq the problem doesn't=20
happen and so it looks an interaction with blk-mq.
I've read in RHEL8 release notes that it will enable it by default, so I=20
wonder if that happened to others. I have a fedora-server 29 VM,=20
upgraded from 28, but there, if I recall correctly, SCSI_MQ_DEFAULT and=20
DM_MQ_DEFAULT are not set.

> Anyway without way more info such bug report is meaningless.

Please ask, I'll do my best to provide any info you need.

Cesare.

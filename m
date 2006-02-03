Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k131Af120741
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 20:10:41 -0500
Received: from mail.silentmedia.com (fire.silentmedia.com [216.254.19.118])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k131AeJm021156
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 20:10:40 -0500
Received: from unknown (HELO babylon) (bench.silentmedia@[10.5.5.254])
	(envelope-sender <bench@silentmedia.com>)
	by 0 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 3 Feb 2006 01:10:34 -0000
Date: Thu, 2 Feb 2006 17:10:34 -0800 (PST)
From: Ben <bench@silentmedia.com>
Subject: Re: [linux-lvm] Expanding volume groups to fill a growing disk
In-Reply-To: <20060203003308.GA20335@loon.fatav.hu>
Message-ID: <Pine.LNX.4.64.0602021709110.1276@localhost.localdomain>
References: <Pine.LNX.4.64.0602021457070.1276@localhost.localdomain>
	<20060202232526.GU4280@agk.surrey.redhat.com>
	<Pine.LNX.4.64.0602021537310.1276@localhost.localdomain>
	<20060203003308.GA20335@loon.fatav.hu>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-1299152329-1138929034=:1276"
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
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-1299152329-1138929034=:1276
Content-Type: TEXT/PLAIN; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable

Ah, thanks, that should be good enough. I plan to upgrade to FC5T3 as soon =
as it=20
comes out for the x86_64 Xen support it will hopefully provide. And also, i=
t=20
seems, for a working packaged version of pvresize. :)

On Fri, 3 Feb 2006, Szabo Akos wrote:

> On Thu, Feb 02, 2006 at 03:40:57PM -0800, Ben wrote:
>> What version do I need?
>
> At least I don;t no, but I have tha bleow, BTW I never use it!
>
> /I use fedore FC5T.
> device-mapper-1.02.02-3
> lvm2-2.02.01-1.1/
>
> pvresize --help
>  pvresize: Resize physical volume(s)
>
> pvresize
>        [-d|--debug]
>        [-h|-?|--help]
>        [--setphysicalvolumesize PhysicalVolumeSize[kKmMgGtT]
>        [-t|--test]
>        [-v|--verbose]
>        [--version]
>        PhysicalVolume [PhysicalVolume...]
>
> pvresize --version
>  LVM version:     2.02.01 (2005-11-23)
>  Library version: 1.02.02 (2005-12-02)
>  Driver version:  4.5.0
>
>
> --=20
> Ciao:
> 	Fonya
>
>     Ami=EF=BF=BDta NT-t install=EF=BF=BDltam a porsz=EF=BF=BDv=EF=BF=BDmr=
a, semmi sz=EF=BF=BDv=EF=BF=BDs nincs vele.
>                PGP key ID F86614E5, GPG key ID 83AD9365
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
--8323328-1299152329-1138929034=:1276--

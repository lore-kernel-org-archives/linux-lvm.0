Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5A5cwdV002509
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 01:38:58 -0400
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n5A5cemi023869
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 01:38:40 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id ECE0086F52
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 07:38:39 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id izSXgz-S66oT for <linux-lvm@redhat.com>;
	Wed, 10 Jun 2009 07:38:39 +0200 (CEST)
Date: Wed, 10 Jun 2009 07:38:39 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvremove won't work
Message-ID: <20090610053839.GB18433@maude.comedia.it>
References: <4A2E0396.4030006@nektulos.de>
	<20090609065405.GB10101@maude.comedia.it>
	<4A2E096F.1010203@nektulos.de>
	<1244540783.18101.184.camel@breeves.fab.redhat.com>
	<4A2E3886.2000604@nektulos.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A2E3886.2000604@nektulos.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jun 09, 2009 at 12:25:10PM +0200, Stefan Radovanovici wrote:
>
>On 6/9/2009 11:46 AM, Bryn M. Reeves wrote:
>
>> Use dmsetup:
>> 
>> $ dmsetup info --maj 252 --min 1
>> 
>> (the output above shows dm is using 252 as its major number for this
>> device on your system).
>> 
>> At a guess it looks like you somehow removed the PV from the VG while a
>> logical volume was mapped on it.
>
>First of all, thanks for the info. I am not a LVM expert and this is useful information. dmsetup shows this:
>
>root@neriak:/sys/block/sda/sda4/holders/dm-1# dmsetup info --maj 252 --min 1
>Name:              storage-pvmove0
>State:             ACTIVE
>Read Ahead:        256
>Tables present:    LIVE
>Open count:        0
>Event number:      1
>Major, minor:      252, 1
>Number of targets: 1
>UUID: LVM-SS2wO5K12BwSo1iceXVSiTaYPQzdgEuUoOPgGYKKRLO109x4837eAHZeiSmzzEqW
>
>I think I somehow messed up while trying to get rid of /dev/sda4. I used a GUI for this not the CLI, first I tried to move the extents to other PVs (which I think is that pvmove does) and then to actually remove it from the group (which is probably what vgreduce does). If I am not mistaken, the first operation gave an error even though it appeared to have worked somehow at the time.
>
it seems to be some leftover from the pvmove operation, unfortunately i
have no idea if some data was not actually moved correctly.
did you record the error message the pvmove operation reported?

Regards,
L.

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \

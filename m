Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9S6Zir07064
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 02:35:44 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9S6ZabS015298
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 02:35:42 -0400
Date: Thu, 28 Oct 2004 08:35:31 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
Message-ID: <20041028063530.GA13279@percy.comedia.it>
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
	<41808B37.40406@monjoin.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <41808B37.40406@monjoin.net>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Oct 28, 2004 at 08:01:27AM +0200, Eric Monjoin wrote:
>Theo Van Dinter a =EF=BF=BDcrit :
>
>Well it's because we have problems in this way. We have a server=20
>connected to 2 EMC Symmetrix where we assign some 70Gb and 40Gb Luns. =20
>We used Powerpath to manage the dual path to the Luns and so I first=20
>created mirror as this :


>But after a while I obtain that :
>Personalities : [raid1]
>read_ahead 1024 sectors
>Event: 10                =20
>md9 : active raid1 [dev e9:31][1] [dev e8:e1][0]
>      42829184 blocks [2/2] [UU]
>and if we try to rebuild the mirror after after loosing access to one of=20
this might be a problem with powerpath, it seems harmless tough

>the EMC, we have really bad result :
>Personalities : [raid1]
>read_ahead 1024 sectors
>Event: 26                =20
>md9 : active raid1 emcpowerd1[2] [dev e8:e1][0]
>      42829184 blocks [2/1] [U_]
>      [>....................]  recovery =3D  1.4% (630168/42829184)=20
>finish=3D68.1min speed=3D10315K/sec
this is a problem with linux md raid. it does not support fast resync
with a bitmap of changed sectors, there is a project to implement it,
but it is not yet in the standard kernel.
look on the linux-raid mailing list archives for something called 'fast
raid 1'.
i do not believe you would have any advantage in stacking md above lvm
anyway.
Regards,
Luca

--=20
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

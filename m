Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9S61Vr01940
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 02:01:31 -0400
Received: from postfix4-1.free.fr (postfix4-1.free.fr [213.228.0.62])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id i9S61U7n008509
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 02:01:30 -0400
Received: from [192.168.29.141] (sesame.monjoin.com [82.229.236.181])
	by postfix4-1.free.fr (Postfix) with ESMTP id 7B79D1EBF56
	for <linux-lvm@redhat.com>; Thu, 28 Oct 2004 08:01:29 +0200 (CEST)
Message-ID: <41808B37.40406@monjoin.net>
Date: Thu, 28 Oct 2004 08:01:27 +0200
From: Eric Monjoin <eric@monjoin.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software raid on top of lvm logical volume
References: <41801ADE.6030308@monjoin.net> <20041028011738.GD13737@kluge.net>
In-Reply-To: <20041028011738.GD13737@kluge.net>
Content-Transfer-Encoding: quoted-printable
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

Theo Van Dinter a =EF=BF=BDcrit :

Well it's because we have problems in this way. We have a server=20
connected to 2 EMC Symmetrix where we assign some 70Gb and 40Gb Luns. =20
We used Powerpath to manage the dual path to the Luns and so I first=20
created mirror as this :

raiddev /dev/md0
        raid-level              1
        nr-raid-disks           2
        nr-spare-disks          0
        chunk-size              32
        persistent-superblock   1
        device                  /dev/emcpowera1
        raid-disk               0
        device                  /dev/emcpowerf1
        raid-disk                1
#        failed-disk        1


raiddev /dev/md1
        raid-level              1
        nr-raid-disks           2
        nr-spare-disks          0
        chunk-size              32
        persistent-superblock   1
        device                  /dev/emcpowerb1
        raid-disk               0
        device                  /dev/emcpowerg1
        raid-disk                1
#    failed-disk        1

raiddev /dev/md2
        raid-level              1
        nr-raid-disks           2
        nr-spare-disks          0
        chunk-size              32
        persistent-superblock   1
        device                  /dev/emcpowerc1
        raid-disk               0
        device                  /dev/emcpowerh1
        raid-disk                1
#    failed-disk        1


raiddev /dev/md3
        raid-level              1
        nr-raid-disks           2
        nr-spare-disks          0
        chunk-size              32
        persistent-superblock   1
        device                  /dev/emcpowerd1
        raid-disk               0
        device                  /dev/emcpoweri1
    raid-disk                1
#        failed-disk        1
......
up to raiddev /dev/md9

So the /proc/mdstat  give :
Personalities : [raid1]
read_ahead 1024 sectors
Event: 15                =20
md9 : active raid1 emcpowerd1[1] emcpowero1[0]
      42829184 blocks [2/2] [UU]
    =20
md8 : active raid1 emcpowerc1[1] emcpowern1[0]
      42829184 blocks [2/2] [UU]
    =20
md7 : active raid1 emcpowerb1[1] emcpowerm1[0]
      42829184 blocks [2/2] [UU]
    =20
md6 : active raid1 emcpowera1[1] emcpowerl1[0]
      42829184 blocks [2/2] [UU]
    =20
md5 : active raid1 emcpowerp1[1] emcpowerk1[0]
      42829184 blocks [2/2] [UU]
    =20
md4 : active raid1 emcpowerj1[1] emcpowere1[0]
      71384704 blocks [2/2] [UU]
    =20
md3 : active raid1 emcpoweri1[1] emcpowerd1[0]
      71384704 blocks [2/2] [UU]
    =20
md2 : active raid1 emcpowerc1[0] emcpowerh1[1]
      71384704 blocks [2/2] [UU]
    =20
md1 : active raid1 emcpowerg1[1] emcpowerb1[0]
      71384704 blocks [2/2] [UU]
    =20
md0 : active raid1 emcpowerf1[1] emcpowera1[0]
      71384704 blocks [2/2] [UU]
    =20
unused devices: <none>

But after a while I obtain that :
Personalities : [raid1]
read_ahead 1024 sectors
Event: 10                =20
md9 : active raid1 [dev e9:31][1] [dev e8:e1][0]
      42829184 blocks [2/2] [UU]
    =20
md8 : active raid1 [dev e9:21][1] [dev e8:d1][0]
      42829184 blocks [2/2] [UU]
    =20
md7 : active raid1 [dev e9:11][1] [dev e8:c1][0]
      42829184 blocks [2/2] [UU]
    =20
md6 : active raid1 [dev e9:01][1] [dev e8:b1][0]
      42829184 blocks [2/2] [UU]
    =20
md5 : active raid1 [dev e8:f1][1] [dev e8:a1][0]
      42829184 blocks [2/2] [UU]
    =20
md4 : active raid1 [dev e8:91][1] [dev e8:41][0]
      71384704 blocks [2/2] [UU]
    =20
md3 : active raid1 [dev e8:81][1] [dev e8:31][0]
      71384704 blocks [2/2] [UU]
    =20
md2 : active raid1 [dev e8:71][1] [dev e8:21][0]
      71384704 blocks [2/2] [UU]
    =20
md1 : active raid1 [dev e8:61][1] [dev e8:11][0]
      71384704 blocks [2/2] [UU]
    =20
md0 : active raid1 [dev e8:51][1] [dev e8:01][0]
      71384704 blocks [2/2] [UU]
    =20
unused devices: <none>

and if we try to rebuild the mirror after after loosing access to one of=20
the EMC, we have really bad result :
Personalities : [raid1]
read_ahead 1024 sectors
Event: 26                =20
md9 : active raid1 emcpowerd1[2] [dev e8:e1][0]
      42829184 blocks [2/1] [U_]
      [>....................]  recovery =3D  1.4% (630168/42829184)=20
finish=3D68.1min speed=3D10315K/sec
md8 : active raid1 emcpowerc1[2] [dev e8:d1][0]
      42829184 blocks [2/1] [U_]
    =20
md7 : active raid1 emcpowerb1[2] [dev e8:c1][0]
      42829184 blocks [2/1] [U_]
    =20
md6 : active raid1 emcpowera1[2] [dev e8:b1][0]
      42829184 blocks [2/1] [U_]
    =20
md5 : active raid1 emcpowerp1[2] [dev e8:a1][0]
      42829184 blocks [2/1] [U_]
    =20
md4 : active raid1 emcpowerj1[2] [dev e8:41][0]
      71384704 blocks [2/1] [U_]
    =20
md3 : active raid1 emcpoweri1[2] [dev e8:31][0]
      71384704 blocks [2/1] [U_]
    =20
md2 : active raid1 emcpowerh1[2] [dev e8:21][0]
      71384704 blocks [2/1] [U_]
    =20
md1 : active raid1 emcpowerg1[2] [dev e8:11][0]
      71384704 blocks [2/1] [U_]
    =20
md0 : active raid1 emcpowerf1[2] [dev e8:01][0]
      71384704 blocks [2/1] [U_]
    =20

So may be it will be better to create a raid device on top of the lvm=20
volume.


>On Thu, Oct 28, 2004 at 12:02:06AM +0200, Eric Monjoin wrote:
> =20
>
>>I would like to know if it's possible (works perfectly) to create a=20
>>software mirror (md0) on top of  2 LVM logical volumes :
>>   =20
>>
>
>You'd usually want to make your raid devices first, then put LVM on
>top of it.  I can't really think of any benefits of doing it the other
>way around.
>
> =20
>
>------------------------------------------------------------------------
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

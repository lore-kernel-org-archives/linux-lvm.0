Return-Path: <misiek@pld.ORG.PL>
Date: Sun, 29 Apr 2001 19:49:50 +0200
From: Arkadiusz Miskiewicz <misiek@pld.ORG.PL>
Message-ID: <20010429194950.A12337@ikar.t17.ds.pwr.wroc.pl>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] vgcreate doesn't work for me
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I wanted to do some test with lvm and doing as in LVM-HOWTO:

[root@arm misiek]# pvcreate /dev/hdd[123]
pvcreate -- physical volume "/dev/hdd1" successfully created
pvcreate -- physical volume "/dev/hdd2" successfully created
pvcreate -- physical volume "/dev/hdd3" successfully created

[root@arm misiek]# vgcreate test /dev/hdd[123]
vgcreate -- no valid physical volumes in command line

[root@arm misiek]# uname -a; rpm -q lvm
Linux arm 2.4.4 #1 sob kwi 28 12:49:56 CEST 2001 i686 pld
lvm-0.9.1-0.beta7
[root@arm misiek]#=20

unfortunately vgcreate doesn't want to work for me :-(

Any suggestions?
--=20
Arkadiusz Mi=EF=BF=BDkiewicz, AM2-6BONE    [ PLD GNU/Linux IPv6 ]
http://www.t17.ds.pwr.wroc.pl/~misiek/ipv6/   [ enabled ]

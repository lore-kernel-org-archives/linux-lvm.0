Return-Path: <bs@infologic.fr>
Message-Id: <5.0.2.1.2.20010727102408.00a35ec0@127.0.0.1>
Date: Fri, 27 Jul 2001 10:25:38 +0200
From: Benoit SERRA <bs@infologic.fr>
Subject: Re: [linux-lvm] File System type on (LVM) partition
In-Reply-To: <3B61138B.DEEBA1D9@atix.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

At 27/07/01, you wrote:
>  is there a way to know the file system type installed on a partition
>(wich could be of LVM type or not)
>  tanx for your help.

[root@ialinux /root]#=20
mount
/dev/md0 on / type ext2=20
(rw)
none on /proc type proc=20
(rw)
/dev/md1 on /boot type ext2=20
(rw)
/dev/md3 on /ud type ext2=20
(rw)
none on /dev/pts type devpts=20
(rw,gid=3D5,mode=3D620)
/dev/sdc2 on /dosfs type jfs (rw)
[root@ialinux /root]#


--

Moi j'aime Windows 2000 car cela me rappele mes petits cousins :
"Benoit, on a rien fait et c'est cass=E9"

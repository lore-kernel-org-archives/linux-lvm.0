Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683953@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Date: Wed, 14 Feb 2001 11:15:53 +0100
MIME-Version: 1.0
Subject: [linux-lvm] LVM don't work anymore (wrong version?)
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I'm using LVM 0.9.1_beta3 since 2 weeks now without any problem.
I'm having a problem now.
I have one VG and one LV in it.
I need to create another VG made of 3 PVs.
I issue:
[root@fatboy hosts]# pvcreate -f /dev/md7
pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
vgscan
What's that?

When running vgscan:
[root@fatboy hosts]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

What can I do with that?
Thanks
-jec

PS: I already tried to upgrade to beta4 (only the tools). If you want me to
upgrade the kernel to beta4, wait this evening :-) (prod machine)

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Jean-Eric Cuendet
Linkvest SA
Av des Baumettes 19, 1020 Renens Switzerland
Tel +41 21 632 9043  Fax +41 21 632 9090
http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

Return-Path: <darwin@gazeta.pl>
Message-ID: <3ACAD385.9FE9BF6C@gazeta.pl>
Date: Wed, 04 Apr 2001 09:55:49 +0200
From: Artur Wiak <darwin@agora.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem with vgcreate ...
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
To: linux-lvm <linux-lvm@sistina.com>

Hi !

I have problem with LVM beta6.
I have RedHat 7.0 with 2.4.2 kernel (compilation with
util-linux 2.10o, modutlis 2.4.2 & e2fsprogs 1.19).
After compilation all is OK.
I'm installing LVM (first- .configure - OK,
second- compilation with LVM as module - OK,
third- make - OK, fourth- make install - OK).
but when i started module and i want create lvm group
(vgcreate lvmgrp /dev/sd?? /dev/sd??) I obtain:
lvm -- lvm_chr_ioctl: unknown command 4004fe0a
vgcreate -- ERROR "Invalid argument" creating VGDA for volume group
"lvmgrp" in kernel.
I don't known what i do bad (maybe any patch)?
(With beta4 end beta5 this error recurs too.)
Help me please.

Thanks for Your help.

Artur

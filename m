Return-Path: <grothe@fb0442.mathematik.tu-darmstadt.de>
From: Holger Grothe <grothe@fb0442.mathematik.tu-darmstadt.de>
Message-Id: <200104042357.AA113038641@fb0442.mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] vgcreate error
Date: Thu, 05 Apr 2001 1:57:20 MESZ
In-Reply-To: <3AC8BECC.DF37AA1F@agora.pl>; from "Artur Wiak" at Apr 5, 101 1:17 am
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

> I have problem with LVM beta6.
> I have RedHat 7.0 with 2.4.2 kernel (compilation with
> util-linux 2.10o, modutlis 2.4.2 & e2fsprogs 1.19).
> After compilation all is OK.
> I'm installing LVM (first- .configure - OK,
> second- compilation with LVM as module - OK,
> third- make - OK, fourth- make install - OK).
> but when i started module and i want create lvm group
> (vgcreate lvmgrp /dev/sd?? /dev/sd??) I obtain:
> lvm -- lvm_chr_ioctl: unknown command 4004fe0a
> vgcreate -- ERROR "Invalid argument" creating VGDA for volume group
> "lvmgrp" in kernel.
> I don't known what i do bad?

Andreas answered this question already. (In short: upgrade kernel part 
of lvm to beta6 or use a patch provided by Andreas) See e.g.
 http://lists.sistina.com/pipermail/linux-lvm/2001-March/006580.html

There is also a search page for the archive of this (and the other)
lvm mailing list(s):
 http://www.sistina.com/lvm/Pages/maillist.html
(4004fe0a leads to the answers)

Holger
--
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt

Return-Path: <artur.wiak@agora.pl>
Message-ID: <3AC8BECC.DF37AA1F@agora.pl>
Date: Mon, 02 Apr 2001 20:02:52 +0200
From: Artur Wiak <artur.wiak@agora.pl>
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------8B7BFAA92E458498FE39DE52"
Subject: [linux-lvm] vgcreate error
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
To: linux-lvm@sistina.com

--------------8B7BFAA92E458498FE39DE52
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

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
I don't known what i do bad?
(With beta4 end beta5 this error recurs too.)
Help me please.

Thanks for Your help.

Artur


--------------8B7BFAA92E458498FE39DE52
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
Hi !
<p>I have problem with LVM beta6.
<br>I have RedHat 7.0 with 2.4.2 kernel (compilation with
<br>util-linux 2.10o, modutlis 2.4.2 &amp; e2fsprogs 1.19).
<br>After compilation all is OK.
<br>I'm installing LVM (first- .configure - OK,
<br>second- compilation with LVM as module - OK,
<br>third- make - OK, fourth- make install - OK).
<br>but when i started module and i want create lvm group
<br>(vgcreate lvmgrp /dev/sd?? /dev/sd??) I obtain:
<br><b>lvm -- lvm_chr_ioctl: unknown command 4004fe0a</b>
<br><b>vgcreate -- ERROR "Invalid argument" creating VGDA for volume group
"lvmgrp" in kernel.</b>
<br>I don't known what i do bad?
<br>(With beta4 end beta5 this error recurs too.)
<br>Help me please.
<p>Thanks for Your help.
<p>Artur
<br>&nbsp;</html>

--------------8B7BFAA92E458498FE39DE52--

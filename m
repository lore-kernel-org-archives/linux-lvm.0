Return-Path: <christianv@zeropiu.it>
From: "Christian Verdelli" <christianv@zeropiu.it>
Message-ID: <5c1df9db30f63ca9.30f63ca95c1df9db@apollo.zeropiu.it>
Date: Wed, 09 May 2001 17:15:25 +0200
MIME-Version: 1.0
Content-Language: it
Content-Type: multipart/mixed;
 boundary="--20e2cc746285eee540914b9d44c80c21"
Subject: [linux-lvm] LVM-i2o problem
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
Cc: armando.campanaro@zeropiu.com

This is a multi-part message in MIME format.

----20e2cc746285eee540914b9d44c80c21
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 7bit

Dear friends,

we have been trying to install LVM on a 
Linux system running a i20 RAID volume.

After having configured and installed LVM binaries,
we receive the following error message when creating
a physical volume:

./pvcreate /dev/i2o/hda2
pvcreate --- invalid physical volume name  "/dev/i2o/hda2"


After having consulted the archives we have tried to modify
the configuration files lvm_dir_cache.c & lvm_check_dev.c 
lvm_check_partition.c.

Unfortunately we cannot make out precisely what has to be done,
could someone please explain us how to make these changes?

Thanks in advance.






Verdelli Christian

ZEROPIU SpA
via Melzi d'Eril, 26 - 20154 Milano
ITALY
Tel: +39-02-34530018 - Fax: +39-02-34532148

e-mail: christian.verdelli@zeropiu.it
homepage: http://www.zeropiu.com

----20e2cc746285eee540914b9d44c80c21
Content-Type: text/x-vcard; name="verzachris.vcf"; charset=us-ascii
Content-Disposition: attachment; filename="verzachris.vcf
Content-Description: Card for Christian Verdelli <christianv@zeropiu.it>
Content-Transfer-Encoding: 7bit

begin:vcard
n:Verdelli;Christian
fn:Christian Verdelli
version:2.1
email;internet:christianv@zeropiu.it
title:Sys Admin
end:vcard

----20e2cc746285eee540914b9d44c80c21--

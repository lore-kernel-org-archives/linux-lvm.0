Return-Path: <jcarles@dtic.ua.es>
From: "Joan Carles Monllor" <jcarles@dtic.ua.es>
Date: Wed, 7 Feb 2001 13:49:27 +0100
Message-ID: <NDBBIPFGCOKBKKOFONLLEEMMCCAA.jcarles@dtic.ua.es>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0070_01C0910C.C9E5F5A0"
Subject: [linux-lvm] I can't add other disk in lvm system
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

This is a multi-part message in MIME format.

------=_NextPart_000_0070_01C0910C.C9E5F5A0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit


	Hello, I am new in this mailing list. And, I am new in lvm system too.

	My problem is:

	I have create a logical volume, correctly. And, I want to add other disk to
logical volum.

	I already have create a volumen group named "vm0".

	I think that I have run "vgextend -v vm0 /dev/hdc1", for exemple.

	Then display this:

vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
Unable to handle kernel NULL pointer dereference at virtual address 0000002c
 printing eip:
c01ecd4f
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c01ecd4f>]
EFLAGS: 00010282
....
....
.
.
.
Segment violation

	The problem is in mine or in the kernel or the lvm tools ?

		thanks for your help in avanced.

Joan Carles Monllor
Universitat d'ALacant
jcarles@dtic.ua.es        Tel. 965903681
Spain                     Fax 965903902


------=_NextPart_000_0070_01C0910C.C9E5F5A0
Content-Type: text/x-vcard;
	name="Joan Carles Monllor.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Joan Carles Monllor.vcf"

BEGIN:VCARD
VERSION:2.1
N:Monllor;Joan;Carles
FN:Joan Carles Monllor
NICKNAME:jcarles
EMAIL;PREF;INTERNET:jcarles@dtic.ua.es
REV:20000608T070409Z
END:VCARD

------=_NextPart_000_0070_01C0910C.C9E5F5A0--

Return-Path: <mike@marxmeier.com>
Message-ID: <3A2E0A5B.2EB3CCEB@elinux.com.sg>
Date: Wed, 06 Dec 2000 17:43:55 +0800
From: Michael Boman <michael@elinux.com.sg>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------45891DCD810AD278580A74FC"
Subject: [linux-lvm] WebMin LVM module development
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
To: linux-lvm <linux-lvm@msede.com>, WebMin List <webmin-l@webmin.com>, linux-raid <linux-raid@vger.kernel.org>
Cc: Laurence Liew <laurence@elinux.com.sg>

This is a multi-part message in MIME format.
--------------45891DCD810AD278580A74FC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hi,

for the past week I've been working on a WebMin (http://www.webmin.com)
module for LVM.

I have a few questions I need to get answered as well as I seek people
that is willing to try the LVM module out.

My questions are:
- How can I check what PV's are availble to use with a VG. I know the
pvscan command, but it takes quite a long while to complete and I wonder
if there is any shortcuts to find what PV's that is free to use with a
VG.

- I have problem using MD as a PV of my VG, any hints what it can be?
<output>
mike:/mnt# vgextend vg_test /dev/md0
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- ERROR: no physical volumes usable to extend volume group
"vg_test"
</output>

Seeking bug-hunters and feedback:
 I'd like to offer the oppertunity for you guy's (and gal's) that are
living on the edge to try out my WebMin LVM module. It's not fully
operational yet (Can only display VG's and assosiated info as well as
create VG's), but I am hoping that a early beta release will provide me
with enuff feedback to make this a good and useful module to WebMin.

The code is under GNU GPL License version 2 or later, and currently
given out on a per-request basis. I nor the company I work for offers no
garranty that it wont eat your data etc.. #include <std/disclaimer.txt>
as per usual.

Jargon file for the uninformed:
MD = Multiple Devices, software raid.
PV = Physical Volume
PE = Physical Extent
LV = Logical Volume
VG = Volume Group

Best regards
 Michael Boman

PS
 Sorry for cross-posting here, but I wanted to make sure all relivant
parties got informed.
DS

-- 
"eLINUX  ---  Enabling the Net Economy on Linux"
----------------------------------------------------------
Michael Boman                   eLinux Pte Ltd
Technical Consultant            http://www.elinux.com.sg
michael@elinux.com.sg           Tel:    (65)  227 6180
                                Fax:    (65)  227 5808
----------------------------------------------------------
--------------45891DCD810AD278580A74FC
Content-Type: text/x-vcard; charset=us-ascii;
 name="michael.vcf"
Content-Transfer-Encoding: 7bit
Content-Description: Card for Michael Boman
Content-Disposition: attachment;
 filename="michael.vcf"

begin:vcard 
n:Boman;Michael
tel;cell:+65 9855 1734
tel;fax:+65 227 5808
tel;work:+65 227 6180
x-mozilla-html:FALSE
url:http://www.elinux.com.sg
org:eLinux Pte Ltd;Technical Division
version:2.1
email;internet:michael@elinux.com.sg
title:Technical Consultant
adr;quoted-printable:;;3 Shenton Way=0D=0A#22-09 Shenton House;Singapore;;068805;Singapore
x-mozilla-cpt:;0
fn:Michael Boman
end:vcard

--------------45891DCD810AD278580A74FC--

Return-Path: <lars.bensmann@epost.de>
Message-ID: <3A5DBB0000001DCB@mail.epost.de>
Date: Sat, 13 Jan 2001 21:41:32 +0100
From: lars.bensmann@epost.de
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Help: ERROR -154
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
To: linux-lvm@sistina.com

Hello,

when running vgscan I get the following error message:

vgscan -- ERROR -154: can't get data of volume group "part" from physical=

volume(s)
vgscan -- ERROR -154 creating "/etc/lvmtab" and "/etc/lvmtab.d"

(I put a complete output of vgscan -d up for download under:
http://homepage.ruhr-uni-bochum.de/Marc.O.Sandlus/vgscan_debug.gz)

This happened after rebooting the computer a couple of days after 
shrinking a LV, renaming it and then creating a new LV with the name
of the old one. I don't know if this has anything to do with this,
but I haven't messed around with LVM otherwise and it ran just fine
for quite some time.

For me it looks like the is some internal counter wrong. I think
it triers to count the LVs and counts 8 somewhere and 9 somewhere
else (9 is the right number).

I'm using the latest Debian Package (0.8i) and I tried several
different kernels (2.2.18, 2.2.17 and 2.2.14).
And I tried it with 2.4.0-test12 and a self compiled 0.8final.

I always get the same results.

Looking forward to any help,
Lars

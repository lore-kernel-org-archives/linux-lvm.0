Message-ID: <3A0BEA91.EA8FF865@topo.ucl.ac.be>
Date: Fri, 10 Nov 2000 13:31:13 +0100
From: Merence Sibomana <sibomana@topo.ucl.ac.be>
MIME-Version: 1.0
Subject: [linux-lvm] How to change physical extent size
Content-Transfer-Encoding: quoted-printable
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@msede.com

I'am new to this mail list and sorry if the question has already been
answered.

In the FAQs, I find this :
	10. Why are my logical volumes limited to 256 GB in size?=20
=20
	This is NO absolute limit but it depends on the physical extent size
you configured at
	volume group creation time.=20
	Please use option -s of the vgcreate command to give a larger physical
extent size.
	For example with a physical extent size of 524288 KB (512 MB) you are
able to map a logical
	volume of 32 Terabyte. Remember that current Linux kernels are limited
to 1 Terabyte.

I have created a VG without -s. vgcreate doesn't accept an existing VG
as argument.=20
How can I delete it and recreate with -s?
___
M=EF=BF=BDrence Sibomana
PET laboratory, UCL
Phone : +32 10 473096

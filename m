content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPartTM-000-d73d4692-ecc9-44d9-8c40-e83152a44217"
Subject: RE: [linux-lvm] Max storage size per system
Message-ID: <689F43A6CF84E541A721C5C3FD5ADECC0F3CA9@blr-m3-msg.wipro.com>
From: "Sharad Tiwari" <sharad.tiwari@wipro.com>
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
Date: Wed Mar  5 11:40:03 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

This is a multi-part message in MIME format.

------=_NextPartTM-000-d73d4692-ecc9-44d9-8c40-e83152a44217
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,=20

	Please ignore the disclaimer that comes attached with this mail
... I am trying to get it removed ... just don't have much control on
it!!!=20
I am not a part of the lvm-devel mailing list so please just put me in
the CC ...

I am sory for these dumb questions ... but I am a beginner in this world
an hence I need to put forth these rather stupid questions ...
Here are my questions ???

1) Why does lvm need to register itself both as a block device and a
character device ??? (This is what I could make out on seeing the code ,
please correct me if I am wrong)

2) I need to provide an interface in the user-space for doing the
following operations :=20

a) open volume device
b) read volume device
c) write volume device
d) ioctl operations on volume device
e) close volume device ...

these perhaps correspond to the following functions in the kernel ...

static int lvm_blk_ioctl(struct inode *, struct file *, uint, ulong);
static int lvm_blk_open(struct inode *, struct file *);

static int lvm_blk_close(struct inode *, struct file *);
static int lvm_get_snapshot_use_rate(lv_t * lv_ptr, void *arg);
static int lvm_user_bmap(struct inode *, struct lv_bmap *);

static int lvm_chr_open(struct inode *, struct file *);
static int lvm_chr_close(struct inode *, struct file *);
static int lvm_chr_ioctl(struct inode *, struct file *, uint, ulong);

Could some-one help me in this ... the library liblvm can be used
perhaps ...I could not make out how the functions in=20
liblvm-10.a (available with the lvm-1.0.6.tar.gz)does this ...

Could some-one help me out here ...


Thanks for the help ...
Sharad.



------=_NextPartTM-000-d73d4692-ecc9-44d9-8c40-e83152a44217
Content-Type: text/plain;
	name="Wipro_Disclaimer.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="Wipro_Disclaimer.txt"

**************************Disclaimer**************************************************    
 
 Information contained in this E-MAIL being proprietary to Wipro Limited is 'privileged' 
and 'confidential' and intended for use only by the individual or entity to which it is 
addressed. You are notified that any use, copying or dissemination of the information 
contained in the E-MAIL in any manner whatsoever is strictly prohibited.

****************************************************************************************

------=_NextPartTM-000-d73d4692-ecc9-44d9-8c40-e83152a44217--

Subject: RE: [linux-lvm] vgextend
Date: Mon, 15 Oct 2001 07:08:45 -0500
Message-ID: <8BFE9B4949BB4346A146F5231AEF1B87F3C9@CX975884-A.mdmiller.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
From: "Mitchell D. Miller" <mitch@mdmiller.com>
content-class: urn:content-classes:message
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

Someone suggested a code mismatch, but I think differently.  If you
search Sistina's site for segmentation fault, you get a number of hits
about a GCC compiler error regarding optimizations.

I had this same problem, but was able to get around it by using the
source code modification solution someone posted to Sistina's bugzilla
system.

Essentially, you add a printf(""); statement to approximately line 42 of
lv_create_remove.c which results in un-optimizable code, which results
in a usable binary.

Hope that's helpful.

-- Mitch

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of kannan21977@sify.com
Sent: Monday, October 15, 2001 4:15 AM
To: thornber@sistina.com; linux-lvm@sistina.com
Subject: [linux-lvm] vgextend


Hi

I work for an ISP in India nad am currently trying to get LVM working
for us..I use a 2.4.0 kernel.and LVM 1.0.
I have not applied any patches except the one for ext2online.all
commands work fine like pvcreate ,lvextend etc...

but when i do a vgextend when trying to add a physical volume to my
volume group,I get a segementation fault error.
i use the command=20

vgextend vg1 /dev/hdb2

i had changed the partition id of /dev/hdb2 to 8e.
then i did a pvcreate /dev/hdb2.even that worked fine.
but when i try to add this pv to my volume group vg1 I get a
segmentation fault error.has anyone come across this error.would be
great to hear from anyone of u

thanx and regards
kannan
-------------------------------------------------
This mail sent through : http://mail.sify.com
Want to win a PC or Palm Tops or Digital Diaries or T-Shirts?
Click here http://promos.sify.com/niit/main.asp?mail

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

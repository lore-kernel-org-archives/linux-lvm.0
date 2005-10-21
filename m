Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9LCEpV28810
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 08:14:51 -0400
Received: from qproxy.gmail.com (qproxy.gmail.com [72.14.204.201])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9LCEjPI001117
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 08:14:45 -0400
Received: by qproxy.gmail.com with SMTP id a10so72897qbd
	for <linux-lvm@redhat.com>; Fri, 21 Oct 2005 05:14:44 -0700 (PDT)
Message-ID: <80d985600510210514h29edd384n65d4d14dc0492399@mail.gmail.com>
Date: Fri, 21 Oct 2005 21:14:44 +0900
From: Craig Hagerman <craighagerman@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Correct way to add disc to LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

I want to make sure I understand the correct way to add more disc
space under LVM. If you have LVM set up on one single HD, and then
want to extend that to cover a second HD what is the correct way to
proceed?

From reading the HOWTO I think this is how it is done. Am I missing
anything essential here?

---------------------------------------------------------------------
Add physical volumes to a volume group:
---------------------------------------------------------------------
Use 'vgextend' to add an initialized physical volume to an existing
volume group.
# vgextend my_volume_group /dev/hdc1
                                    ^^^^^^^^^ new physical volume

---------------------------------------------------------------------
Extend logical volume:
---------------------------------------------------------------------

# lvextend -L12G /dev/myvg/homevol

         will extend /dev/myvg/homevol to 12 Gigabytes.

-----------------------------------------------------------------------------------------------------------
Increase size of file system to match the logical volume (assuming ext2 / 3):
-----------------------------------------------------------------------------------------------------------
   # umount /dev/myvg/homevol/dev/myvg/homevol
   # resize2fs /dev/myvg/homevol
   # mount /dev/myvg/homevol /home


Is this correct? Is this all you have to do?

Craig

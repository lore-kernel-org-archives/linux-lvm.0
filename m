Message-ID: <3BFAA72B.B15F9B4C@LTUtech.com>
From: Igor Dumaire <Igor.Dumaire@LTUtech.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgcfgrestore error !
References: <3BF8E5DE.ABAEB618@LTUtech.com> <20011119125632.A12388@sistina.com> <3BF8F8BF.3FE1491C@LTUtech.com> <20011119151746.A13040@sistina.com> <3BF923C3.A2060FDD@LTUtech.com> <20011120121947.B18529@sistina.com>
Content-Transfer-Encoding: 7bit
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
Date: Tue Nov 20 12:54:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

When I try :
# vgimport -v lvm1 /dev/hde1
vgimport -- locking logical volume manager
vgimport -- checking volume group name
vgimport -- checking volume group "lvm1" existence
vgimport -- trying to read physical volume
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hde1"
vgimport -- reading data of physical volume "/dev/hde1" from disk
vgimport -- checking for exported physical volume "/dev/hde1"
vgimport -- ERROR: physical volume "/dev/hde1" doesn't belong to an exported
volume group

Ok, I hadn't used vgexport !

# vgimport -f -v lvm1 /dev/hde1
vgimport -- locking logical volume manager
vgimport -- checking volume group name
vgimport -- checking volume group "lvm1" existence
vgimport -- trying to read physical volume
vgimport -- checking for duplicate physical volumes
vgimport -- checking physical volume name "/dev/hde1"
vgimport -- reading data of physical volume "/dev/hde1" from disk
vgimport -- checking for exported physical volume "/dev/hde1"
vgimport -- reallocating memory
vgimport -- checking consistency of physical volume "/dev/hde1"
Segmentation fault

why "Segmentation fault" ?


An idea ?

Thanks.


-- 
Igor Dumaire

www.LTUtech.com - Making Sense of Visual Content
------------------------------------------------

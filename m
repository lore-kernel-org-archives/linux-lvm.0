Date: Mon, 15 Oct 2001 12:08:17 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgextend
Message-ID: <20011015120817.B30655@sistina.com>
References: <1003139089.3bcab0116419a@webmail1.maa.sify.net>
Mime-Version: 1.0
In-Reply-To: <1003139089.3bcab0116419a@webmail1.maa.sify.net>; from kannan21977@sify.com on Mon, Oct 15, 2001 at 03:14:49PM +0600
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Kannan,

Your problem is caused by a LVM tool and kernel code mismatch.

Please follow the instructions in the INSTALL and PATCHES/README files
which come with the LVM source distribution in order to patch your kernel
correctly and generate/install it afterwards.

Regards,
Heinz    -- The LVM Guy --


On Mon, Oct 15, 2001 at 03:14:49PM +0600, kannan21977@sify.com wrote:
> Hi
> 
> I work for an ISP in India nad am currently trying to get LVM working for us..I use a 2.4.0 kernel.and LVM 1.0.
> I have not applied any patches except the one for ext2online.all commands work fine like pvcreate ,lvextend etc...
> 
> but when i do a vgextend when trying to add a physical volume to my volume group,I get a segementation fault error.
> i use the command 
> 
> vgextend vg1 /dev/hdb2
> 
> i had changed the partition id of /dev/hdb2 to 8e.
> then i did a pvcreate /dev/hdb2.even that worked fine.
> but when i try to add this pv to my volume group vg1 I get a segmentation fault error.has anyone come across this error.would be great to hear from anyone of u
> 
> thanx and regards
> kannan
> -------------------------------------------------
> This mail sent through : http://mail.sify.com
> Want to win a PC or Palm Tops or Digital Diaries or T-Shirts?
> Click here http://promos.sify.com/niit/main.asp?mail
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Return-Path: <root@srv.sistina.com>
Date: Wed, 7 Feb 2001 15:23:43 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I can't add other disk in lvm system
Message-ID: <20010207152343.O8914@srv.sistina.com>
References: <NDBBIPFGCOKBKKOFONLLEEMMCCAA.jcarles@dtic.ua.es>
Mime-Version: 1.0
In-Reply-To: <NDBBIPFGCOKBKKOFONLLEEMMCCAA.jcarles@dtic.ua.es>; from jcarles@dtic.ua.es on Wed, Feb 07, 2001 at 01:49:27PM +0100
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

Hi Joan,

you seem to have an older LVM version which unfortunatly had that bug.

Please get the recent LVM software from www.sistina.com and follow the
steps in the INSTALL file in order to get it up and running.

Then you should be able to do "vgextend -v vm0 /dev/hdc1" successfully.


On Wed, Feb 07, 2001 at 01:49:27PM +0100, Joan Carles Monllor wrote:
> 
> 	Hello, I am new in this mailing list. And, I am new in lvm system too.
> 
> 	My problem is:
> 
> 	I have create a logical volume, correctly. And, I want to add other disk to
> logical volum.
> 
> 	I already have create a volumen group named "vm0".
> 
> 	I think that I have run "vgextend -v vm0 /dev/hdc1", for exemple.
> 
> 	Then display this:
> 
> vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
> Unable to handle kernel NULL pointer dereference at virtual address 0000002c
>  printing eip:
> c01ecd4f
> *pde = 00000000
> Oops: 0000
> CPU:    0
> EIP:    0010:[<c01ecd4f>]
> EFLAGS: 00010282
> ....
> ....
> .
> .
> .
> Segment violation
> 
> 	The problem is in mine or in the kernel or the lvm tools ?
> 
> 		thanks for your help in avanced.
> 
> Joan Carles Monllor
> Universitat d'ALacant
> jcarles@dtic.ua.es        Tel. 965903681
> Spain                     Fax 965903902
> 



-- 

Regards,
Heinz    -- The LVM Guy --

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

Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 7 Feb 2001 14:28:18 +0000
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] I can't add other disk in lvm system
Message-ID: <20010207142818.G525@tykepenguin.com>
References: <NDBBIPFGCOKBKKOFONLLEEMMCCAA.jcarles@dtic.ua.es>
Mime-Version: 1.0
Content-Disposition: inline
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

Can you make sure you have the latest code, including the kernel patch, from
sistina.com. It sounds like you are using an old version.

patrick

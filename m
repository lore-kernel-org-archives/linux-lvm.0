Return-Path: <root@srv.sistina.com>
Date: Thu, 21 Jun 2001 11:09:56 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] mount: bad address
Message-ID: <20010621110956.D28374@sistina.com>
References: <20010618220049.A652@g7iii.junglelink.co.uk> <20010620155329.A25139@sistina.com> <20010620222027.A1115@g7iii.junglelink.co.uk>
Mime-Version: 1.0
In-Reply-To: <20010620222027.A1115@g7iii.junglelink.co.uk>; from iain@g7iii.junglelink.co.uk on Wed, Jun 20, 2001 at 10:20:27PM +0100
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

On Wed, Jun 20, 2001 at 10:20:27PM +0100, Iain Young wrote:
> Hi Heinz,
> 
> On Wed, Jun 20, 2001 at 03:53:29PM +0200, Heinz J. Mauelshagen wrote:
>  
> > did you follow the instructions in INSTALL and PATCHES/README contained
> > in the LVM distro to put necessary LVM patches into the kernel?
> 
> Yup, applied with no prons, compiled with no probs. module loads fine,
> everything works, except for the mount.

Hmmm...

Could you send the following output then (VGName as a placeholder):

- vgdisplay -v VGName
- lvscan -b
- ls -l /dev/VGName

Heinz

> 
> 
> Iain
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

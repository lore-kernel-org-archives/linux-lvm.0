Return-Path: <mauelshagen@sistina.com>
Date: Mon, 20 Aug 2001 12:57:00 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM on Redhat 7.1
Message-ID: <20010820125700.B26824@sistina.com>
Mime-Version: 1.0
In-Reply-To: <no.id>; from louis.becker@medietas.com on Fri, Aug 17, 2001 at 01:13:51PM -0000
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

Louis,

since Friday you should better get LVM 1.0.1-rc1 from www.sistina.com,
which *directly* supports the old and new metadata formats and avoids running
an explicit upgrade program.

On Fri, Aug 17, 2001 at 01:13:51PM -0000, Louis Becker wrote:
> Hi,
> 
> 	I am trying to install LVM 1.0 from sources on a RH7.1 box, the compilation seems ok, also the make install but at each call of vgscan i get the answer :
> 
> vgscan -dv
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: -102
> <1> lvm_get_iop_version -- LEAVING with ret: -102
> vgscan -- LVM driver/module not loaded?

Looks like you didn't start with a vanilla kernel patching it conforming
to the instructions in the PATCHES/README file contained in the LVM tarball
-or-
generated the LVM module but it is not lodable (compile/module install/
depmod failure).

> 
> 
> 	So how do i load this module and from where ?
> 
> 	PS: i use LVM on IBM AIX and it would be great to use it on linux
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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

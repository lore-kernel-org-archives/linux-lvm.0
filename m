From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] CONFIG_EXT2_RESIZE
Message-ID: <20011217122617.C28720@sistina.com>
References: <OF9DCE2190.BDA97513-ON86256B20.0072EBC9@TEXASMUTUAL.COM>
Mime-Version: 1.0
In-Reply-To: <OF9DCE2190.BDA97513-ON86256B20.0072EBC9@TEXASMUTUAL.COM>; from JPolache@texasmutual.com on Wed, Dec 12, 2001 at 02:58:26PM -0600
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
Date: Mon Dec 17 05:26:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Dec 12, 2001 at 02:58:26PM -0600, Jonathan S. Polacheck wrote:
> In  order  to  use ext2online, I need to have the Online ext2 resize
> support (CONFIG_EXT2_RESIZE) compiled into the kernel  (this  is  an
> optional patch for the 2.x series of kernels).  I downloaded
> lvm_1.0.1-rc4.tar.gz and created the patch file.  I then applied it using
> "patch" and answering "y" to "assume -R".  Then I went looking for
> CONFIG_EXT2_RESIZE in "make menuconfig".  No luck.  Any suggestions?

You need to get Andreas Dilger's online ext2 resizer code from sourceforge and
patch it in as well.

> 
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

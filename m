From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] LVM + 2.4.7 kernel
Message-ID: <20011120114558.U1308@lynx.no>
References: <OFBB873518.294BA1D6-ON05256B0A.005AE0D8@pe.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFBB873518.294BA1D6-ON05256B0A.005AE0D8@pe.ibm.com>; from mpighi@pe.ibm.com on Tue, Nov 20, 2001 at 11:44:01AM -0500
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
Date: Tue Nov 20 12:46:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marco Pighi/Peru/Contr/IBM <mpighi@pe.ibm.com>
Cc: linux-lvm@sistina.com

On Nov 20, 2001  11:44 -0500, Marco Pighi/Peru/Contr/IBM wrote:
> We have upgraded the kernel from a SuSE 7.0 (2.2.16 kernel) to a 2.4.7
> kernel in our Linux for S/390 system. We upgraded modutils, binutils, gcc
> and installed s390 tools as well. Almost everything is working well; the
> only problem we have is lvm: it loads without problems at boot time but
> when we try the vgscan command we get the following message:
> 
>      invalid i/o protocol version
> 
> Does anyone have any idea what could be wrong?

The LVM user tools you have do not work with the kernel version.  The
2.2.16 kernel uses IOP6, while the 2.4 kernel uses IOP10 (this version
number identifies all user<->kernel communication structs).

Depending on how the LVM user tools are installed, you can have both
versions installed at the same time.  This can be done with an
"lvm-wrapper" put in place of the normal binaries (e.g. /sbin/vgscan)
and then it calls the appropriate version tool under /lib/lvm-iopX/vgscan.
The alternative is to change your PATH depending on IOP version (use
the lvmiopversion command in a new LVM tools package) to use the right
directory depending on the current kernel.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/

Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id i1R9wioH002401
	for <linux-lvm@redhat.com>; Fri, 27 Feb 2004 10:58:44 +0100
From: Heinz Mauelshagen <Mauelshagen@redhat.com>
Subject: Re: [linux-lvm] LVM2 problem/disaster
Message-ID: <20040227095843.GB8688@redhat.com>
References: <29267.1077389428@www38.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29267.1077389428@www38.gmx.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 27 04:57:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Feb 21, 2004 at 07:50:28PM +0100, Michaeljohn Clement wrote:
> Hi,
> 
> I recently upgraded lvm2 to 2.00.08 on my Gentoo installation.  After
> rebooting, LVM fails to activate my volume group.  Since I have /home, /usr, and
> /var on LVM, this creates a huge problem for me, and I can't downgrade the LVM
> user-space tools to see if it fixes the problem.
> 
> My main disk is a SATA drive, which is only supported by linux 2.6 kernels.
> 
> I am using kernel 2.6.1, with device-mapper compiled into the kernel.  
> Here's the problem:
> 
> # /sbin/lvchange -a y vg

You mean "vgchange -ay vg", right ?

> /dev/cdrom: open failed: Read-only file system
> device-mapper ioctl cmd 0 failed: Invalid argument
> 0 logical volume(s) in volume group "vg" now active

Set up a device filter in /etc/lvm/lvm.conf in order to avoid needless
spinning on the cdrom device. (see the filter= line).

Run: "vgscan ; vgchange -ay vg"

> 
> I don't know what the /dev/cdrom error is related to, I've never seen that
> before.   Obviously the device-mapper error is the show-stopper.  Is this a
> kernel problem, an LVM2 problem, or something else, and how can I fix it?
> 
> If there's no good way to fix it, then how can I go about recovering my
> data?  KNOPPIX is still using 2.4 kernels, so it won't even be able to access my
> main hard drive, unless there is a KNOPPIX built with 2.6 out there.  Are
> there any live CDs that include both SATA and LVM2 support?  If not, is there
> any other way to recover the data?  Obviously any help would be greatly
> appreciated!
> 
> Thanks,
> 
> Michaeljohn Clement
> 
> -- 
> GMX ProMail (250 MB Mailbox, 50 FreeSMS, Virenschutz, 2,99 EUR/Monat...)
> jetzt 3 Monate GRATIS + 3x DER SPIEGEL +++ http://www.gmx.net/derspiegel +++
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

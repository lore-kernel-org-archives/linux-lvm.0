From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Error in LVM Installation
Message-Id: <20020306105555.B21935@sistina.com>
References: <20020306051331.7466.qmail@web13603.mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <20020306051331.7466.qmail@web13603.mail.yahoo.com>;
    from ashishgupta01@yahoo.com on Tue, Mar 05, 2002 at 09:13:31PM -0800
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
Date: Wed Mar  6 03:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ashish,

I guess you didn't start with a clean vanilla kernel patching
the LVM driver in, as described in the LVM distro in files INSTALL and
PATCHES/README.

If so, use a clean vanilla kernel and retry.


On Tue, Mar 05, 2002 at 09:13:31PM -0800, Ashish Gupta wrote:
> Hi,
> 
> I'm facing lots of problem during installation of LVM
> in Linux Red Hat version 7.2.
> 
> I tried installing both the version of LVM 1.0.2 and
> 1.0.3 with Red Hat Linux 7.2(kernel version 2.4.7-10)
> and with Red Hat Linux 7.1(kernel version 2.4.2).
> 
> Once LVM is installed on the system.And when I reboot
> the system it shows some file system error and kernel
> panic occurs.I do not whats the reason for that.
> 
> Pls guide me to install LVM on my system.Pls guide
> which LVM version is most suitable against which Linux
> Kernel Version.
> 
> Thanx,
> Ashish
> 
> =====
> -Ashish Gupta
> 
> __________________________________________________
> Do You Yahoo!?
> Try FREE Yahoo! Mail - the world's greatest free email!
> http://mail.yahoo.com/
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

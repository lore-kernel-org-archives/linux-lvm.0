From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How to upgrade old LVM version.
Message-ID: <20020909125357.B15934@sistina.com>
References: <3D790636.5010603@lingbrae.com>
Mime-Version: 1.0
In-Reply-To: <3D790636.5010603@lingbrae.com>; from dick@lingbrae.com on Fri, Sep 06, 2002 at 08:47:02PM +0100
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
Date: Mon Sep  9 06:24:54 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Sep 06, 2002 at 08:47:02PM +0100, Dick Middleton wrote:
> Hi,
> 
>     I'm currently running LVM 0.9.1_beta6 on Debian 2.2 with kernel 
> 2.2.19 and have been trying
> for some time to upgrade to something more recent.
> 
> Whenever I try this I find that vgscan from any newer version of LVM 
> hangs (without
> error messages) - I'm forced to reboot.  The only evidence I can find is 
> if I run pvscan.  
> This reports "different structure size".

vgscan coming with a newer LVM version should scan your disks fine.
Tha fact that it hangs could refer to an empty CDROM or the like scanned
and a large timeout involved.

Running "vgscan -d" should find the relevant 'candidate'.
If so, temporarily inserting a valid CD or removing the /dev/ entry
could help it.

> 
> I currently have all my filesystem including root running on LVM on top 
> of software RAID so
> it's a fairly delicate business mucking about with this.  I'm looking 
> for  a way to fix the problem
> other than decanting everything to tape and starting from scratch again.
> 
> I do have a separate bootable disc with 2.4 kernel and LVM 1.0 which I 
> can use as a stepping
> stone but so far this too hangs as soon as vgscan is run.
> 
> Any advice would be appreciated.
> 
> Dick
> 
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

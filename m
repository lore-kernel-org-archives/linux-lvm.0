From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvchange problem
Message-Id: <20020115154731.J11005@sistina.com>
References: <25E4CA13D679FF48BC307694202209710164DE2E@nd1-clusa.local.bunnings.com.au>
MIME-Version: 1.0
In-Reply-To: <25E4CA13D679FF48BC307694202209710164DE2E@nd1-clusa.local.bunnings.com.au>;
    from CCoe@bunnings.com.au on Fri, Jan 04, 2002 at 02:23:52PM +0800
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
Date: Tue Jan 15 08:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Colin,

that was fixed recently.
LVM 1.0.1 works.

Regards,
Heinz    -- The LVM Guy --

On Fri, Jan 04, 2002 at 02:23:52PM +0800, Colin Coe wrote:
> 
> Hi all
> 
> I have come across a problem with lvchange.  When I change the availability
> of an LV from active to inactive, and then try and change it back I get the
> error "Operation not permitted".  I can only get the LV back by rebooting.
> 
> A search of Google turned up something similar but there were no responses
> to that post.
> 
> System details are: 
> Pentium II-400
> 2 x 20GB Quantum drives
> 256MB RAM
> 2.4.14 with XFS
> lvm-tools              1.0.1rc4-2
> Gnu C                  2.96
> Gnu make               3.79.1
> binutils               2.11.90.0.8
> util-linux             2.11f
> mount                  2.11g
> modutils               2.4.6
> e2fsprogs              1.23
> reiserfsprogs          3.x.0j
> Linux C Library        2.2.4
> Dynamic linker (ldd)   2.2.4
> Procps                 2.0.7
> Net-tools              1.60
> Console-tools          0.3.3
> Sh-utils               2.0.11
> 
> 
> Any ideas?
> 
> CC
> 
> 
> [root@linux-lvm root]# df -k
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/md0               2042880   1335560    707320  66% /
> /dev/md1                 59328      5292     54036   9% /boot
> none                    127472         0    127472   0% /dev/shm
> /dev/rootvg/bbs          60736        80     60656   1% /bbs
> /dev/rootvg/bbsdata    2026816       144   2026672   1% /bbs/data
> 
> [root@linux-lvm root]# umount /bbs/data
> 
> [root@linux-lvm root]# lvchange -an /dev/rootvg/bbsdata
> lvchange -- logical volume "/dev/rootvg/bbsdata" changed
> lvchange -- doing automatic backup of volume group "rootvg"
> lvchange -- no difference to old backup in "/etc/lvmconf/rootvg.conf"
> 
> [root@linux-lvm root]# df -k
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/md0               2042880   1335580    707300  66% /
> /dev/md1                 59328      5292     54036   9% /boot
> none                    127472         0    127472   0% /dev/shm
> /dev/rootvg/bbs          60736        80     60656   1% /bbs
> 
> [root@linux-lvm root]# lvchange -ay /dev/rootvg/bbsdata
> lvchange -- ERROR "Operation not permitted" couldn't open logical volume
> "/dev/rootvg/bbsdata"
> 
> And the same again in verbose mode.
> 
> [root@linux-lvm root]# lvchange -ay -v /dev/rootvg/bbsdata
> lvchange -- locking logical volume manager
> lvchange -- checking logical volume name
> lvchange -- checking volume group existence
> lvchange -- checking for active volume group "rootvg"
> lvchange -- reading volume group data of "rootvg" from disk(s)
> lvchange -- checking consistency of "rootvg"
> lvchange -- checking logical volume "/dev/rootvg/bbsdata" existence
> lvchange -- getting index of logical volume "/dev/rootvg/bbsdata" in volume
> group "rootvg"
> lvchange -- getting status of "/dev/rootvg/bbsdata" from VGDA in kernel
> lvchange -- changing logical volume "/dev/rootvg/bbsdata" in VGDA of kernel
> lvchange -- ERROR "Operation not permitted" couldn't open logical volume
> "/dev/rootvg/bbsdata"
> 
> 
> **************************************************************************
> Bunnings Legal Disclaimer: 
> 
> 1) 	This document is confidential and may contain legally privileged 
> 	information. If you are not the intended recipient you must not 
> 	read, copy, distribute or act in reliance on it.
> 	If you have received this document in error, please telephone
> 	us immediately on (08) 9365-1555. 
> 
> 2)	All e-mails sent to and sent from Bunnings Building Supplies are
> 	scanned for content. Any material deemed to contain inappropriate
> 	subject matter will be reported to the e-mail administrator of
> 	all parties concerned.
> 
> **************************************************************************
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

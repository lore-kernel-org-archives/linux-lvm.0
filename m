From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM - Multipath / Failover
Message-ID: <20030925151142.E2618@sistina.com>
References: <HLRQMH$2DE0339CD21640CE00AD36D8D76DB9A4@terra.com.br>
Mime-Version: 1.0
In-Reply-To: <HLRQMH$2DE0339CD21640CE00AD36D8D76DB9A4@terra.com.br>; from edugdias@terra.com.br on Thu, Sep 25, 2003 at 08:59:05AM -0300
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
Date: Thu Sep 25 08:23:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

We've got a device-mapper multipath target in development and will
add tool support for multipathing to LVM 2.2 later this year.

Regards,
Heinz    -- The LVM Guy --

On Thu, Sep 25, 2003 at 08:59:05AM -0300, Eduardo Dias wrote:
> Hi all,
> 
> I am looking for any information about LVM with multipathing for failover and/or load balance, but I just found information using LVM and RAID.
> I would like  to know if is possible to configure a VG with 2 paths to access the same disk device without using RAID?
> I have a RH 7.3 (2.4.18) and AS 2.1 (2.4.x).
> The sorage has been connected on a SAN enviroment.
> 
> Thanks a lot.
> 
> Best regards,
> 
> Eduardo Dias
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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

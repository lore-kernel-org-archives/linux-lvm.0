Return-Path: <root@srv.sistina.com>
Date: Mon, 30 Apr 2001 16:11:49 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgcreate doesn't work for me
Message-ID: <20010430161149.K19810@sistina.com>
Mime-Version: 1.0
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

Arkadiusz,

in order to be able to investigate your problem better,
could you provide the following output please:

$ fdisk -l /dev/hdd

$ pvdisplay /dev/hdd[1-3]

$ vgcreate -d test /dev/hdd[1-3]


Warning: if you create a VG containing PVs in multiple partitions of the
         same disk, you will likely run into trouble if you want to
         test striped LVs.

Regards,
Heinz    -- The LVM Guy --

On Sun, Apr 29, 2001 at 07:49:50PM +0200, Arkadiusz Miskiewicz wrote:
> I wanted to do some test with lvm and doing as in LVM-HOWTO:
> 
> [root@arm misiek]# pvcreate /dev/hdd[123]
> pvcreate -- physical volume "/dev/hdd1" successfully created
> pvcreate -- physical volume "/dev/hdd2" successfully created
> pvcreate -- physical volume "/dev/hdd3" successfully created
> 
> [root@arm misiek]# vgcreate test /dev/hdd[123]
> vgcreate -- no valid physical volumes in command line
> 
> [root@arm misiek]# uname -a; rpm -q lvm
> Linux arm 2.4.4 #1 sob kwi 28 12:49:56 CEST 2001 i686 pld
> lvm-0.9.1-0.beta7
> [root@arm misiek]# 
> 
> unfortunately vgcreate doesn't want to work for me :-(
> 
> Any suggestions?
> -- 
> Arkadiusz Mi?kiewicz, AM2-6BONE    [ PLD GNU/Linux IPv6 ]
> http://www.t17.ds.pwr.wroc.pl/~misiek/ipv6/   [ enabled ]
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

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

Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Sun, 3 Dec 2000 13:54:42 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Subject: Re: [linux-lvm] Old problem cropping up again with 0.9 lvm tools?
Message-ID: <20001203135442.B3922@srv.t-online.de>
References: <3A247D53.E3B78F60@cup.hp.com>
Mime-Version: 1.0
In-Reply-To: <3A247D53.E3B78F60@cup.hp.com>; from defranco@cup.hp.com on Tue, Nov 28, 2000 at 07:51:47PM -0800
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

Looks like the 0.8.1 works with MD, 0.9 doesn't.
I asked Luca Bera to help narrowing this one down.

On Tue, Nov 28, 2000 at 07:51:47PM -0800, John DeFranco wrote:
> Hi,
> 
> I'm having a problem doing a pvcreate on a raid
> device. It fails with:
> 
> [root@ham 0.9]# pvcreate -v /dev/md0
> pvcreate -- locking logical volume manager
> pvcreate -- checking physical volume name "/dev/md0"
> pvcreate -- getting physical volume size
> pvcreate -- checking partition type
> pvcreate -- invalid partition type 0x83 for "/dev/md0" (must
> be 0x8e)
> 
> I had this problem with the 0.8final but was pointed to
> a suse lvm user tools rpm (lvm-0.8-70-i386.rpm) that worked
> great. 
> 
> Now with the 0.9 tools the issue is here again. Is there
> a fix for this (since I don't think I should use the
> 0.8 suse tools with 0.9 lvm)?
> 
> Thanks.
> -- 
> ==========
> Cheers
>    -jdf
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz      -- The LVM guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

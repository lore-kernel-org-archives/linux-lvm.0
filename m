Received: from o.ww.redhat.com (vpnuser1.stuttgart.redhat.com [172.16.4.1])
	by pobox.stuttgart.redhat.com (8.12.8/8.12.8) with ESMTP id
	iA8HXFGX026479
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 18:33:15 +0100
Date: Mon, 8 Nov 2004 18:33:15 +0100
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Backup/Recovery Strategies
Message-ID: <20041108173315.GA21451@redhat.com>
References: <20041106221645.0AFFA97930@snark.apl.washington.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041106221645.0AFFA97930@snark.apl.washington.edu>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, Nov 06, 2004 at 02:16:46PM -0800, Axel Schweiger wrote:
> Can anyon  suggest backup/recovery strategies for filesystems under LVM.
> (Version 1 and 2)
>  
> 1) If I loose the data in the /etc/lvm directory (or lvm.d) do I loose the
> filesystems controlled by lvm?

No, those are work files which can be recreated running vgscan
for LVM1. LVM1 keeps metadata archive files in /etc/lvmconf/ which
needs to be covered by your backup.

By default, /etc/lvm/ contains subdirectory for metadata archive in
the case of LVM2.

Best practice therefore is to backup /etc/lvm*

> 2) How do I recover from a loss or corrpution of the LVM data.

vgcfgrestore the recent metadata archive (from /etc/lvmconf/ for LVM1
or from /etc/lvm/backup/ for LVM2.

> 3) What happens if the LVM filesystems have changed since the last backup of
> the metadata?

You are refering to VGs and LVs here.

If you don't have an actual backup of /etc/lvm* *and*
corrupt your LVM metadata on the defices after a change, you can
restore the most recent archive from your last /etc/lvmconf/ backup (LVM1)
or from /etc/lvm/backup/ (LVM2) which might be ok still or not, depending
on your changes.

>  
> Sorry if this shows a profound lack of understanding of LVM but I''m new to
> this and haven't been able to find any recipes for doing 
> backups?

The only LVM related backup is about its metadata archives and covered
in 'man lvm'.
Of course all data stored in LVs should be subject to regular backups
as with any block devices.

> 
> Thanks much
> Axel

> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

-- 

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

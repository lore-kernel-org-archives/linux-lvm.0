Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAJHRsr26138
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:27:54 -0500
Received: from mailgate2.Cadence.COM (mailgate2.Cadence.COM [158.140.2.31])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAJHRqxR025268
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 12:27:52 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Chris Croswhite <csc@cadence.com>
In-Reply-To: <1100857645.13422.99.camel@grma-lap>
References: <1100857645.13422.99.camel@grma-lap>
Message-Id: <1100885267.19894.217.camel@rct07.cadence.com>
Mime-Version: 1.0
Date: Fri, 19 Nov 2004 09:27:47 -0800
Content-Transfer-Encoding: 7bit
Reply-To: csc@cadence.com,
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
To: Gary.Mansell@ricardo.com, LVM general discussion and development <linux-lvm@redhat.com>

I use the ATABoy 2x (dual active/active FC) with great success.  I use
md to create a failover path (see mdadm) on newer kernels (2.6.9) and I
have multiple 3.2T LUNS (multiple ataboys).  I use LVM2 to partition
some of the LUNs with great success.

Too, if this is a heavily beat file server, I would highly recommend
using the 2.6.8+ kernel and grab what ever patches you can for knfsd and
networking.  Also look at proc/sys/vm/vfs_cache_pressure et al.

Best of Luck.

On Fri, 2004-11-19 at 01:47, Gary Mansell wrote:
> Dear all,
> 
> I currently run RHAS3.0 on a Dell PE2650 which is directly attached to
> an EMC FC4500 2TB HW RAID 5 unit via two QLA2310F Fibre Channel cards.
> I have EMC's Powerpath software installed to give me multiple paths to
> the disk subsytem in case of controller or cable failure. 
> 
> This configuration has served me well but is now about to be End Of
> Life'd by Dell and I need to grow the storage. There is obviously
> quite a price premium to pay for this sort of kit so I was hoping to
> find a cheaper solution for the future.
> 
> I have seen the Nexsan ATABEAST which is a 16TB ATA array with dual
> fibre channel controllers. It seems to be well liked and is reasonably
> priced but my concern is how to achieve multiple paths to the disk.
> How would you recommend achieving a highly available configuration
> with this sort of disk subsystem?
> 
> Also, am I correct in thinking that the maximum filesystem size with
> RHEL 3.0 is 2TB? Is it possible to get over this limitation with LVM
> or some other method?
> 
> Any advice gladly received.
> 
> Thanks in advance
> 
> Gary Mansell -- 
> 
> This e-mail and any files transmitted with it are confidential and
> intended solely for the use of the individual or entity to whom they
> are addressed.
> If you have received this e-mail in error please notify the sender
> immediately and delete this e-mail from your system. Please note that
> any views
> or opinions presented in this e-mail are solely those of the author
> and do not necessarily represent those of Ricardo (save for reports
> and other
> documentation formally approved and signed for release to the intended
> recipient). Only Directors or Duly Authorised Officers are authorised
> to 
> enter into legally binding obligations on behalf of Ricardo unless the
> obligation is contained within a Ricardo Purchase Order.
> 
> Ricardo may monitor outgoing and incoming e-mails and other
> telecommunications on its e-mail and telecommunications systems. By
> replying to
> this e-mail you give consent to such monitoring. The recipient should
> check e-mail and any attachments for the presence of viruses. Ricardo 
> accepts no liability for any damage caused by any virus transmitted by
> this e-mail. "Ricardo" means Ricardo plc and its subsidiary companies.
> 
> Ricardo plc is a public limited company registered in England with
> registered number 00222915.
> The registered office of Ricardo plc is Bridge Works,Shoreham-by Sea,
> West Sussex, BN43 5FG.
> 
> 
> ______________________________________________________________________
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

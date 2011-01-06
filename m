Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p06GBQrK003842
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 11:11:26 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.123])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p06GBF0V009236
	for <linux-lvm@redhat.com>; Thu, 6 Jan 2011 11:11:15 -0500
Message-ID: <4D25EAB4.6050606@cfl.rr.com>
Date: Thu, 06 Jan 2011 11:15:48 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <581831.19828.qm@web39308.mail.mud.yahoo.com>	<Pine.LNX.4.64.1101051343590.3928@bmsred.bmsi.com>
	<413157.10262.qm@web39310.mail.mud.yahoo.com>
In-Reply-To: <413157.10262.qm@web39310.mail.mud.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] snapshot pools, lvm roadmap
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Brian Neu <proclivity76@yahoo.com>

On 1/5/2011 3:56 PM, Brian Neu wrote:
> I perform SMB consulting and when a Linux solution fits the client's needs, I 
> always go with Linux.  But increasingly, I can't justify Linux file servers. 
>  I've written some cron scripts that take and release lvm snapshots on a 
> schedule, but compared to the Volume Shadow Copy of NTFS that Microsoft released 
> in 2003, it's just cumbersome and basic.  We're approaching 8 years without a 
> comparable response.  I'm just rather shocked when thinking about it.

rsync-backup?

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2JKlrj26151
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 15:47:53 -0500
Received: from mwinf0801.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2JKlpWA009561
	for <linux-lvm@redhat.com>; Fri, 19 Mar 2004 15:47:52 -0500
Subject: Re: [linux-lvm] root on lvm
From: Garcia Pascal <dld.pascal.garcia@wanadoo.fr>
In-Reply-To: <1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
References: <1079478024.2432.9.camel@rich>
	<1079705946.29353.6.camel@tesla.mmt.bellhowell.com>
Message-Id: <1079729272.2126.12.camel@pascal>
Mime-Version: 1.0
Date: Fri, 19 Mar 2004 21:47:52 +0100
Content-Transfer-Encoding: 8bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,
I experienced also difficulties with / and lvm2.
configuration: 
   MANDRAKE 10.0, 
   kernel 2.6.3, 
   lilo 22.5.8, 
   reiserfs 3.6.11 ?
   lvm 2.00.08
 
The message I have got is something like lilo does not handle device
type 0x1f00 

Can not ensure that it is the exact message and type.

I understood that the version of lilo I use can not handle lvm2 and
reiserfs partition for / during boot ! And especially can not get boot
image in /boot.

Shame :(

regards

Pascal Garcia

Le ven 19/03/2004 � 15:19, Jeffrey Layton a �crit :
> On Tue, 2004-03-16 at 18:00, Rich Turner wrote:
> > i am trying to mount / on a logical volume with reiserfs. my initrd
> > appears to be loading all of the appropriate modules (lvm-mod, dm-mod,
> > reiserfs) but i get the following error when the initrd exits and tries
> > to mount /.
> > 
> > device-mapper: unknown block ioctl 0x5310
> > sh-2021: reiserfs_read_super: can not find reiserfs on device mapper
> > (254,1)
> > 
> > is this related to reiserfs or lvm? or my initrd?
> > using:
> > lvm-2.00.07
> > reiserfs-3.6.9-37
> > suse-9.0
> > kernel-2.4.21-144-athlon
> > 
> 
> You likely are hitting a problem with the device numbering for DM
> devices. The kernel dynamically allocates major and minor numbers for
> the DM, so booting to a different kernel can renumber your DM devices.
> Have a look at the lvm2create_initrd script that's been posted on this
> list several times to see how I (and others) have handled this
> situation. It's also available here:
> 
> http://poochiereds.net/svn/lvm2create_initrd
> 
> -- Jeff
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i17MYRa17146
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 17:34:27 -0500
Received: from gw.uk.sistina.com (gw.uk.sistina.com [62.172.100.98])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i17MYQb22861
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 17:34:27 -0500
Received: from agk by gw.uk.sistina.com with local (Exim 3.12 #1 (Debian))
	id 1Apb1u-0001bY-00
	for <linux-lvm@redhat.com>; Sat, 07 Feb 2004 22:34:26 +0000
Subject: Re: [linux-lvm] root on lvm2 on raid5 problem... kernel 2.6.x
Message-ID: <20040207223426.Y1170@uk.sistina.com>
References: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>; from Geoffrey.Weber@mcleodusa.com on Thu, Feb 05, 2004 at 02:37:44PM -0600
From: linux-lvm-admin@redhat.com
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb  7 17:34:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Thu, Feb 05, 2004 at 02:37:44PM -0600, Weber, Geoffrey M. wrote:
> I've done quite a bit of research and worked on it quite a while, but I am
> having problems booting to a lvm2 on raid5 configuration.  

>     -- The error I get when running "lvm vgchange -ay" is:
>         device-mapper: dm-linear: Device lookup failed
 
Some more tips that might be useful:
  dmsetup vgmknodes: creates /dev/mapper directories entries for active devices
  vgmknodes: as above, plus /dev/<vg>/<lv> links
[Useful after switching to root device]

> From the initrd image, however, vgchange is unable to activate
> the volumes.
If it's read-only, vgscan/vgchange --ignorelockingfailure
 
Alasdair
-- 
agk@uk.sistina.com

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k18BYc115243
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2006 06:34:38 -0500
Received: from smtp801.mail.ukl.yahoo.com (smtp801.mail.ukl.yahoo.com
	[217.12.12.138])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k18BYb3g006268
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2006 06:34:37 -0500
Date: Wed, 8 Feb 2006 09:33:04 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Subject: Re: [linux-lvm] can't create a PV
Message-ID: <20060208093304.GA9374@tui.site>
References: <20060206215141.GB7492@tui.site>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060206215141.GB7492@tui.site>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Feb 06, 2006, Gunther Clasen wrote:
> Hi,
> 
> I have the following problem: I have a VG which sits on two partitions.
> This VG has been created with SuSE 7.2, that is version 1 of LVM. (I
> don't know exactly which one.) I wish to extend that VG and I have tried
> to do that from SuSE 9.2, which runs
>   LVM version:     2.00.25 (2004-09-29)
>   Library version: 1.00.19-ioctl (2004-07-03)
>   Driver version:  4.1.0
> 
> The type of the partition is set to Linux LVM, like the others, but it
> does not work. I get this error:
> 
> # pvcreate -vv /dev/hdg9
>       Setting global/locking_type to 1
>       Setting global/locking_dir to /var/lock/lvm
>       File-based locking enabled.
>       Locking /var/lock/lvm/P_orphans WB
>       Getting size of /dev/hdg9
>       metadata/pvmetadatasize not found in config: defaulting to 255
>       metadata/pvmetadatacopies not found in config: defaulting to 1
>   /dev/hdg9: Couldn't find device.  Check your filters?
>       Unlocking /var/lock/lvm/P_orphans
> 
> I can't see that the filters are a problem. The entry in
> /etc/lvm/lvm.conf is:
>     filter = [ "r|/dev/.*/by-path/.*|", "r|/dev/.*/by-id/.*|", "a/.*/" ]
> 
> I understand now that I should use -M1 to add this PV to an old V1 VG,
> but that is not the problem. I still get the same error.
> 
> What am I doing wrong?
> 
> Any help would be appreciated.
> 
> Gunther

I have investigated this a bit further. I have booted SuSE 9.0 and done
a pvcreate /dev/hdg9 from there. It worked fine. I have then added this
PV to VG vg7, which worked fine, too.

When I then boot SuSE 9.2 again, I get the following in
/var/log/boot.msg:

<notice>run boot scripts (boot.lvm)
Scanning for LVM volume groups...
  Reading all physical volumes.  This may take a while...
  1 PV(s) found for VG vg1: expected 2
  Volume group "vg1" not found
  Found volume group "vg0" using metadata type lvm1
  2 PV(s) found for VG vg7: expected 3
  Volume group "vg7" not found
  Found volume group "vg4" using metadata type lvm1
Activating LVM volume groups...
  1 PV(s) found for VG vg1: expected 2
  Unable to find volume group "vg1"
  11 logical volume(s) in volume group "vg0" now active
  2 PV(s) found for VG vg7: expected 3
  Unable to find volume group "vg7"

VG vg1 is dead. I have no clue why it still finds traces of it on the
system. VG vg0 and vg4 are up and running. The problem is vg7, to which
I have just added /dev/hdg9. Why can't lvm find it??? /dev/hdg9 has
previously been used as part of an md device (soft raid).

Is this a bug in lvm? Or is my harddisk dying? Or what could it be?

I hope I haven't actually killed my vg7 yet... (All I did was adding the
PV, no data on it yet.)

Gunther

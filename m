Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1EEMW128222
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 09:22:32 -0500
Received: from smtp811.mail.ukl.yahoo.com (smtp811.mail.ukl.yahoo.com
	[217.12.12.201])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k1EEMV8D029030
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2006 09:22:31 -0500
Date: Tue, 14 Feb 2006 09:19:46 +0000
From: Gunther Clasen <gunther_clasen@arcor.de>
Subject: Re: [linux-lvm] can't create a PV
Message-ID: <20060214091946.GA8977@tui.site>
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

Well, I tried a few more things, thought about it, and concluded:
Nothing. I believe the program gets it wrong. The reason for this:

I had 4 partitions on my system which lvm would not detect. These were
hde9, hde10, hdg9 and hdg10. Like so:

# vgdisplay -vv vg0 | grep hde
      /dev/hde: No label detected
      /dev/hde1: No label detected
      /dev/hde3: No label detected
      /dev/hde4: No label detected
      /dev/hde5: lvm1 label detected
      /dev/hde6: lvm1 label detected
      /dev/hde7: lvm1 label detected
      /dev/hde8: lvm1 label detected

# fdisk /dev/hde
Command (m for help): p
   Device Boot      Start         End      Blocks   Id  System
/dev/hde1               1          50       25168+  83  Linux
/dev/hde2            2151      158816    78959664    5  Extended
/dev/hde3              51        1100      529200   83  Linux
/dev/hde4            1101        2150      529200   83  Linux
/dev/hde5            2151        8466     3183232+  8e  Linux LVM
/dev/hde6            8467       25216     8441968+  8e  Linux LVM
/dev/hde7           25217       58616    16833568+  8e  Linux LVM
/dev/hde8           58617       92016    16833568+  8e  Linux LVM
/dev/hde9           92017      125416    16833568+  83  Linux
/dev/hde10         125417      158816    16833568+  83  Linux

So hde9 and 10 do exist, but lvm does not even try to detect anything on
them. (No, doesn't work with partition type LVM either, I tried that.)

Partitions hdg9 and 10 did look exactly the same. I then formatted them
(hdg9/10), one with ext2, the other with reiserfs and banged them full
with data, mostly from /dev/zero, until 100% full. I then changed the
type to Linux LVM and everything works fine:

# vgdisplay -vv vg0 | grep hdg
      /dev/hdg: No label detected
      /dev/hdg1: No label detected
      /dev/hdg5: No label detected
      /dev/hdg6: No label detected
      /dev/hdg7: lvm1 label detected
      /dev/hdg8: lvm1 label detected
      /dev/hdg9: lvm2 label detected
      /dev/hdg10: No label detected

Curiously, these 4 partitions had all been used in a software-RAID
volume. So I reckon that lvm somehow picked up the metadata of the
MD-device and refused to work.

There must be some sort of bug-tracking system for lvm. Could somebody
please point me at that so that I can check this out and possibly enter
this as a bug? (Provided that the public has write access...)

Thanks!

Gunther

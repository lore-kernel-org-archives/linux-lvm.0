Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5HIKbvp020688
	for <linux-lvm@redhat.com>; Sat, 17 Jun 2006 14:20:37 -0400
Received: from mailgw.aecom.yu.edu (mailgw.aecom.yu.edu [129.98.1.16])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5HIKZMG014887
	for <linux-lvm@redhat.com>; Sat, 17 Jun 2006 14:20:35 -0400
Mime-Version: 1.0
Message-Id: <a06230962c0b9f4072b54@[129.98.90.227]>
In-Reply-To: <20060612100003.17AB22DF653D@mail.linbit.com>
References: <20060612100003.17AB22DF653D@mail.linbit.com>
Date: Sat, 17 Jun 2006 14:20:28 -0400
From: Maurice Volaski <mvolaski@aecom.yu.edu>
Subject: [linux-lvm] Re: Spontaneous access to the CDROM on two computers
 simultaneously
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: drbd-user@linbit.com
Cc: gentoo-user@lists.gentoo.org, linux-kernel@vger.kernel.org, linux-lvm@redhat.com

It happened again, but this time on just one of the two computers:

[20770.844282] hda: tray open
[20770.844288] end_request: I/O error, dev hda, sector 0
[20770.844292] Buffer I/O error on device hda, logical block 0

Since you think LVM may be misbehaving, I changed the filter on the 
affected computer to read

filter = [ "r|/dev/cdrom|", "r|/dev/hda|", "r|/dev/ide|" ]

Ironically, that's on the computer that threw the error, so it could 
be more evidence LVM has a problem if it is indeed the cause or 
further evidence that it isn't involved.

The kernel on this amd64-based computer is now 2.6.16.20. LVM is 
version 2.02.05 (versions from Gentoo packages). Device mapper is 
1.02.07 and udev is 090.) Since I'm shooting in the dark, cc'd to the 
gentoo ml since this system is gentoo-based (2005.0 profile).


>/ 2006-06-12 01:06:30 -0400
>\ Maurice Volaski:
>>  Spontaneously and for no apparent reason, two computers displayed 
>>the following message in their logs several times at the same time:
>>
>  > [55419.446442] Buffer I/O error on device hda, logical block 0
>  > [55419.447381] hda: command error: status=0x51 { DriveReady 
>SeekComplete Error }
>>  [55419.447386] hda: command error: error=0x54 { AbortedCommand 
>>LastFailedSense=0x05 }
>>  [55419.447389] ide: failed opcode was: unknown
>>  [55419.447391] end_request: I/O error, dev hda, sector 0
>>
>...
>>  drbd could at least theoretically triggered this somehow.
>no.
>
>much more likely some program scanning ("discovering") devices.
>
>just a wild guess:
>man lvm.conf
>/filter

-- 

Maurice Volaski, mvolaski@aecom.yu.edu
Computing Support, Rose F. Kennedy Center
Albert Einstein College of Medicine of Yeshiva University

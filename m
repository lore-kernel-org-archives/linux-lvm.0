Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k323E0YJ016040
	for <linux-lvm@redhat.com>; Sat, 1 Apr 2006 22:14:00 -0500
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k323DwDE001832
	for <linux-lvm@redhat.com>; Sat, 1 Apr 2006 22:13:59 -0500
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1FPt2L-0007GO-Mp
	for linux-lvm@redhat.com; Sun, 02 Apr 2006 05:13:57 +0200
Received: from 221.125.22.76 ([221.125.22.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 02 Apr 2006 05:13:57 +0200
Received: from thomas by 221.125.22.76 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 02 Apr 2006 05:13:57 +0200
From: "Thomas" <thomas@meiwing.com>
Date: Sun, 2 Apr 2006 11:13:42 +0800
Message-ID: <e0nfh9$22d$1@sea.gmane.org>
References: <e0f2dq$eck$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Data recover on error deleted PV/VG
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@redhat.com

Finally, I use RIP (R)ecovery (I)s (P)ossible! (v15.2).
And command hexdump /dev/hda2 and /dev/hdb1 to collect the old LVM config
information.
They are nearly 1200.
Use the information to create a metadata file.
Use cfgrestore to recover.
Then mount back the lost LogVol00.

Just my two cents.

"Thomas" <thomas@meiwing.com> �b�l�� news:e0f2dq$eck$1@sea.gmane.org �����g
...
> Hi all,
>
> My story is:
>
> 1 x 20G (hda) + 1 x 40G (hdb) running more than half year.
> The two hard disk formed with a LVM2, (100M swap) on hda1 and 19.9G
> (hda2) + 40G (hdb1).
> All LVM mounted as / (root). Yesterday, I add a 40G (hdd).
> Used fdisk with 8e type to format the new 40g (hdd)
> Used lvm extend command to add +20G /dev/VolGroup00/VolLog00 and +10G
> /dev/VolGroup00/VolLog01
> After that, I wanted to remove the VolLog01 but failed and said it is
using.
> Then I tried to use fdisk again to format the 40g (hdd).
> After reboot the server, kernel panic even un-plug 40g (hdd).
>
> Should I just try to re-create hda2+hdb1's LV with command "lvcreate -n
> VolLog00 -l <max size> VolGroup00" ?
>
> I can provide more information if needed.
>
> Thanks in advance.
>
> Lion
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

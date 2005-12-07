Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB71qSV04745
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 20:52:28 -0500
Received: from wproxy.gmail.com (wproxy.gmail.com [64.233.184.196])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jB71qMR4017176
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 20:52:22 -0500
Received: by wproxy.gmail.com with SMTP id i22so222769wra
	for <linux-lvm@redhat.com>; Tue, 06 Dec 2005 17:52:22 -0800 (PST)
Message-ID: <87f94c370512061752g3d948e01t15b17902a130da63@mail.gmail.com>
Date: Tue, 6 Dec 2005 20:52:21 -0500
From: Greg Freemyer <greg.freemyer@gmail.com>
In-Reply-To: <87f94c370512061440s6b1b7ca0rffad7f53503309e4@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
References: <87f94c370512061440s6b1b7ca0rffad7f53503309e4@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: invalid lv in extent map
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Not sure how I caused the below, but after a reboot I was unable to
use my VG at all.

I wiped it out and rebuilt it.  Hopefully it does not happen again.

Greg

On 12/6/05, Greg Freemyer <greg.freemyer@gmail.com> wrote:
> I have recently upgraded a test server from 2.4.x with LVM 1 to 2.6.13
> with LVM 2.
>
> I can mount my 3 LVs, but when I try to do basic lvm commands I get
> "invalid lv in extent map".
>
> # pvscan
>   invalid lv in extent map
>   Couldn't fill logical volume maps.
>   invalid lv in extent map
>   Couldn't fill logical volume maps.
>   No matching physical volumes found
>
> # pvscan --version
>   LVM version:     2.01.14 (2005-08-04)
>   Library version: 1.01.04 (2005-08-02)
>   Driver version:  4.4.0
>
> I did not run vgconvert manually, so I assume I still have LVM1 metadata.
>
> This is a test server, so none of the data in the LVs is important,
> but I hope to be upgrading my live file server soon, so I would like
> to figure out how to not lose any data.
>
> Thanks
> Greg
> --
> Greg Freemyer
> The Norcross Group
> Forensics for the 21st Century
>


--
Greg Freemyer
The Norcross Group
Forensics for the 21st Century

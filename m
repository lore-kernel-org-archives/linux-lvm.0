Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i71A77a19857
	for <linux-lvm@redhat.com>; Sun, 1 Aug 2004 06:07:07 -0400
Received: from smtp103.mail.sc5.yahoo.com (smtp103.mail.sc5.yahoo.com
	[66.163.169.222])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i71A75e1026039
	for <linux-lvm@redhat.com>; Sun, 1 Aug 2004 06:07:05 -0400
Sender: frank@redhat.com
Message-ID: <410CC0AC.82BDECAC@yahoo.de>
Date: Sun, 01 Aug 2004 12:06:36 +0200
From: Frank Mohr <f_mohr@yahoo.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] pvscan fails (some more debugging - cause found)
References: <4106E0D6.10D6AA3D@yahoo.de> <4107D640.F972EC04@yahoo.de>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Frank Mohr wrote:
> 
> I did some debugging and found where and why pvscan crashes.
> 
> Is the any tool to fix PE entries on disk?
> There seem to be 7 corrupted entries.
> 
> I've added some debug messages to vg_read_with_pv_and_lv
> 
> there seems to be a mismatch between vg_this->lv[l]->lv_allocated_le and
> some PE
> 

After adding some debug messages to vgcfgrestore too, i found that the
backup had "good" values.

Now i moved the disks to a different controller and everything works
fine.

Seems it was a broken onboard ide controller

frank

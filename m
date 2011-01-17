Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p0HF0urN015146
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2011 10:00:56 -0500
Received: from cdptpa-omtalb.mail.rr.com (cdptpa-omtalb.mail.rr.com
	[75.180.132.123])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id p0HF0jQD009151
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2011 10:00:45 -0500
Message-ID: <4D3459A1.9020302@cfl.rr.com>
Date: Mon, 17 Jan 2011 10:00:49 -0500
From: Phillip Susi <psusi@cfl.rr.com>
MIME-Version: 1.0
References: <4D344FA8.2020101@gmail.com>
In-Reply-To: <4D344FA8.2020101@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] grub written over lvm partition
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
Cc: Mauricio Tavares <raubvogel@gmail.com>

What does "rather unhappy" mean?  The upgrade process remembers what
device you installed grub to before and uses the same location when grub
needs to be reinstalled.  Also, installing grub to /dev/sda1 only
modifies sector zero, which LVM does not use, so while it may not boot,
it wouldn't cause any harm.

On 1/17/2011 9:18 AM, Mauricio Tavares wrote:
>     I was given an ubuntu desktop which has an interesting problem. It
> has only one HD with two partitions: /boot and LVM. In this computer,
> the lvm partition is the first one (/dev/sda1); I guess that is how
> ubuntu used to do things.
> 
> During the last OS upgrade someone told the updater to put grub on the
> first partition. As a result, the lvm partition got rather unhappy. Is
> there a way to retrieve data off that partition?

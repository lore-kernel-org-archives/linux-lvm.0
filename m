Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBB8Kq6c018006
	for <linux-lvm@redhat.com>; Tue, 11 Dec 2007 03:20:52 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBB8KUC6014509
	for <linux-lvm@redhat.com>; Tue, 11 Dec 2007 03:20:31 -0500
Date: Tue, 11 Dec 2007 09:20:29 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] lvm raid failure
Message-ID: <20071211082029.GA1535@percy.comedia.it>
References: <1f31f75c0712101842q4d71c03bu75926f1deb026a26@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1f31f75c0712101842q4d71c03bu75926f1deb026a26@mail.gmail.com>
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
To: linux-lvm@redhat.com

On Mon, Dec 10, 2007 at 09:42:45PM -0500, Null EXE wrote:
>get the following message:
>#device/dev-io.c:439         Opened /dev/md1 RO
>#device/dev-io.c:264       /dev/md1: size is 0 sectors
>#filters/filter.c:106         /dev/md1: Skipping: Too small to hold a PV
>#device/dev-io.c:485         Closed /dev/md1
>#pvcreate.c:81   Device /dev/md1 not found (or ignored by filtering).
>
>Here is my pvdisplay. Again, any help is Greatly appreciated
you should investigate what's wrong at the md layer, lvm seems to be
just a victim.

check
/proc/mdstat
kernel-logs
mdadm.conf
mdadm -Es

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

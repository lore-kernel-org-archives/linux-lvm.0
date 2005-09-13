Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8DJdJV08662
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 15:39:19 -0400
Received: from pc18.dolda2000.com (1-1-3-7a.rny.sth.bostream.se
	[82.182.133.20])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8DJd9Wj023352
	for <linux-lvm@redhat.com>; Tue, 13 Sep 2005 15:39:14 -0400
Subject: Re: [linux-lvm] Resizing the root LVM partition
From: Fredrik Tolf <fredrik@dolda2000.com>
In-Reply-To: <cd21de0e05091214103bfe89ac@mail.gmail.com>
References: <cd21de0e05091214103bfe89ac@mail.gmail.com>
Date: Tue, 13 Sep 2005 21:38:55 +0200
Message-Id: <1126640336.15157.17.camel@pc7.dolda2000.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>, jonathan@awaken.com

On Mon, 2005-09-12 at 14:10 -0700, Jonathan Morace wrote:
> The longer version of the story...  I'm running Fedora Core 2, and

Doesn't FC2 come with the kernel patches for online Ext2/3 resizing? Try
running ext2online on your LVM device.

Fredrik Tolf

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2QGDvj20469
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 11:13:57 -0500
Received: from smtp.itanets.com (smtp.itanets.com [216.12.200.84])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2QGDt1X006014
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 11:13:56 -0500
From: Delian Krustev <krustev@krustev.net>
Subject: Re: [linux-lvm] 2 TB limit
Date: Fri, 26 Mar 2004 18:13:50 +0200
References: <005601c412af$748d71a0$1fa0a8c0@blec>
In-Reply-To: <005601c412af$748d71a0$1fa0a8c0@blec>
MIME-Version: 1.0
Message-Id: <200403261813.50041.krustev@krustev.net>
Content-Transfer-Encoding: 8bit
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

On Thursday 25 March 2004 23:23, Brad Vrabete wrote:

> Is there any was to create a logigal volume larger than 2TB? Can LVM2 do
> that?

I think it can. However tha maximum size for a block device in 2.4 kernels
is 2TB. You should try 2.6, and use large enough PE size.

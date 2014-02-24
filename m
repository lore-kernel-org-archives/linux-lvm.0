Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1OIuYTp001253
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:56:36 -0500
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1OIuWGx021912
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 13:56:32 -0500
Received: by mail-pd0-f180.google.com with SMTP id y10so1040320pdj.11
	for <linux-lvm@redhat.com>; Mon, 24 Feb 2014 10:56:32 -0800 (PST)
Received: from ssh2.neuro.berkeley.edu (ssh2.Neuro.Berkeley.EDU.
	[169.229.248.250]) by mx.google.com with ESMTPSA id
	yz5sm125359567pac.9.2014.02.24.10.56.31 for <linux-lvm@redhat.com>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 24 Feb 2014 10:56:31 -0800 (PST)
Date: Mon, 24 Feb 2014 10:56:29 -0800
From: Julie Ashworth <ashworth@berkeley.edu>
Message-ID: <20140224185629.GA28182@ssh2.neuro.berkeley.edu>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAE7pJ3ASKEJ0ExqVn7w9pDhv-SRC7HX-60CFJcswROVOmdWBNA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAE7pJ3ASKEJ0ExqVn7w9pDhv-SRC7HX-60CFJcswROVOmdWBNA@mail.gmail.com>
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On 22-02-2014 11.12 +0100, emmanuel segura wrote:
>    i don't understand why you are using two mirror technologies together, i'm
>    using in lvm mirror without mdadm and never found problems
---end quoted text---

hi Emmanuel, 
I personally prefer to use mdadm RAID1, and I'm only using lvm mirroring to recover from an mdadm failure. If you want to learn more, I encourage you to join the mailing list for mdadm issues (linux-raid@vger.kernel.org).
best,
Julie

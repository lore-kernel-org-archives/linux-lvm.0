Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l070gf64009399
	for <linux-lvm@redhat.com>; Sat, 6 Jan 2007 19:42:43 -0500
Received: from mail.esperi.org.uk (41-052.adsl.zetnet.co.uk [194.247.41.52])
	by mx2.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l070gVet003199
	for <linux-lvm@redhat.com>; Sat, 6 Jan 2007 19:42:41 -0500
Subject: Re: [linux-lvm] snapshot on root file system
References: <20070102102130.744.qmail@web27605.mail.ukl.yahoo.com>
From: Nix <nix@esperi.org.uk>
Date: Sun, 07 Jan 2007 00:41:09 +0000
In-Reply-To: <20070102102130.744.qmail@web27605.mail.ukl.yahoo.com>
	(jjletho67-mvl@yahoo.it's message of "Tue,
	2 Jan 2007 11:21:30 +0100 (CET)")
Message-ID: <87vejjfz2y.fsf@hades.wkstn.nix>
MIME-Version: 1.0
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
To: jjletho67-mvl@yahoo.it
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 2 Jan 2007, jjletho67-mvl@yahoo.it outgrape:
> Searching around about this problem I found that also
> other lvm users suffer of a similar problem when the
> root partition is involved, but I was unable to
> understand what is the cause of the problem and if
> there is a way to avoid it. Does LVM really support
> root partition ? Does the problem involves only
> snapshot or also other aspetcs ? Workaround ?

My understanding is that snapshot creation involves a brief period when
I/O to the origin LV is suspended: if lvcreate needs to page in
something from that device, or needs to read, say, /etc/lvm/lvm.conf,
or something, you'll get a deadlock.

(Mind you this all seems fixable to me: before suspending, mlockall()
lvcreate in memory, touch all its pages to force pagein, and do all
other reading required. But I guess this just hasn't been done yet.)

-- 
`He accused the FSF of being "something of a hypocrit", which
 shows that he neither understands hypocrisy nor can spell.'
   --- jimmybgood

Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j217caK16263
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 02:38:36 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j217cYEW007509
	for <linux-lvm@redhat.com>; Tue, 1 Mar 2005 02:38:34 -0500
Date: Tue, 1 Mar 2005 08:38:28 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Having duplicate PV problems,
	think there's a bug in LVM2 md component detection
Message-ID: <20050301073828.GC16775@percy.comedia.it>
References: <20050228213856.GA4151@percy.comedia.it>
	<001101c51de4$ed5448c0$32dcdc0a@vanish>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001101c51de4$ed5448c0$32dcdc0a@vanish>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Feb 28, 2005 at 05:29:11PM -0500, Ron Watkins wrote:
>I am using LVM version 2.01.04 (2005-02-09).  The Library Version is 
>1.01.00-ioctl (2005-01-17).  The Driver Version is 4.1.0.  (no date given). 
>I don't have any easy way to determine if the Debian maintainer is patching 
http://packages.debian.org/lvm2
>this.  Should I be submitting the bug report directly to him/her/them 
>instead?
well, they do explicitely add -D_FILE_OFFSET_BITS=64 to CFLAGS
i wonder if this changes the lseek behaviour
i'd try asking the debian maintainer first....

L.
-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

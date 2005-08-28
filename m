Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SIaWV24724
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 14:36:33 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7SIaPaW009437
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 14:36:31 -0400
Date: Sun, 28 Aug 2005 20:36:14 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] vgscan & CDROM
Message-ID: <20050828183614.GD13825@percy.comedia.it>
References: <20050828101721.GB26065@gutek>
	<200508281324.56314.mailinglist@krausam.de>
	<20050828104730.GC26065@gutek>
	<200508281354.40370.mailinglist@krausam.de>
	<20050828115618.GE26065@gutek>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050828115618.GE26065@gutek>
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

On Sun, Aug 28, 2005 at 01:56:18PM +0200, Chris Osicki wrote:
>OK, that are my filters now:
>
>    filter = [ "r|/dev/hdb|" ]
>    filter = [ "r|/dev/hdc|" ]
>    filter = [ "r|/dev/cdrom|" ]
>    filter = [ "r|/dev/cdrom1|" ]
>    filter = [ "r|/dev/cdrom*|" ]
>    filter = [ "r|/dev/cdrom.*|" ]
>
i tought the syntax was:
filter = [ "r|/dev/hdb|", "r|/dev/hdc|", "r|/dev/cdrom|" ]

you should not need the last 3, since "r|/dev/cdrom|" being a regexp
matches all of them.


btw, i believed "sysfs_scan = 1" was enough to skip cdroms

L.




-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

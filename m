Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0UA01O16531
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 05:00:01 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0U9xtoI006386
	for <linux-lvm@redhat.com>; Sun, 30 Jan 2005 04:59:55 -0500
Date: Sun, 30 Jan 2005 10:59:55 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Building lvm2 against 2.6.10...
Message-ID: <20050130095955.GL21542@percy.comedia.it>
References: <41FC9F47.4030001@shaw.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <41FC9F47.4030001@shaw.ca>
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

On Sun, Jan 30, 2005 at 01:48:07AM -0700, Gerald Schepens wrote:
>The configure script fails for lvm2 with the following...
>
>checking linux/fs.h usability... no
>checking linux/fs.h presence... no
>checking for linux/fs.h... no
>configure: error: bailing out
>
>There isn't much of use in the config.log.
well, there should be something, maybe something referring to pgoff_t?

check you have defined pgoff_t in /usr/include/linux/types.h

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

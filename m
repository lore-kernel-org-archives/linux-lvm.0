Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j09L4Zr14456
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 16:04:35 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j09L4OdH002192
	for <linux-lvm@redhat.com>; Sun, 9 Jan 2005 16:04:29 -0500
Date: Sun, 9 Jan 2005 22:04:24 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Problem Upgrading from LVM1 to LVM2
Message-ID: <20050109210423.GB24979@percy.comedia.it>
References: <Pine.LNX.4.44.0501091156580.19284-100000@mars.geneseo.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44.0501091156580.19284-100000@mars.geneseo.edu>
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

On Sun, Jan 09, 2005 at 01:51:17PM -0500, Mark T. Valites wrote:
>I'd like to upgrade my LVM1 based machine to LVM2. I recently compiled a
>new 2.4.28 kernel and patched in the
>linux-2.4.26-rc1-devmapper-ioctl.patch patch from;
>
>ftp://sources.redhat.com/pub/dm/patches/2.4-stable/2.4.26/linux-2.4.26-rc1-devmapper-ioctl.patch
>
>A copy of my kernel config is available here:
>
>http://www.geneseo.edu/~valites/config-2.4.28-x86_mythtv-dev_mapper
>
use only one of lvm1 or device-mapper.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

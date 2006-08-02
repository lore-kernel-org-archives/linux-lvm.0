Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k726UamX012959
	for <linux-lvm@redhat.com>; Wed, 2 Aug 2006 02:30:36 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k726UTfU019252
	for <linux-lvm@redhat.com>; Wed, 2 Aug 2006 02:30:30 -0400
Date: Wed, 2 Aug 2006 08:30:28 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Minor LVM bollixment - /dev/dm-xx doesn't contain a
	valid partition table
Message-ID: <20060802063028.GB28815@percy.comedia.it>
References: <20060801185347.GA30874@bobcat.bobcatos.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20060801185347.GA30874@bobcat.bobcatos.com>
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

On Tue, Aug 01, 2006 at 01:53:47PM -0500, Bob McClure Jr wrote:
>As I noted, it's running fine, apparently, though, fdisk seems to
>expect partition tables in /dev/dm-nn.  How do I fix this short of
>setting up a new drive and copying everything over?
There is nothing to fix, just ignore fdisk -l errors.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

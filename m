Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i4LGsttl029929
	for <linux-lvm@redhat.com>; Fri, 21 May 2004 17:54:55 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BRDIN-0004oN-SK
	for linux-lvm@redhat.com; Fri, 21 May 2004 17:54:55 +0100
Date: Fri, 21 May 2004 17:54:55 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] lvm2 migration issue
Message-ID: <20040521165455.GE18338@agk.surrey.redhat.com>
References: <20040519185015.GA4623@redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040519185015.GA4623@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, May 19, 2004 at 07:50:15PM +0100, Joe Orton wrote:
> I'm trying to upgrade one of my Fedora Core 1 boxes to FC2, which has
> the root filesystem on LVM.  The installer won't allow me to ugprade
> because, it seems, vgscan is returning an error.
 
> The output of "lvm vgscan -v -d" from a VC whilst running the installer
> is:
 
> so it doesn't recognise /dev/hda2 as a PV, for some reason.
 
> Any ideas how I can get round this?
 
Depends what's causing it: try turning up the verbosity (eg. vgscan -vvv)
and see if it gives a reason for avoiding hda2.

Alasdair
-- 
agk@redhat.com

Received: from radish.cambridge.redhat.com (radish.cambridge.redhat.com
	[172.16.18.90])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4P8BV026302
	for <linux-lvm@redhat.com>; Tue, 25 May 2004 04:11:32 -0400
Received: from radish.cambridge.redhat.com (localhost.localdomain [127.0.0.1])
	by radish.cambridge.redhat.com (8.12.10/8.12.7) with ESMTP id
	i4P8BUMi007572
	for <linux-lvm@redhat.com>; Tue, 25 May 2004 09:11:31 +0100
Received: (from jorton@localhost)
	by radish.cambridge.redhat.com (8.12.10/8.12.10/Submit) id
	i4P8BU1Y007571
	for linux-lvm@redhat.com; Tue, 25 May 2004 09:11:30 +0100
Date: Tue, 25 May 2004 09:11:30 +0100
From: Joe Orton <jorton@redhat.com>
Subject: Re: [linux-lvm] lvm2 migration issue
Message-ID: <20040525081130.GA7565@redhat.com>
References: <20040519185015.GA4623@redhat.com>
	<20040521165455.GE18338@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040521165455.GE18338@agk.surrey.redhat.com>
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

On Fri, May 21, 2004 at 05:54:55PM +0100, Alasdair G Kergon wrote:
> On Wed, May 19, 2004 at 07:50:15PM +0100, Joe Orton wrote:
> > I'm trying to upgrade one of my Fedora Core 1 boxes to FC2, which has
> > the root filesystem on LVM.  The installer won't allow me to ugprade
> > because, it seems, vgscan is returning an error.
>  
> > The output of "lvm vgscan -v -d" from a VC whilst running the installer
> > is:
>  
> > so it doesn't recognise /dev/hda2 as a PV, for some reason.
>  
> > Any ideas how I can get round this?
>  
> Depends what's causing it: try turning up the verbosity (eg. vgscan -vvv)
> and see if it gives a reason for avoiding hda2.

Thanks a lot, that did the trick.  It skipped that partition because it
had a old raid superblock on it, so I ran "mdadm --zero-superblock
/dev/hda2" from the installer shell and vgscan was happy again.

Regards,

joe

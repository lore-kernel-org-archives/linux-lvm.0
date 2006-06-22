Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5M4KShX031078
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 00:20:28 -0400
Received: from py-out-1112.google.com (py-out-1112.google.com [64.233.166.182])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k5M4KJ7R030327
	for <linux-lvm@redhat.com>; Thu, 22 Jun 2006 00:20:19 -0400
Received: by py-out-1112.google.com with SMTP id x66so230974pye
	for <linux-lvm@redhat.com>; Wed, 21 Jun 2006 21:20:19 -0700 (PDT)
Message-ID: <9ef864c50606212120m2132d559gd41f2ce7d056a66b@mail.gmail.com>
Date: Thu, 22 Jun 2006 00:20:19 -0400
From: "Thomas Garner" <thomas536@gmail.com>
Subject: Re: [linux-lvm] snapshots and backups
In-Reply-To: <e7347a$3te$1@sea.gmane.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <e7347a$3te$1@sea.gmane.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Can anyone answer this?  Are LVM snapshots capable of being used for
multiple snapshots, for use as backups?

On 6/18/06, Shaun <mailinglists@unix-scripts.com> wrote:
> I'm looking at using snapshots to take a full backup.  I've been search
> around Google a bit and so far most of the how-to's I find are always
> creating a snapshot, then mounting it, copying the data, unmounting it and
> removing it.  My question is why are they doing this?  Is it because they
> assume they only need data from one area of the drive or is there a better
> reason for doing this?  I want to take a full backup and leave the snapshot
> incase I need to restore it quickly.
>
> --
>
> ~Shaun
>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

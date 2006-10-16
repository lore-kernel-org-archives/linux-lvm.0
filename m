Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9GL7pWW004836
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 17:07:51 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.174])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9GL7oaD002561
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 17:07:50 -0400
Received: by ug-out-1314.google.com with SMTP id 39so812321ugf
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 14:07:45 -0700 (PDT)
Message-ID: <87f94c370610161407j6b98d0aam3bb45969ed12962d@mail.gmail.com>
Date: Mon, 16 Oct 2006 17:07:44 -0400
From: "Greg Freemyer" <greg.freemyer@gmail.com>
Subject: Re: [linux-lvm] Using LVM snapshots for hourly backups
In-Reply-To: <20061013102208.0D52312EE1@bluewhale.planbit.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <452F66EF.5010005@mogmail.net>
	<20061013102208.0D52312EE1@bluewhale.planbit.co.uk>
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

On 10/13/06, Roger Lucas <roger@planbit.co.uk> wrote:
> Hi Nick,
>
> RSYNC is useful for this, but it works at the file level.  If you had, for example, a 1GB e-mail file (e.g. Outlook PST) or a large
> database file, and it was getting small changes every day (e.g. receiving a dozen 10KB e-mails => 120KB of changes), then RSYNC
> would quickly eat up your disk space as each backup taken with RSYNC a complete new copy of the whole 1GB file.
>
> Cascaded LVM snapshots, on the other hand, would allow the just the changes within the files to be kept, dramatically reducing the
> disk usage.
>
> I'm sure that you know this already, but it was worth explicitly stating the difference between RSYCN and LVM snapshots in case
> someone reading the list wasn't as sure.
>
> BR,
>
> Roger

For now, you may want to checkout rdiff-backup.  It uses rsync like
functionality to find deltas in your files and then it only backs up
the deltas.

IIRC, it actually keeps a current copy of your file, plus a series of
deltas that let you get to older versions.

Greg
-- 
Greg Freemyer
The Norcross Group
Forensics for the 21st Century

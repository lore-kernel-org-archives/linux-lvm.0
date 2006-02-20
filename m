Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1KM5Y121751
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2006 17:05:34 -0500
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1KM5XRd000535
	for <linux-lvm@redhat.com>; Mon, 20 Feb 2006 17:05:33 -0500
Date: Mon, 20 Feb 2006 23:05:32 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Using LVM to snapshot Oracle
Message-ID: <20060220220531.GA16484@percy.comedia.it>
References: <E8AFFEFDBE97C94E9297963F0527A07B485D23@pmi00exf00.us.packetmotion.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E8AFFEFDBE97C94E9297963F0527A07B485D23@pmi00exf00.us.packetmotion.com>
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

On Mon, Feb 20, 2006 at 11:28:56AM -0800, Mitchell Christensen wrote:
>I was wondering about the feasibility of using the LVM snapshot facility
>to backup/restore Oracle.  Does this make sense?
>
Yes
>
>A few issues that I am concerned about are,
>
>*	Would it be any better/faster/cheaper than RMAN (the standard
>Oracle backup facility)?
it will work in a different manner,
rman is more complex to handle. but it will give you some more features,
like integrated archive log management and point in time restores.

>*	Would hot-backups be possible, or would the database need to be
>in a quiescent state?
you can do hot backup, but you will need to tell oracle you are doing
so:

you will need to have oracle in archive log mode

you will need to manually set all tablespaces in backup mode:
alter tablespace XXX begin backup; (for all tablespaces)
alter system switch logfile;
do your backup including the archive logs
alter tablespace XXX end backup; (for all tablespaces)

it is a simple sql script to code

>*	Is anyone else out there doing this (or anything similar)?
sure

>*	Is it reasonable to expect that I could simply take a snapshot
>of all Oracle related files and be able to restore a viable Oracle
>instance from that snapshot?
after restore you will have to "recover database" to apply the archive
logs and make the database consistent.

L.


-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

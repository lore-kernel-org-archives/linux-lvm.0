Received: from agk-dp.fab.redhat.com (agk-dp.fab.redhat.com [10.33.0.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oAILWwKH018179
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 16:32:59 -0500
Received: from agk by agk-dp.fab.redhat.com with local (Exim 4.69)
	(envelope-from <agk@agk-dp.fab.redhat.com>) id 1PJC6E-0003OS-Jo
	for linux-lvm@redhat.com; Thu, 18 Nov 2010 21:32:58 +0000
Date: Thu, 18 Nov 2010 21:32:58 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20101118213258.GF30435@agk-dp.fab.redhat.com>
References: <AANLkTi=ZPUWoFk9Xj2b_-9qggGreV9-Z7xv04bGYYjPF@mail.gmail.com>
	<20101116062508.GA17499@maude.comedia.it>
	<AANLkTinDcZ1k1za=yN6=JSXkCkSxGZQJ38MJ4F4O=EvP@mail.gmail.com>
	<20101118201222.GD30435@agk-dp.fab.redhat.com>
	<AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTikwOEjpTZYUOgUjBh1iXrmTRMD8ZT4EOUy52qFN@mail.gmail.com>
Subject: Re: [linux-lvm] Move pvmove questions Was: Need help with
	a	particular use-case for pvmove.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 18, 2010 at 03:40:25PM -0500, Stirling Westrup wrote:
> It mentions checkpointing, but gives no further information. It
> certainly doesn't say anything about how often they are done, or under
> what circumstances. 

It's in there, but the man page would indeed benefit from more repetition
and examples.  Patches welcome!

       Every logical volume in the volume group is searched for *contiguous
       data* that need moving according to the  command  line  arguments.   For
       each  piece  of  data  found,  a new *segment* is added to the end of the
       pvmove LV.  This segment takes the form of a *temporary mirror*  to  copy
       the data from the original location to a newly-allocated location. 

       A daemon repeatedly checks progress at the specified time interval.
       When it detects that the first *temporary mirror* is in-sync,  it  breaks
       that  mirror  so that only the new location for that data gets used and
       writes a *checkpoint* into the volume group metadata on  disk. 

So checkpoint at first daemon check interval after temp mirror in-sync, and
one temp mirror per item of contiguous data to be moved.

Alasdair

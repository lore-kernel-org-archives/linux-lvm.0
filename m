Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2FFAjS10295
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 10:10:45 -0500
Received: from web80603.mail.yahoo.com (web80603.mail.yahoo.com [66.218.79.92])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2FFAh07000698
	for <linux-lvm@redhat.com>; Mon, 15 Mar 2004 10:10:43 -0500
Message-ID: <20040315151037.73788.qmail@web80603.mail.yahoo.com>
Date: Mon, 15 Mar 2004 07:10:37 -0800 (PST)
From: David Minor <sus4@sbcglobal.net>
Subject: Re: [linux-lvm] VGs gone!
In-Reply-To: <1079349331.405590535c638@sms.ed.ac.uk>
MIME-Version: 1.0
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

--- Rupert Hair <rupert.hair@ntlworld.com> wrote:
> > We had a problem with the
> > root partition on the first drive, so we decided
> to
> > restore from the mirror using dd.  After doing
> this,
> > the VGs are not in existence anymore.  running
> > 'vgscan' shows it creates /etc/lvmtab and
> > /etc/lvmtab.d correctly, but they are empty.  
> How were the drives mirrored?  Did you use some sort
> of raid or was it all done
> by using dd to copy the whole drive?

sorry, left that part out:  using rsync to mirror the
drives.  

> What does pvscan show?
> 

pvscan complains about "pv_read(): read" reading
physical volumes.

with -d on pvscan, I think everything looks good
until:
pv_read -- going to read /dev/md9 
pv_read -- LEAVING with ret: -282

Thanks,
dm

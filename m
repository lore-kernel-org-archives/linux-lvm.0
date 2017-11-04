References: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
	<20171030225624.GA26719@agk-dp.fab.redhat.com>
From: Eric Ren <zren@suse.com>
Message-ID: <cb9197be-58c5-3309-c595-c319a5380954@suse.com>
Date: Sat, 4 Nov 2017 15:24:25 +0800
MIME-Version: 1.0
In-Reply-To: <20171030225624.GA26719@agk-dp.fab.redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] When and why vgs command can change metadata and
 incur old metadata to be backed up?
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: agk@redhat.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Hi Alasdair,

> Very simply if the metadata the command has just read in does not match
> the last backup stored in the local filesystem and the process is able
> and configured to write a new backup.
>
> The command that made the metadata change might not have written a
> backup if it crashed, was configured not to write backups, was running
> with the filesystem readonly (e.g. booted into a recovery mode), ran on
> a different node in a cluster, ran as part of an installer that chose
> not to give you any metadata backups, performed metadata recovery etc.
> (Plus an old release had a bug where the checking went wrong and it
> made a backup every time even though nothing had actually changed.)

Can you still recall the fix commit for that bug? I recently encountered 
a similar
problem on 2.02.98. Thanks in advance.

Thanks,
Eric

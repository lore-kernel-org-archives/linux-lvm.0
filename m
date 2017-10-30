Date: Mon, 30 Oct 2017 22:56:24 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20171030225624.GA26719@agk-dp.fab.redhat.com>
References: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
Subject: Re: [linux-lvm] When and why vgs command can change metadata
	and	incur old metadata to be backed up?
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
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 30, 2017 at 02:06:45PM +0800, Eric Ren wrote:
> """
> contents = "Text Format Volume Group"
> version = 1
>
> description = "Created *before* executing 'vgs'"
> """
> I'm wondering when and why the new backups will be created by reporting  
> command like vgs?

Very simply if the metadata the command has just read in does not match
the last backup stored in the local filesystem and the process is able
and configured to write a new backup.

The command that made the metadata change might not have written a
backup if it crashed, was configured not to write backups, was running
with the filesystem readonly (e.g. booted into a recovery mode), ran on
a different node in a cluster, ran as part of an installer that chose
not to give you any metadata backups, performed metadata recovery etc.
(Plus an old release had a bug where the checking went wrong and it
made a backup every time even though nothing had actually changed.)

Alasdair

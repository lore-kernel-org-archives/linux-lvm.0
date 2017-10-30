Date: Mon, 30 Oct 2017 12:04:51 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20171030170451.GB28695@redhat.com>
References: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Eric Ren <zren@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 30, 2017 at 02:06:45PM +0800, Eric Ren wrote:
> Hi all,
> 
> Sometimes, I see the following message in the VG metadata backups under
> /etc/lvm/archive:
> 
> """
> contents = "Text Format Volume Group"
> version = 1
> 
> description = "Created *before* executing 'vgs'"
> """
> 
> I'm wondering when and why the new backups will be created by reporting
> command like vgs?

It's probably a case where lvm sees something wrong after reading the VG
metadata, and automatically tries to fix it, writing a corrected version
of the metadata to disk.  This means that even a command that only reads
and reports lvm information can potentially write to disk.

Right now it's hard to identify the precise instances and locations of
these repairs.  But, I am in the middle of reworking the VG reading code
with the goal of consolidating and clarifying all the cases of repair, at
which point we can improve the way we handle this.  I think we want to try
to make these repairs more limited and controlled, especially for commands
that in theory are only reading and reporting information.  I've also
suggested that whenever repairs are done, lvm should record a persistent
message in the system log with the details, but that idea didn't get a
great reception.

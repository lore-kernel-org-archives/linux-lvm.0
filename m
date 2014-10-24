Date: Fri, 24 Oct 2014 10:18:49 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20141024141849.GB29345@redhat.com>
References: <544A5D76.2010800@mglug.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <544A5D76.2010800@mglug.de>
Subject: Re: [linux-lvm] What todo if metadata grows faster than pool data
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
To: Oliver Rath <rath@mglug.de>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Oct 24 2014 at 10:08am -0400,
Oliver Rath <rath@mglug.de> wrote:

> Hi list,
> 
> in my thinpool-volume the used data is now 50% but the used metadata
> size is 82%. What happens, if the metadata a running full, bevor data is
> full? Do I have to modify metadata size explicitly or does lvm this
> automaticly? How can I do this?

You'll want to grow the metadata volume.  Newer versions of the
dm-thinp kernel code and lvm2 userspace code make this possible.

See the "Manually manage free metadata space of a thin pool LV" section
of the lvmthin.7 manpage in a recent lvm2 release.

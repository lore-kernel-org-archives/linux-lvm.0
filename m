Date: Mon, 30 Oct 2017 13:50:00 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20171030185000.GC28695@redhat.com>
References: <a118652b-470d-0524-7a6a-109fea394895@suse.com>
	<20171030170451.GB28695@redhat.com>
	<02763e2a9b9872a01a7a0e4e54e2230e@assyoma.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <02763e2a9b9872a01a7a0e4e54e2230e@assyoma.it>
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: Eric Ren <zren@suse.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Oct 30, 2017 at 07:11:16PM +0100, Gionatan Danti wrote:
> > that in theory are only reading and reporting information.  I've also
> > suggested that whenever repairs are done, lvm should record a persistent
> > message in the system log with the details, but that idea didn't get a
> > great reception.
> 
> Just to know: why the idea of syslog reporting was discarded?

It was so obviously correct to me that I had a hard time arguing for it.
I don't think any of the objections were satisfactory, e.g. nobody has
asked, nobody needs it, the metadata archives are good enough, you can
already configure log messages to go to syslog.

I am still hoping to do something like this either as a part of
centralizing metadata repair (in progress), or as a part of a broader
suggestion that did get a better response but will take more work.  That
was to create a new log file and format in which every lvm disk change is
recorded.  https://bugzilla.redhat.com/show_bug.cgi?id=1455671

Everyone is encouraged to give their feedback about that in that bz, or
create an "issue" on the lvm github.

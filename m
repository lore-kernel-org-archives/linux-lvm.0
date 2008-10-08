Subject: Re: [linux-lvm] Question regarding liblvm2cmd
From: Tim Post <echo@echoreply.us>
In-Reply-To: <20081008144525.GE23898@agk.fab.redhat.com>
References: <1221277437.5569.193.camel@localhost.localdomain>
	<20081008144525.GE23898@agk.fab.redhat.com>
Date: Thu, 09 Oct 2008 01:07:56 +0800
Message-Id: <1223485676.6314.35.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: echo@echoreply.us,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, 2008-10-08 at 15:45 +0100, Alasdair G Kergon wrote:
> On Sat, Sep 13, 2008 at 11:43:57AM +0800, Tim Post wrote:
> > I noticed that lvm2_run() only has a few possible return values and does
> > not set a global errno to give more information as to why something may
> > have failed. I inspected lvm2_run() and _run_command() in tools/.
> 
> This is a tricky one.  Work has begun on developing a proper library,
> but the error handling mechanism is not yet resolved.  I am reluctant to
> see 1001 specific lvm2 error codes introduced - this would be a
> maintenance and documentation headache 

That would be a nightmare, agreed. 

Its not really too urgent, its very easy to see where messages come from
and modify the output (or set some global) and statically link against
the library. This avoids modifying the system LVM which is good.

Considering system() or execv() as an alternate, I love the library
as-is :)

> - but doing things errno-style
> might be an acceptable compromise.

Really, it boils down to less values that most standard libc functions
would set.

Generically:

* Its too big
* It doesn't exist
* It already exists
* Its busy
* Generic failure

.. I may be forgetting one.

> My question is usually: 'But how can
> the caller make genuine use of the error code?' - if it failed, it
> failed, how does having a specific error code really help?

Well, out of the five possible ways to set errno listed above .. all but
one (could) be remedied by the caller. For instance, if creating an lv
and ETOOBIG is returned .. make it smaller (or re-scan, as someone else
has obviously created a LV since we last looked). The same may go for
EEXISTS, EBUSY is obvious.

Of course each level is more meaningful in the context of the last
command issued.

The real time consuming pain would be implementing it.

Cheers,
--Tim

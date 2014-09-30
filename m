Date: Tue, 30 Sep 2014 11:49:19 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20140930154918.GB9925@redhat.com>
References: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
	<542ABFC3.4000909@redhat.com>
	<CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACaajQut7caHMw6nc-ZUbb=1NuYMZu-untY3y6XdXkk==K7+WA@mail.gmail.com>
Subject: Re: [linux-lvm] thin pool and discards
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
To: Vasiliy Tolstov <v.tolstov@selfip.ru>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 30 2014 at 10:57am -0400,
Vasiliy Tolstov <v.tolstov@selfip.ru> wrote:

> 2014-09-30 18:35 GMT+04:00 Zdenek Kabelac <zkabelac@redhat.com>:
> > Kernel 3.10 is too old,
> > Please repeat the test with at least 3.16
> 
> 
> Why? As i understand 3.10 lts... Can you say me what patches i need to
> cherry pick? Or maybe redhat kernel have this feature...?

You likely need this upstream commit:
http://git.kernel.org/linus/19fa1a6756ed9e92daa9537c03b47d6b55cc2316

Though that commit was tagged for stable.  So not sure.

In general, upstream dm-thinp saw quite a few improvements that in
combination results in a much more stable dm-thinp (particularly error
handling from faults and out of space conditions).

RHEL7 does include these changes.

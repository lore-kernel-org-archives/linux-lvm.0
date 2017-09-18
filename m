Date: Mon, 18 Sep 2017 13:55:51 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170918185551.GB6025@redhat.com>
References: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <da37558c-157c-3817-ca59-96202f615be9@assyoma.it>
Subject: Re: [linux-lvm] Option to silence "WARNING: Sum of all thin volume
 sizes exceeds the size of thin pool"
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
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, Sep 18, 2017 at 07:52:01PM +0200, Gionatan Danti wrote:
> Hi all,
> being an heavy snapshot user, I wonder if (and how) to silence such a
> warning:
> 
> "WARNING: Sum of all thin volume sizes (2.00 GiB) exceeds the size of thin
> pool cl_gdanti-lenovo/thinpool (1.00 GiB)!"
> 
> I fully understand the reasoning for this warning, but snapshots are almost
> guaranteed to raise it. I found that by setting the
> thin_pool_autoextend_threshold the warning disappears, but on some pool I
> would rather like to left autoextend disabled.
> 
> So, any changes to disable the warning at least when taking snapshots?
> Thanks.

It's definitely an irritation, and I described a configurable alternative
here that has not yet been implemented:

https://bugzilla.redhat.com/show_bug.cgi?id=1465974

Is this the sort of topic where we should start making use of
https://github.com/lvmteam/lvm2/issues ?

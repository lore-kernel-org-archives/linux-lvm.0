Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1CMXRi12074
	for <linux-lvm@redhat.com>; Thu, 12 Feb 2004 17:33:27 -0500
From: Andrew Morton <akpm@osdl.org>
Message-Id: <20040212143417.41d2ce58.akpm@osdl.org>
In-Reply-To: <20040212212811.GA655@frodo>
References: <20040212015710.3b0dee67.akpm@osdl.org>
	<20040212203306.GA13192@cistron.nl>
	<20040212212811.GA655@frodo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: 2.6.3-rc2-mm1 (dm)
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Fri Feb 13 09:11:13 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Nathan Scott <nathans@sgi.com>
Cc: miquels@cistron.nl, linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Nathan Scott <nathans@sgi.com> wrote:
>
> > This forces the underlying device(s) to a soft blocksize of 512. And
> > I had my 80 MB/sec write speed back !
> > 
> > I'm not sure if setting the blocksize of the underlying device
> > always to 512 is the right solution. I think that set_blocksize
> 
> Hmm... that set_blocksize there must be new in -mm, I don't see
> that in mainline yet.  I would guess that bdev_hardsect_size()
> would be more appropriate here than hard-coding 512 bytes.  I
> don't know the details of the problem being solving by adding
> set_blocksize() in there though, so I might be completely wrong.

Yes, 2.6.3-rc2-mm1 has a new device-mapper update.

Miquel, thanks for picking this up.  I shall wait for the LVM team to
suggest the preferred fix.

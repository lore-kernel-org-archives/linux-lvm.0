Return-Path: <iafilius@xs4all.nl>
Date: Fri, 20 Apr 2001 10:00:31 +0200 (CEST)
From: Arjan Filius <iafilius@xs4all.nl>
Subject: Re: [linux-lvm] 2.4.3-ac{6,7} LVM hang
In-Reply-To: <20010419235107.G750@suse.de>
Message-ID: <Pine.LNX.4.31.0104200958360.1043-100000@sjoerd.sjoerdnet>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jens Axboe <axboe@suse.de>
Cc: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, linux-openlvm@nl.linux.org

Hello Jens,

Yes this fixes it.

I'm running 2.4.4-pre4 with only your patch applied.

Greatings,


On Thu, 19 Apr 2001, Jens Axboe wrote:

> On Thu, Apr 19 2001, Arjan Filius wrote:
> > Hello,
> >
> > Same here as reported.
> > restoring lvm.c from 2.4.3 into 2.4.4-pre? "fixes" this. (tested not ac's
> > kernel)
>
> Does attached patch fix it?
>
>

-- 
Arjan Filius
mailto:iafilius@xs4all.nl

Received: from localhost (unknown [10.33.36.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 6E79961992
	for <linux-lvm@redhat.com>; Mon,  3 Jun 2019 13:23:29 +0000 (UTC)
Date: Mon, 3 Jun 2019 14:23:28 +0100
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20190603132327.GA32187@reti>
References: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <93f53408-2f37-dec3-5c68-deef021f530c@assyoma.it>
Subject: Re: [linux-lvm] Fast thin volume preallocation?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, May 31, 2019 at 03:13:41PM +0200, Gionatan Danti wrote:

> - does standard lvmthin support something similar? If not, how do you see a
> zero coalesce/compression/trim/whatever feature?

There isn't such a feature as yet.  With the next iteration of thin I'd like to
get away from the fixed allocation block sizes that we're using which should greatly
reduce the number of mappings that we need to create to provision a thick volume and
so speed it up a lot.

Presumably you want a thick volume but inside a thin pool so that you can used snapshots?
If so have you considered the 'external snapshot' feature?

> - can I obtain something similar by simply touching (maybe with a 512B only
> write) once each thin chunk?

Yes.

- Joe

Message-ID: <46157.80.67.170.17.1028897064.squirrel@rezo.net>
Subject: Re: [linux-lvm] Re: can't mount ext3 snapshot => needs_recovery flag always set on mounted ext3 partitions
From: "Antoine" <antoine@rezo.net>
In-Reply-To: <20020809122723.GB2873@fib011235813.fsnet.co.uk>
References: <20020809122723.GB2873@fib011235813.fsnet.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Fri Aug  9 07:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Would a writeable snapshot help ?  Since you would be able to change
> the needs_recovery flag specifically on the snapshot.

How can I have a writable snapshot ? LVM snapshots are supposed to
be read-only, aren't they ?

But indeed if the journal data has not been committed on the original
volume when the snapshot is taken, then the snapshot may have false data
in it as, due to its read-only nature, it is not able to catch up the
uncommitted journal data... Am I missing something ?

Message-ID: <3C06A624.80205@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
References: <NBBBKLKHMJHIJLHOGAOJOEDFJCAA.steve.wray@the.net.nz>
Content-Transfer-Encoding: 7bit
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
Date: Thu Nov 29 15:16:08 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

> I don't know why people even think of doing that...
> Can *anyone* give a good reason (and I don't include
> "because its tidier to have everything LVM") for having
> root on LVM?


Sure, for the same reason you put *anything* on LVM -- for flexibility 
in storage allocation.  With root on LVM, you can:

(a) create filesystem snapshots for performing consistent backups (or 
for providing a simple 'oops-I-didn't-mean-to-delete-that-just-now' file 
recovery).

(b) dynamically expand the amount of space available to the root partition.

(c) Migrate data to a new set of disks on a live system.

And, of course, it *is* tidier to have everything on LVM :).

On the other hand, there is an element of risk when managing your root 
filesystem with code that hasn't yet stabilized.  It also leads to 
increased complexity.  In particular, you'll probably want to build some 
sort of rescue CD with LVM support in case something goes wrong, since 
most existing rescue tools don't have LVM support.

-- Lars

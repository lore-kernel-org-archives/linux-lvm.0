From: "Steve Wray" <steve.wray@paradise.net.nz>
Message-Id: <NBBBKLKHMJHIJLHOGAOJIEOHJEAA.steve.wray@paradise.net.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <3C71A746.7000707@birddog.com>
Subject: [linux-lvm] snapshot safetynet?
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
Date: Mon Feb 18 19:43:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Ok, heres a thought;
Resizing filesystems is a risky operation,
by and large, especially shrinking them.

So I had the thought;
Take a snapshot of the filesystem to shrink,
use fs tools and lvm tools to shrink it,
if it goes wrong, restore the snapshot!

Will it work tho? I'm wondering it lvreduce
will get confused about the snapshot or if
the snapshot system will cope with such a huge
change...

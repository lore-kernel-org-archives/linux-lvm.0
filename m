From: Jose Luis Domingo Lopez <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] EXT3 vs Reiserfs
Message-ID: <20031208150053.GA15642@localhost>
References: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CEADF0D83077F7458B763904E47AA709287BA7@exchange.neokimia.com>
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
Date: Mon Dec  8 09:02:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Monday, 08 December 2003, at 09:39:38 -0500,
Yanick Quirion wrote:

> Could you please tell what is the best filesystem for linux between ext3 and reiserfs?
> 
It is hardly to find something that is "best" by everyone standards of
"best". Maybe ext3 is better suited for your particular setup, or maybe
is reiserfs what fits best to your configuration. Just now the features
of each filesystem, do some "real-world" usage or test on both, and
decide for yourself.

> I know that ext3 can handle ACLs and not online fs extend, and reiserfs do not seems to support ACLs (I found some patches for kernel 2.4.21, but there are errors when I apply them to the kernel sources), but can be extend while it's online.
> 
You will have to take into account those existing and missing features
of both filesystems and see if you absolutely need one of them that is
not available in one of the two. Maybe it would be nice to have support
for quotas and ACL on reiserfs, but if you don't need these features,
why bother ?. Stick with what is best for _your_ needs.

Greetings.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Sid (Linux 2.6.0-test10-mm1)

Message-ID: <20010823192235.21160.qmail@web20301.mail.yahoo.com>
Date: Thu, 23 Aug 2001 12:22:35 -0700 (PDT)
From: Brad Langhorst <bwlang@yahoo.com>
Subject: Re: [linux-lvm] segfault running vgscan
In-Reply-To: <Pine.LNX.4.33.0108231329090.4179-100000@bobak.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

--- "Mark J. Bobak" <mark@bobak.net> wrote:
> Use the ldd command.  This 'list dynamic
> dependencies'.  If a program
> has no dynamic dependencies, it's statically linked,
> by definition.
> 
okay - ldd says that vgscan is linked to

#ldd vgscan
liblvm-10.so.1 => /lib/liblvm-10.so.1 (0x40021000)
libc.so.6 => /lib/i686/libc.so.6 (0x40051000)
/lib/ld-linux.so.2 => /lib/ld-linux.so.2 (0x40000000)

so yes dynamically linked...
the problem was with static linking right?

now what? 
should I try a less optimized libc?

thanks 

brad

__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/

Message-ID: <4C8DF365.3020804@redhat.com>
Date: Mon, 13 Sep 2010 11:48:21 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4C8A52F5.4080801@redhat.com>
	<5fa6d3.12b5c.12afc29d278.Coremail.ooolinux@163.com>
	<4f6023.1288b.12afc599754.Coremail.ooolinux@163.com>
In-Reply-To: <4f6023.1288b.12afc599754.Coremail.ooolinux@163.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] what is writed on raw disk,
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
To: yue <ooolinux@163.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 10.9.2010 17:53, yue napsal(a):
> i want to know lvm2 on source-code level.
> and  kernel device-mapper??
> just analysis source code is hard, can you give me some function-call stream.
> and whole blueprint.


If you really want to know 'in-depth' detail - I may suggest to use tools like
kcachegrind to get flow-control.

It's in fact not so easy to describe lvm2 functionality in few lines and it's
also 'moving' target as some call flow changes over the time.

Very slight overview might look like this:

- read config
- scan available block devices according config (changes quite a lot with udev
integration and cache usage)
- create internal structures and do some action according to given command

- some of commands are changing dm table - so internal dm tree structure is
generated - this abstraction is hidden in libdm

- activation/deactivation is executed - note - as lvm2 supports clusters -
this is somewhat more complex and unless you plan to have a very deep look
inside  you probably don't want to know all the magic behind - lots of limits
apply - very tight memory rules needs to be preserved to avoid deadlocks...

If you plan to add new 'target' - you may look into lib/striped subdir - there
is very some simple example.

Some sort of 'virtual' methods calls are used - unfortunately this call flow
is far from complete so target usually needs few quirks here and there over
the whole code base for now and usually knows a long depth knowledge of this
process - far from perfect, but that's current status...

Zdenek

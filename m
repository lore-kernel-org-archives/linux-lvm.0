Message-ID: <008c01c1fceb$e29f7660$3b00a8c0@aplabwp0368359>
From: "Bas" <weblists@gmx.net>
References: <E177uaF-0000ja-00@jelly.buzzard.org.uk> <20020516162341.A25098@sistina.com>
Subject: Re: [linux-lvm] Some suggestions about lvminitrd_create
MIME-Version: 1.0
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
Date: Thu May 16 10:09:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> >
> > Just a couple of suggestions firstly it would be nice if it checked
> > for /boot/System.map-'uname -r' rather than for just /boot/System.map.
> > When you have more than one kernel floating about this is handy.
>
> Yep, that's what the "-F" option aims to support.
>
> >
> > Second suggestion it would be nice if a -t option existed to allow a
> > choice in the type of filesystem the initrd is created in. Not everyone
> > is using ext2 these days :)
>
> Well, why do you want to use a different filesystem on a relatively tiny
> and little populated ram disk?

Because once you choose to use XFS, you don't need ext2 utils anymore, so
why would you want to install ext2utils ?

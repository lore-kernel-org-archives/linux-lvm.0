Return-Path: <prj@multivac.cwru.edu>
Subject: Re: [linux-lvm] Why vgscan not in kernel?
References: <3B372D6D.88998D3F@qis-systemhaus.de>
From: Paul Jarc <prj@po.cwru.edu>
Date: 25 Jun 2001 20:28:49 -0400
In-Reply-To: <3B372D6D.88998D3F@qis-systemhaus.de> (Dirk Heinrichs's message of "Mon, 25 Jun 2001 14:24:13 +0200")
Message-ID: <m3bsncozhk.fsf@multivac.cwru.edu>
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
To: Linux LVM <linux-lvm@sistina.com>

Dirk Heinrichs <heinrichs@qis-systemhaus.de> writes:
> Wouldn't it be better to have similar functionality (scanning for
> VG's) for LVM in the kernel, instead of using a userland command?

It would also be nice if VGs were initially active - then we wouldn't
need an initrd to have LVM on root... right?


paul

Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B8267F5.D3174CAB@tls.msk.ru>
Date: Tue, 21 Aug 2001 17:53:57 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

AJ Lewis wrote:
> 
[]
> There's a good chance that your startup script is running either before root
> is mounted read/write (in which case the LVM tools can't write to /etc) or

But how to have root mounted read-only?
I resolved problem with only one file that needs to be read-write --
it is /etc/mtab that I moved out to /var/run (modified glibc and
mount itself).  So my root is now read-only at all times.  But how
to deal with lvm?  Should I move /etc/lvm* to /var also?

Regards,
 Michael.

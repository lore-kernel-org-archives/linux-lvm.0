Return-Path: <markv@wave.co.nz>
Date: Tue, 14 Aug 2001 15:04:18 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010814150418.E6463@mail.wave.co.nz>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com>
Mime-Version: 1.0
In-Reply-To: <20010812200701.A657@btconnect.com>; from Joe Thornber on Sun, Aug 12, 2001 at 08:07:02PM +0100
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

On Sun, Aug 12, 2001 at 08:07:02PM +0100, Joe Thornber wrote:
> I would much rather see people wrapping the tools than using liblvm, in fact
> liblvm will probably disappear in the future.

I think it is a bad idea to eliminte liblvm.  Shared libraries are much
easier use to use from programs.  For example, it is much easier in a perl
script to use zlib than to run gzip as a subprocess in a bulletproof way.

Regards,

Mark.

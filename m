Return-Path: <tack@orion.dok.org>
Date: Sun, 12 Aug 2001 11:38:46 -0400
From: Jason Tackaberry <tack@linux.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010812113846.B20414@linux.com>
References: <20010811235718.A20414@linux.com> <20010812135402.A452@dardhal.mired.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20010812135402.A452@dardhal.mired.net>; from jdomingo@internautas.org on Sun, Aug 12, 2001 at 01:54:02PM +0000
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

* Jos� Luis Domingo L�pez (jdomingo@internautas.org) [010812 07:57]:
> Kernel parameters, system information, kernel variables and kernel
> tunables will probably disappear and will be replaced by some sort of
> user-space application that will allow query and modfication of kernel
> values and tunables. Something similar to Solaris' ndd, AFAIK.

Any ideas when this will be implemented?  I suppose I could build it
around /proc, but just make it modular enough that I can switch to some
ndd-alike in the future.

Jason.

Return-Path: <juergens@muon.de>
Date: Sat, 3 Feb 2001 14:43:23 +0100
From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] startup scripts
Message-ID: <20010203144323.A704@guldukat.muon>
References: <3A7B17B2.8A75537B@asosa.org> <Pine.LNX.4.21.0102021002400.23087-100000@compath.asosa.org>
Mime-Version: 1.0
In-Reply-To: <Pine.LNX.4.21.0102021002400.23087-100000@compath.asosa.org>; from gashaw@asosa.org on Fri, Feb 02, 2001 at 10:04:22AM -0800
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

On Fri, 02.02.01, Gashaw Mengistu <gashaw@asosa.org> wrote:
> 
> Oh .. I am using Mandrake 7.2 with Kernel 2.4.1 compiled with RAID and LVM
> support built in.
> 

Well, if you compiled your kernel with raid autodetect support it does
not matter that much where you put it. If your raid is started by some
startup-script you have to put the lvm-stuff after that.

I think it is quite reasonable to initialize LVM quite early, after
the initial mount of the / filesystem. That way you can mount the
filesystems the usal way at startup - using /etc/fstab. If one of your
PV's is a MD, autodetect support is mandatory.

greetings,

Nils

-- 
 >   Nils Juergens  | nils@muon.de | icq 7090774   <
 >  If we all work hard, we can turn this company  <
 >      around 360 degrees -- gruntbert(LOTD)      <

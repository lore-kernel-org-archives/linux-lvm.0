Return-Path: <thornber@btconnect.com>
Date: Mon, 13 Aug 2001 21:31:01 +0100
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010813213101.A1211@btconnect.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813161301.B6466@uk.sistina.com> <3B782E02.B5DB2FC8@tls.msk.ru> <20010813214943.A19522@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010813214943.A19522@cistron.nl>; from wichert@cistron.nl on Mon, Aug 13, 2001 at 09:49:43PM +0200
From: Joe Thornber <thornber@btconnect.com>
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

On Mon, Aug 13, 2001 at 09:49:43PM +0200, Wichert Akkerman wrote:
> Previously Michael Tokarev wrote:
> > Wow, great!  No more tons of tiny executables!  Wow!  Looks
> > very good.  Just like `cvs' now -- "cvs co", "cvs add" etc...
> 
> Compare with: wow! instead of a few simple modular applications we
> now get a single one which tries to do everything. I'm not convinced
> this is a step forward, the UNIX philosophy of having lots of small
> single-purpose tools is a good one.

Then split them out again, we'll make sure this can be configured at
the makefile level.  In particular we want to make sure that people
can make executables with the minimal set of tools necessary for
rescue disks etc.  If you want seperate binaries, you shall have them
:)

- Joe

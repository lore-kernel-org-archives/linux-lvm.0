Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B782E02.B5DB2FC8@tls.msk.ru>
Date: Mon, 13 Aug 2001 23:44:02 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no> <20010813161301.B6466@uk.sistina.com>
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

Alasdair G Kergon wrote:
> 
[]
> In the 'experimental' branch each tool has been converted into a
> function and they have all been linked into a single 'lvm'
> binary.  This binary takes lvm commands from standard input
> and processes them.  Or it can be invoked with argv[0] set to
> the name of an existing tool (eg 'ln lvm pvcreate') and then it
> will behave as that tool.  There are no plans to change existing
> command line arguments etc.  However, in the interests of
> achieving consistency between the tools and making it easy to
> handle their output reliably, there are likely to be minor
> changes to the output formats, error codes, signal-handling etc.

Wow, great!  No more tons of tiny executables!  Wow!  Looks
very good.  Just like `cvs' now -- "cvs co", "cvs add" etc...

Well, ok, but one little question/suggestion:  why not have
*some* tools instead of one (a step back? no): pvm for physycal
volumes, lvg for volume groups and lvm for logical volumes?
This seems to be logical...

Anyway, this is exactly a direction I always wanted to ask and/or
point to, but I remember some words somewhere on Sistina?  Or
old LVM homepage (where it was?) ? that such mergeing will not
happen because of something.  (It may be even lvm FAQ or HOWTO).
Unfortunately, I don't remember reasons behind that.

Regards,
 Michael.

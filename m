Return-Path: <agk@uk.sistina.com>
Date: Mon, 13 Aug 2001 16:13:01 +0100
From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Writing forward compatible applications using /proc
Message-ID: <20010813161301.B6466@uk.sistina.com>
References: <20010811235718.A20414@linux.com> <20010812200701.A657@btconnect.com> <20010812221650.A6589@vestdata.no>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010812221650.A6589@vestdata.no>; from lvm@ragnark.vestdata.no on Sun, Aug 12, 2001 at 10:16:50PM +0200
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

On Sun, Aug 12, 2001 at 10:16:50PM +0200, Ragnar Kj?rstad wrote:
> On Sun, Aug 12, 2001 at 08:07:02PM +0100, Joe Thornber wrote:
> > I would much rather see people wrapping the tools than using liblvm, in fact
> > liblvm will probably disappear in the future.
> Why will liblvm disappear? To me using a library interface seems much
> nicer than wrapping applications.

Let's put this another way.

In the 'experimental' branch each tool has been converted into a
function and they have all been linked into a single 'lvm'
binary.  This binary takes lvm commands from standard input
and processes them.  Or it can be invoked with argv[0] set to
the name of an existing tool (eg 'ln lvm pvcreate') and then it 
will behave as that tool.  There are no plans to change existing 
command line arguments etc.  However, in the interests of
achieving consistency between the tools and making it easy to
handle their output reliably, there are likely to be minor
changes to the output formats, error codes, signal-handling etc.  

The *existing* liblvm is very dependent on internal LVM structure.
Significant internal structural changes are on the cards, so the
existing liblvm is likely to disappear.  

My thinking is that, for future maintainability, the interface into
lvm should be at the level of the command-line tools, rather than
the level of the existing liblvm.  Where there are functions in
liblvm that people need to call independently (any examples?), then
we should either adapt existing tools or create new ones to provide
this.

I envisage any 'wrapper' application (eg. GUI) as simply opening a
pipe/socket to 'lvm --condensed-output' (say) and passing individual
lvm commands in and getting responses back in a consistent,
condensed text format.  Alternatively it could call the tools
through a new library - but the functionality this would expose
would be the same as that provided by the command line tools.

Alasdair
-- 
agk@uk.sistina.com

From: <mitch@mdmiller.com>
Subject: Re: [linux-lvm] Implementation questions
In-Reply-To: <200112181346.fBIDkX513319@lewis.abi.tconline.net>
Message-ID: <Pine.LNX.4.33.0112180802190.1822-100000@lx1.daboard.com>
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
Date: Tue Dec 18 07:54:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Doesn't Ghost support Linux / LILO configurations?  That would allow you
to configure up one PC, and duplicate it to 129 others, and it's VERY
quick.  You do, however, still have to make any individualized changes to
each one after the duplication.

-- Mitch



On Tue, 18 Dec 2001, Lewis Bergman wrote:

> > As I have about 130 of these to do, I am toying with the idea of installing
> > a cut-down Linux system with XFS, LAM, md and ramdisk support and making a
> > bootable CD-ROM which I can then use to configure the system how I want it.

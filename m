From: Robert Macaulay <robert_macaulay@dell.com>
Subject: Re: [linux-lvm] More information on my LV with bad read performance..
In-Reply-To: <20011026010656.H23590@turbolinux.com>
Message-ID: <Pine.LNX.4.33.0110260825240.26478-100000@ping.us.dell.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Date: Fri Oct 26 08:26:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, 26 Oct 2001, Andreas Dilger wrote:

> However, it is also possible that striping across 26 disks is kind of
> pointless, especially for Oracle.=A0 You are far better off to do some
> intelligent allocation of the disks depending on known usage patterns
> (e.g. put tables and their indexes on separate disks, put rollback
> files on separate disks, put heavily used tables on their own disks,
> put temporary tablespaces on their own disks).

True. I have done that. This is a "let's see if it goes really fast with =
a
lot of disks" test. We have the disks divided up in stripe sets no bigger
than 8 typically, all separated out by function. I was just playing aroun=
d
with a massive stripe, and ran into this oddity.

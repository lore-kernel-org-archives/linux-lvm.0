Date: Wed, 22 Aug 2001 21:31:48 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010822213148.C29990@mail.wave.co.nz>
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com> <3B8267F5.D3174CAB@tls.msk.ru> <20010821160012.E25747@dragon.blacknet.de> <20010821112252.A21206@sistina.com>
Mime-Version: 1.0
In-Reply-To: <20010821112252.A21206@sistina.com>; from AJ Lewis on Tue, Aug 21, 2001 at 11:22:52AM -0500
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

On Tue, Aug 21, 2001 at 11:22:52AM -0500, AJ Lewis wrote:
> Yeah, that's in the works for the development version of LVM, but the 1.0x
> series will likely always have the files in /etc.  I agree that it is better
> not to have it write files by default, or at least not rely on them being
> written out.

May I request a feature for the 1.0x series?  A command-line option
for vgscan and vgchange, to specify the directory containing lvmconf,
lvmtab and lvmtab.d.

Regards,

Mark.

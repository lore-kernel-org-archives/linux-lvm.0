From: <mitch@mdmiller.com>
Subject: Re: [linux-lvm] Partitions on same Drive
In-Reply-To: <20020121214908.F22618@colombina.comedia.it>
Message-Id: <Pine.LNX.4.33.0201211527050.7136-100000@lx1.daboard.com>
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
Date: Mon Jan 21 15:21:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@sistina.com" <linux-lvm@sistina.com>

> if you don't create striped LVs on the two partitions i see no
> significant performance problem.

Brings up a question ... can you get improved performance by striping to
multiple devices on the same SCSI channel, or do they really need to be on
separate SCSI channels for good performance?  Ex: I have a fibre channel
card, and multiple drives I'm gonna hook up ... someday.  Can I strip
across all the drives and expect to push fibre channel's capabilities?

-- Mitch

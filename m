From: bscott@ntisys.com
Subject: Re: [linux-lvm] LVM hang with some uses of raw i/o
In-Reply-To: <20020627114441.A21400@sistina.com>
Message-ID: <Pine.LNX.4.44.0206270844370.8718-100000@dragon.inside.ntisys.com>
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
Date: Thu Jun 27 07:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 27 Jun 2002, at 11:44am, Heinz J . Mauelshagen wrote:
> If I follow the VM code chain correctly down to find_extend_vma(), an
> offset into a page gets silently ignored on finding the VMA. This will
> petentially cause a user page to be overwritten corrupting user data which
> shouldn't cause the system to hang, but your process to go nuts.

  Um, is this a current bug other people should be worrying about?

-- 
Ben Scott <bscott@ntisys.com>
| The opinions expressed in this message are those of the author and do not |
| necessarily represent the views or policy of any other person, entity or  |
| organization.  All information is provided without warranty of any kind.  |

From: "Mario 'BitKoenig' Holbe" <Mario.Holbe@RZ.TU-Ilmenau.DE>
Subject: Re: [linux-lvm] RAID support...
Message-Id: <20011229104244.GB23434@irc.fem.tu-ilmenau.de>
References: <3C2CBAFB.90103@cdimed.com> <20011228123140.A9647@omnifarious.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011228123140.A9647@omnifarious.org>
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
Date: Sat Dec 29 04:40:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Dec 28, 2001 at 12:31:40PM -0600, Eric M. Hopper wrote:
> OS.  I question whether even RAID0 support is really necessary in LVM.
> RAID should be stacked below, or above LVM, not packed inside.

Totally agreed. There is working RAID0 code in the Software-RAID.
Why blowing up the kernel with two RAID0-code-trees...

Maybe one could 'migrate it out' - mark it as deprecated, deny
to create, but support old ones still a lot of time - something
like this.


regards,
   Mario

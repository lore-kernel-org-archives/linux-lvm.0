Date: Tue, 28 Aug 2001 19:36:53 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Strange message with 2.4.8+1.0.1rc1
Message-ID: <20010828193652.A4986@tykepenguin.com>
References: <B45465FD9C23D21193E90000F8D0F3DF0178FD26@mailsrv.linkvest.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF0178FD26@mailsrv.linkvest.com>; from Jean-Eric.Cuendet@linkvest.com on Tue, Aug 28, 2001 at 09:10:12AM +0200
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

On Tue, Aug 28, 2001 at 09:10:12AM +0200, Jean-Eric Cuendet wrote:
> 
> > Logical volume. All is fine. Then, I reboot. After that, it's 
> > no more visible. 
> > If I run vgscan, nothing is found. vgchange -ay doesn't help 
> 
> I found that if my VG name is : NORAID_HDX (10 characters), it's no more
> visible after a reboot (no way to get it back, data loss) but if it's
> named : NORAID then it's found after a reboot!
> 
> Is there a limit to 8 characters in LVM VGs names?

No. The limit is 128 characters and I've had plenty that were longer than 10. I
suspect that the action of renaming has made the difference. I suspect (and if
you're brave you could try this!) that if you rename the VG back to NORAID_HDX
will still work.

patrick

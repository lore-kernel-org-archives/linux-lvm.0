Date: Fri, 24 Aug 2001 08:45:47 +0100
Subject: Re: [linux-lvm] Pvmove question
Message-ID: <20010824084547.C293@btconnect.com>
References: <B45465FD9C23D21193E90000F8D0F3DF0178FD13@mailsrv.linkvest.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF0178FD13@mailsrv.linkvest.com>; from Jean-Eric.Cuendet@linkvest.com on Fri, Aug 24, 2001 at 12:31:18AM +0200
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

On Fri, Aug 24, 2001 at 12:31:18AM +0200, Jean-Eric Cuendet wrote:
> 
> Hi,
> I have a pvmove question:
> In the man page, it's said to be careful with pvmove if you use it while
> LVM is in use.
> I don't really understand what is dangerous and what is safe...

pvmove on a mounted (or otherwise in use) LV might cause curruption of
your data.

> 
> Could you give me details? Is it safe to do if no LV is mounted?

y

 Or if
> vgchange -an is run?

y

- Joe

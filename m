From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] software RAID over LVM
Message-Id: <20020130094342.GA13425@colombina.comedia.it>
References: <3C57354D.1070601@birddog.com> <1012366706.5900.6.camel@UberGeek>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1012366706.5900.6.camel@UberGeek>
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
Date: Wed Jan 30 03:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Well, since the whole point of having LVM is ease of resizing logical volumes,
and resizing MD device is impossible or painful, i do not really understand
why should anyone want to do this.
If mirroring were to be implemented over lvm, it should be at the PE/LE level,
in the LVM driver itself, since this is not true (search archives for the reasoning
behind this) the only sensible chance is having LVM over MD.

On Tue, Jan 29, 2002 at 10:58:26PM -0600, Austin Gonyou wrote:
> I can think of MANY uses for this. The main one would be a relatively
> cheap way of making a RAID0+1, or stripe of mirrors. If you don't have
> any hardware to do this with, then software is next. It'd be nice to be
> able to do this, for sure. You could even do 0+5, or something crazy
> like that too.



-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \

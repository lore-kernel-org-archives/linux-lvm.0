Subject: Re: [linux-lvm] Red Hat upgrade over existing LVM
References: <3CAE9F23.3C58CB1E@vtc.edu.hk> <wxxsn69ut5v.fsf@nommo.uio.no>
    <3CAFCEBB.7860B8E4@vtc.edu.hk>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <3CAFCEBB.7860B8E4@vtc.edu.hk>
Message-Id: <wxxelhs3xar.fsf@nommo.uio.no>
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
Date: Sat Apr  6 23:13:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Nick Urbanik <nicku@vtc.edu.hk> writes:

> Terje Kvernes wrote:
> 
> > that's one way, the easier way is to either use apt
> 
> Does apt work with Red Hat in a usable way?  I tried it a long time
> ago, and deleted it.

  sort of, just mask out ximian-packages and other stuff you can't
  make dependencies for.  otherwise it supposedly works well.  I have
  to admit to using red-carpet mostly myself.
 
> > or red-carpet to upgrade your distro.  with red-carpet, fiddle
> > with /etc/redhat-release, apt has dist-upgrade, I think.  I've
> > upgraded two machines from 7.0 -> 7.2 with red-carpet, but I'd
> > advice you to set off a day with this, even if you get the rpms
> > from somewhere besides ximian.
> >
> > I did it as follows: grab the rpms from RH7.2, with the updates,
> > from a local mirror, and dump them to /var/cache/redcarpet, then
> > fiddle with /etc/redhat-release (feel free to install the rpm
> > "redhat-release"), then run red-carpet.  things will break and
> > fail now and then, fiddle.
> 
> I have used rpmfind --autoupgrade to upgrade from 7.1 to 7.2, and
> that required not a huge amount of manual intervention, but more
> than I want.

  hm, haven't tried that.
 
> I tried using rpmfind to upgrade this machine from 7.2 to 7.2.93,
> but it changed my /lib/ld-linux.so and everything ground to a halt.
  
  ouch.  someone[tm] didn't think when they handed you the rpms.
 
> I had to reboot with init=/sbin/sash to fix it.  Now I have created
> a directory /static, containing lots of statically compiled tools,
> including the LVM tools.

  I've by habit compiled all the tools statically for a long while
  now.
 
> We really need a rescue disk that supports LVM, RAID, reiserfs and
> ext3.  Anyone seen such a beast, or do I have to make it myself?

  Gentoo's default kernel supports this, as well as XFS, out of the
  box. 
 
> > these days I have a RH7.2-box that has an uptime of about 240
> > days.  :)
> 
> So you are not yet running a recent kernel?

  correct.  but only me and my girlfriend can log into it, so
  security-wise it doesn't really matter.  although I do miss certain
  parts of 2.4.18 these days.  :)

  oh, and yes, the box runs 0.9.1_beta7.  which has worked flawlessly
  as long as I've kept _far_ away from known bugs.  :)

-- 
Terje

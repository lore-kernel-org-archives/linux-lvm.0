From: "Steve Wray" <steve.wray@paradise.net.nz>
Subject: RE: [linux-lvm] Red Hat upgrade over existing LVM
Message-Id: <000601c1ddb2$412f7170$0201a8c0@fosi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
In-Reply-To: <wxxsn69ut5v.fsf@nommo.uio.no>
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
Date: Sat Apr  6 15:30:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

One other thing to consider is;
what exactly is it that you want to upgrade/update,
and what is it that you want to preserve?

What I am about to suggest is merely that; a suggestion.
The initial question was about upgrading from one redhat
version to another, so I dont *exactly* address that!

If you are not too deeply committed to redhat as such,
there is always mandrake; that supports LVM
at install or upgrade time.

If you install mandrake on top of your existing 
redhat/LVM system, the mandrake installer will
see the existing volume groups and allow you to
allocate them to mount points etc; thereby not 
*necessarily* losing data. 

You could even create temporary volumes to
install mandrake on then migrate data from the old
volumes to the new ones.

Its rpm based and mostly compatible with redhat rpms.

Actually, since mandrake have been supporting this
for a few versions now, I am surprised that redhat
are lagging behind on this issue!

Warning tho; deleting volumes in the mandrake installer
doesnt work so well.

> -----Original Message-----
> From: linux-lvm-admin@sistina.com 
> [mailto:linux-lvm-admin@sistina.com] On Behalf Of Terje Kvernes
> Sent: Saturday, 6 April 2002 8:29 p.m.
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Red Hat upgrade over existing LVM
> 
> 
> Nick Urbanik <nicku@vtc.edu.hk> writes:
> 
> > We have a number of servers with /usr and /var on LVM. The 
> difficulty 
> > arises when upgrading from one version of Red Hat to another; the 
> > installation disks do not recognise the logical volumes.
> 
>   a well known issue.
>  
> > Do any of you have any reasonable approach to solving this?
> 
>   if you want to do the "normal" thing with a CD-boot-upgrade, no,
>   you're fscked.
> 
> > Do I need to create a new network installation boot disk 
> with a small 
> > kernel with support for LVM and scripts to turn on LVM groups?
> 
>   that's one way, the easier way is to either use apt or red-carpet to
>   upgrade your distro.  with red-carpet, fiddle with
>   /etc/redhat-release, apt has dist-upgrade, I think.  I've upgraded
>   two machines from 7.0 -> 7.2 with red-carpet, but I'd advice you to
>   set off a day with this, even if you get the rpms from somewhere
>   besides ximian.
> 
>   I did it as follows: grab the rpms from RH7.2, with the updates,
>   from a local mirror, and dump them to /var/cache/redcarpet, then
>   fiddle with /etc/redhat-release (feel free to install the rpm
>   "redhat-release"), then run red-carpet.  things will break and fail
>   now and then, fiddle.
> 
>   these days I have a RH7.2-box that has an uptime of about 240 days.
>   :)
> 
> -- 
> Terje
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com 
> http://lists.sistina.com/mailman/listinfo/l> inux-lvm
> read the 
> LVM HOW-TO at 
> http://www.sistina.com/lvm/Pages/howto.html
> 

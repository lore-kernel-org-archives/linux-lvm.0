Message-Id: <3CAFCEBB.7860B8E4@vtc.edu.hk>
From: Nick Urbanik <nicku@vtc.edu.hk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Red Hat upgrade over existing LVM
References: <3CAE9F23.3C58CB1E@vtc.edu.hk> <wxxsn69ut5v.fsf@nommo.uio.no>
Content-Transfer-Encoding: 7bit
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
Date: Sat Apr  6 22:44:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Terje Kvernes wrote:

> Nick Urbanik <nicku@vtc.edu.hk> writes:
>
> > We have a number of servers with /usr and /var on LVM. The
> > difficulty arises when upgrading from one version of Red Hat to
> > another; the installation disks do not recognise the logical
> > volumes.
>
>   a well known issue.
>
> > Do any of you have any reasonable approach to solving this?
>
>   if you want to do the "normal" thing with a CD-boot-upgrade, no,
>   you're fscked.
>
> > Do I need to create a new network installation boot disk with a
> > small kernel with support for LVM and scripts to turn on LVM groups?
>
>   that's one way, the easier way is to either use apt

Does apt work with Red Hat in a usable way?  I tried it a long time ago,
and deleted it.

> or red-carpet to
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

I have used rpmfind --autoupgrade
to upgrade from 7.1 to 7.2, and that required not a huge amount of manual
intervention, but more than I want.

I tried using rpmfind to upgrade this machine from 7.2 to 7.2.93, but it
changed my /lib/ld-linux.so and everything ground to a halt.

I had to reboot with init=/sbin/sash to fix it.  Now I have created a
directory
/static, containing lots of statically compiled tools, including the LVM
tools.

We really need a rescue disk that supports LVM, RAID, reiserfs and ext3.
Anyone seen such a beast, or do I have to make it myself?

>   these days I have a RH7.2-box that has an uptime of about 240 days.
>   :)

So you are not yet running a recent kernel?

--
Nick Urbanik   RHCE                                  nicku@vtc.edu.hk
Dept. of Information & Communications Technology
Hong Kong Institute of Vocational Education (Tsing Yi)
Tel:   (852) 2436 8576, (852) 2436 8579          Fax: (852) 2436 8526
PGP: 53 B6 6D 73 52 EE 1F EE EC F8 21 98 45 1C 23 7B     ID: 7529555D
GPG: 7FFA CDC7 5A77 0558 DC7A 790A 16DF EC5B BB9D 2C24   ID: BB9D2C24

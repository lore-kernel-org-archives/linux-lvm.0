Subject: Re: [linux-lvm] Red Hat upgrade over existing LVM
References: <3CAE9F23.3C58CB1E@vtc.edu.hk>
From: Terje Kvernes <terjekv@math.uio.no>
In-Reply-To: <3CAE9F23.3C58CB1E@vtc.edu.hk>
Message-Id: <wxxsn69ut5v.fsf@nommo.uio.no>
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
Date: Sat Apr  6 02:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Nick Urbanik <nicku@vtc.edu.hk> writes:

> We have a number of servers with /usr and /var on LVM. The
> difficulty arises when upgrading from one version of Red Hat to
> another; the installation disks do not recognise the logical
> volumes.

  a well known issue.
 
> Do any of you have any reasonable approach to solving this?  

  if you want to do the "normal" thing with a CD-boot-upgrade, no,
  you're fscked.

> Do I need to create a new network installation boot disk with a
> small kernel with support for LVM and scripts to turn on LVM groups?

  that's one way, the easier way is to either use apt or red-carpet to
  upgrade your distro.  with red-carpet, fiddle with
  /etc/redhat-release, apt has dist-upgrade, I think.  I've upgraded
  two machines from 7.0 -> 7.2 with red-carpet, but I'd advice you to
  set off a day with this, even if you get the rpms from somewhere
  besides ximian.

  I did it as follows: grab the rpms from RH7.2, with the updates,
  from a local mirror, and dump them to /var/cache/redcarpet, then
  fiddle with /etc/redhat-release (feel free to install the rpm
  "redhat-release"), then run red-carpet.  things will break and fail
  now and then, fiddle.

  these days I have a RH7.2-box that has an uptime of about 240 days.
  :)

-- 
Terje

From: Eike Bernhardt <eike@unorganized.net>
Subject: Re: [linux-lvm] Known Issues with FreeBSD Slices on Disks?
Message-Id: <20020408173054.GA77542@unorganized.homeip.net>
References: <20020405172933.GA71085@unorganized.homeip.net>
    <20020408142641.GE1321@tykepenguin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020408142641.GE1321@tykepenguin.com>
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
Date: Mon Apr  8 12:30:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hello!

On Mon Apr  8 16:26:41 2002 CEST Patrick Caulfield wrote:

> On Fri, Apr 05, 2002 at 07:29:34PM +0200, Eike Bernhardt wrote:
> > Are there any known Problems when you want to use a Partition from a
> > Disk also containg a FreeBSD Slice as a PV?
> 
> I doubt it's to do with FreeBSD slices - I have tried LVM on disks with all
> sorts of partition schemes. That error does sound familar though.

Hm, I have no Idea why, but if I create a second VG which only consists
of /dev/hda4, there are no problems creating and using a LV in this VG.

http://134.106.120.23/lvm/lvm-create-second-vg.log.gz contains a log of
doing this.

Since this worked, I vgremove'd the newly created VG, and tried
extending my already existing VG with the now unused PV. But .. same
problem as before: 
lvcreate -- ERROR "Operation not permitted" opening logical volume "/dev/pile/test"

A log of this operation is avaliable at
http://134.106.120.23/lvm/lvm-remove-and-readd.log.gz


If you need different/more Information, please tell me.

Thanks, Eike!
-- 
Eike Bernhardt              http://unorganized.net/                ICQ: 11256658
"I'm a mean green Mother from Outer Space"
                                             Audrey II -- Little Shop of Horrors

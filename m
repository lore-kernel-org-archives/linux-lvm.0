Subject: Re: [linux-lvm] LVM bug
From: rich turner <rich@storix.com>
In-Reply-To: <45120000.1042594735@[192.168.200.4]>
References: <1042575714.1983.27.camel@rich.storix.com> 
	<45120000.1042594735@[192.168.200.4]>
Content-Transfer-Encoding: 7bit
Message-Id: <1042654984.1085.91.camel@rich-laptop>
Mime-Version: 1.0
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
Date: Wed Jan 15 12:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Tue, 2003-01-14 at 17:38, Steven Lembark wrote:
> 
> 
> -- Rich Turner <rich@storix.com>
> 
> > The following is a situation where LVM fails.
> >
> > Previously, I installed a system and created a physical volume on an
> > entire disk. I am now re-installing the system and have created a
> > physical volume on a partition on the same disk. The partition was
> > created with sfdisk. I am able to create volume groups and logical
> > volumes with no problem.
> >
> > The problem arises after a reboot of the system. vgscan fails to find
> > any volume groups. pvscan finds physical volumes on both the disk and
> > the partition. It appears LVM fails when creating a physical volume on a
> > partition of a disk when there was previously a physical volume on the
> > same entire disk.
> >
> > Using LVM 1.0.1
> 
> (1) 1.0.1 is pretty badly out of date; suggest updating to
>     1.0.6 or 2.X.

I will upgrade to 1.0.6 and see if there are any changes

> 
> (2) Running pvcreate on a full device (e.g., /dev/hda) then
>     again on /dev/hdaX will end up overwriting a portion of
>     the contents in your first PV with the second one. LVM
>     did exactly what you wanted it to. How is the a bug.

LVM did not do what I wanted, it failed. On a new install it still see's
a full device physical volume from a previous install. My new install
has only one physical volume on a partition. It fails because vgscan can
not find any volume groups because pvscan is looking for the now
non-existent physical volume on the entire disk.
> 
> 
> 
> 
> 
> --
> Steven Lembark                               2930 W. Palmer
> Workhorse Computing                       Chicago, IL 60647
>                                             +1 773 252 1080
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

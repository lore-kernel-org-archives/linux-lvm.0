content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <689F43A6CF84E541A721C5C3FD5ADECC143380@blr-m3-msg.wipro.com>
From: "Sharad Tiwari" <sharad.tiwari@wipro.com>
Subject: [linux-lvm] expanding on LVM2
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
Date: Wed Apr  2 05:13:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: linux-lvm-admin@sistina.com, mauelshagen@sistina.com

Hi all,
	This is a plain text mail (no html) ... hope it does reach you
all ...

> >LVM(2) handles that by using physical volume uuids (as you mention
> >below).
> >
> >Device paths can change that way and LVM will stil find the disks and
> >assemble them correctkly into volume groups.

Will the PV uuid be unique ... I mean to say is there a possibility of
two nodes issuing same PV uuid (when working independently)

If I connect multiple hard disks to a node, take a partition on a node
(say /dev/hdd1) and make a physical volume out of it, and then connect
the hard disk as a primary slave( /dev/hdb) and then run a pvdisplay ,
the physical volume does show the device name as /dev/hdb but cribs
about not finding /dev/hdd ... can this be avoided.


One more question I had was, How exactly is a raw device operation
request handled in LVM.

I was going through the code and did not find any character device
interface(for raw device operations) ... but again dd worked on the
logical volume .. so I am wondering how dd worked in the absebce of a
raw device operation support.

> >For 'pricate' volume group the situation is a failover situation.
> >You need have a design which makes sure that only one node can have
that
> >volume group active at any given time and if that one fails,
recognize
> >the failure, make sure the the failed node can't get back to life
(which > >will cause strange problems) and take the VG over at an
arbitrary other node.

Two questions I have on this are :

What is the failover mechanism being followed in LVM2 ???
I found out that when I do a vgcreate, a file called vgcreate.tmp is
created which is later renamed as vgcreate, now what happens if the node
happens to crash just after these entries are written onto the hard
disk.

If I happen to change the configurations where are they stored  ??

Thanks for the help,

Regards,
Sharad.

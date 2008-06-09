Received: from file.rdu.redhat.com (file.rdu.redhat.com [10.11.255.147])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m599jsr3032044
	for <linux-lvm@RedHat.com>; Mon, 9 Jun 2008 05:45:54 -0400
Received: from o.ww.redhat.com (vpn-4-116.str.redhat.com [10.32.4.116])
	by file.rdu.redhat.com (8.13.1/8.13.1) with ESMTP id m599jq46030300
	for <linux-lvm@RedHat.com>; Mon, 9 Jun 2008 05:45:53 -0400
Received: from o.ww.redhat.com (localhost [127.0.0.1])
	by o.ww.redhat.com (8.14.2/8.14.2) with ESMTP id m599irLj030154
	for <linux-lvm@RedHat.com>; Mon, 9 Jun 2008 11:44:53 +0200
Received: (from mauelsha@localhost)
	by o.ww.redhat.com (8.14.2/8.14.2/Submit) id m599irG6030153
	for linux-lvm@redhat.com; Mon, 9 Jun 2008 11:44:53 +0200
Date: Mon, 9 Jun 2008 11:44:53 +0200
From: Heinz Mauelshagen <mauelshagen@redhat.com>
Subject: Re: [linux-lvm] Performance tunning on LVM2
Message-ID: <20080609094453.GA5507@redhat.com>
References: <OF71017368.B3FFEE57-ONC1257460.0047F98A-C1257460.004C061F@lippi.fr>
	<1c748a490806060718t55680d38mdaa1286b754c346@mail.gmail.com>
	<OFFF54BB34.40906B94-ONC1257460.004F3651-C1257460.004FF3D1@lippi.fr>
	<1c748a490806060803v1b2b7027ib6e5cdd70029a628@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1c748a490806060803v1b2b7027ib6e5cdd70029a628@mail.gmail.com>
Reply-To: mauelshagen@redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jun 06, 2008 at 08:03:51AM -0700, Larry Dickson wrote:
> A (linear) volume group made of two physical volumes consists of one PV
> followed by the other, rather like a "Raid-Linear". If you size the
> origin logical volume right, you can get one LV (the origin) to fall on one
> disk, and force the snapshot to land on the other disk. This eliminates
> back-and-forth seeking to the COW. Whether it solves your problem will
> depend on how smart the driver is about the read-before-write activity on
> the origin volume.
> 
> Other members of the list may have more experience on this. Comments?

If I read correctly, Antony just has *ONE* PV.

So no matter what, he has to add another to allow for snapshot COW
store allocation on that other PV, distinct from the one holding
the origin(s). Presumably there's no other bottleneck aside from the
disk, that'll do better.

Keep in mind, that unless you've got streaming writes, the performance
won't drop as much as in the (artificial) dd test below.

FYI: With the current snapshot implementation, multiple snapshots per single
     origin will throttle write performance because of write duplication
     to all per snapshot COW stores.

Heinz

> 
> Larry
> 
> On 6/6/08, Antony MARTINEAU <Antony.MARTINEAU@lippi.fr> wrote:
> >
> >
> > The volume group vg0 is the raid0 of two disk (SAS 15000rpm 300G0)
> > I have only this raid on the server
> >
> > But i don't understand, imagine i make a volume group  ou of this raid0. It
> > is no possible to snapshot the original volume, am i wrong?
> >
> > If i make a new VG on another disks, For exemple /dev/vg1/
> > LVM don't permit to store a snaphot on a different VG than the origin
> > volum.
> >
> > for exemple /dev/vg0/test cant be snapshoting on /dev/vg1/test.snap
> >
> > LV test and LV test.snap must be on the same volume, am i wrong ???? so it
> > is impossible to store snapshot on another disk....
> >
> >
> >   Cordialement,
> >
> >    *MARTINEAU
> > Antony*
> > Service informatique
> > Assistant informatique
> > LIPPI Management La Fouillouse
> > 16440 Mouthiers sur Boheme
> > Tel.: 05.45.67.34.35
> > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
> > **http://www.lippi.fr* <http://www.lippi.fr/>
> >
> >
> >
> >   De : "Larry Dickson" <ldickson@cuttedge.com> Pour : "LVM general
> > discussion and development" <linux-lvm@redhat.com> Date: 06/06/2008 16:19 Objet
> > : Re: [linux-lvm] Performance tunning on LVM2
> > ------------------------------
> >
> >
> >
> > This looks like the result of excessive seeking. Are origin volume and
> > snapshot both on the same physical drive? Is it possible to make a volume
> > group out of two drives, and arrange things so that origin volume and
> > snapshot are hitting different disks?
> >
> > Larry Dickson
> > Cutting Edge Networked Storage
> >
> > On 6/6/08, *Antony MARTINEAU* <*Antony.MARTINEAU@lippi.fr*<Antony.MARTINEAU@lippi.fr>>
> > wrote:
> >
> > Hello,
> > My configuration:
> > Server DELL 2860 Intel(R) Xeon(R) CPU  X3230 @ 2.66GHz (Quad Core)
> > 8GB of  memory
> > 2 x SAS 15000 300G0 RAID 0 hardware
> > SLES 10 SP2
> > Kernel 2.6.16.60-0.21-xen
> >
> > i have one volume group vg0 ( whith one PV, the two disks in raid0) whith
> > many lvm
> > I am very surprise about LVM2 performance when a snapshot is done.
> > Write speed on the Original volume is very bad when a snaphot is active...
> >
> > For exemple:
> > *
> > Speed on /dev/vg0/test when there is NO snapshot :*
> >
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> > *
> > Speed on /dev/vg0/test when there is one snapshot of this original volume :
> > *
> >
> > suse2:~ # lvremove --force /dev/vg0/test3.snap
> >  Logical volume "test3.snap" successfully removed
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 6.42741 seconds, 131 MB/s
> > suse2:~ # lvcreate -s -L1G -ntest.snap /dev/vg0/test
> >  Logical volume "test.snap" created
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 204.862 seconds, 4.1 MB/s
> >
> > *
> > Speed on /dev/vg0/test when there is 2 snapshots of this original volume :
> > *
> >
> > suse2:~ # lvcreate -s -L1G -ntest1.snap /dev/vg0/test
> >  Logical volume "test1.snap" created
> > suse2:~ # lvcreate -s -L1G -ntest2.snap /dev/vg0/test
> >  Logical volume "test2.snap" created
> > suse2:~ # lvremove /dev/vg0/test2.snap
> > Do you really want to remove active logical volume "test2.snap"? [y/n]: y
> >  Logical volume "test2.snap" successfully removed
> > suse2:~ # dd if=/dev/zero of=/dev/vg0/test bs=2M count=400
> > 400+0 records in
> > 400+0 records out
> > 838860800 bytes (839 MB) copied, 270.928 seconds, 3.1 MB/s
> >
> >
> > Do you know  some elements about tunning performance?,?
> >
> > Performances are disastrous when a snaphot is active
> > Could you give your speed result? and your amelioration??
> >
> > ps:Results are the same whithout Kernel Xen and whith a kernel more recent
> > (*2.6.24.2* <http://2.6.24.2/>)  Cordialement,
> >    *MARTINEAU
> > Antony*
> > Service informatique
> > Assistant informatique
> > LIPPI Management La Fouillouse
> > 16440 Mouthiers sur Boheme
> > Tel.: 05.45.67.34.35
> > Courriel: *antony.martineau@lippi.fr* <antony.martineau@lippi.fr>*
> > **http://www.lippi.fr* <http://www.lippi.fr/>
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > Ce message et toutes les pieces jointes sont etablis a l'attention
> > exclusive de ses destinataires et sont strictement confidentiels. *Pour en
> > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
> >
> > This message and any attachments are confidential to the ordinary user of
> > the e-mail address to which it was addressed and may also be privileged. *More
> > information* <http://www.lippi.fr/disclaimer.php>
> >
> >
> > _______________________________________________
> > linux-lvm mailing list*
> > **linux-lvm@redhat.com* <linux-lvm@redhat.com>*
> > **https://www.redhat.com/mailman/listinfo/linux-lvm*<https://www.redhat.com/mailman/listinfo/linux-lvm>
> > read the LVM HOW-TO at *http://tldp.org/HOWTO/LVM-HOWTO/*<http://tldp.org/HOWTO/LVM-HOWTO/>
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >
> >
> >
> >
> >
> >
> >
> >
> >
> > Ce message et toutes les pieces jointes sont etablis a l'attention
> > exclusive de ses destinataires et sont strictement confidentiels. *Pour en
> > savoir plus cliquer ici* <http://www.lippi.fr/disclaimer.php>
> >
> > This message and any attachments are confidential to the ordinary user of
> > the e-mail address to which it was addressed and may also be privileged. *More
> > information* <http://www.lippi.fr/disclaimer.php>
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@redhat.com
> > https://www.redhat.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> >




> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Red Hat GmbH
Consulting Development Engineer                   Am Sonnenhang 11
Storage Development                               56242 Marienrachdorf
                                                  Germany
Mauelshagen@RedHat.com                            PHONE +49  171 7803392
                                                  FAX   +49 2626 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

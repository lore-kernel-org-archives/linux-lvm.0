Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2NEJXj22300
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 09:19:33 -0500
Received: from snow.csi.cam.ac.uk (snow.csi.cam.ac.uk [131.111.8.15])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i2NEJWWA032314
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 09:19:33 -0500
Received: from student.cusu.cam.ac.uk ([131.111.179.82]
	helo=kern.srcf.societies.cam.ac.uk)
	by snow.csi.cam.ac.uk with esmtp (Exim 4.20) id 1B5mkW-00051b-8z
	for linux-lvm@redhat.com; Tue, 23 Mar 2004 14:19:24 +0000
Received: from localhost ([127.0.0.1] ident=mjj29)
	by kern.srcf.societies.cam.ac.uk with esmtp (Exim 3.35 #1 (Debian))
	id 1B5mkU-0007l7-00
	for <linux-lvm@redhat.com>; Tue, 23 Mar 2004 14:19:22 +0000
Date: Tue, 23 Mar 2004 14:19:22 +0000 (GMT)
From: Matthew Johnson <mjj29@cam.ac.uk>
Subject: Re: [linux-lvm] hopefully not terminal. (fwd)
In-Reply-To: <Pine.LNX.4.44.0403231245390.31780-100000@kern.srcf.societies.cam.ac.uk>
Message-ID: <Pine.LNX.4.44.0403231417460.31780-100000@kern.srcf.societies.cam.ac.uk>
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 23 Mar 2004, Matthew Johnson wrote:

> Bouncing this with the correct from address to get to the list, I hope

Many thanks to Heinz, the lvm part is now back working. Now to get back
my /usr partition....

for reference for anyone who manages to find this post through google,
   you want:

pvcreate -ff /dev/md/3
vgcfgrestore -n vg0 /dev/md/3
vgscan
vgchange -ay

Thanks again!

Matt

>
> ---------- Forwarded message ----------
> Date: Mon, 22 Mar 2004 19:51:17 +0000 (GMT)
> From: Matthew Johnson <mjj29@srcf.ucam.org>
> To: linux-lvm@redhat.com
> Subject: hopefully not terminal.
>
> Right, I appear to have just done raidhotadd /dev/md1 /dev/md3, in
> stead of /dev/md1 /dev/hdh3. Oops. It doesn't complain that md3 is
> active either. More oops.
>
> md3 and md4 are in a linear lvm (lvm1 on 2.4.20ish kernel) of 222Gb in size, and md1 is a 100Mb
> raid5 partition (/). This means that the first 50Mb has probably been
> overwritten.
>
> This didn't cause the machine to die horribly, only not to come back up.
> Given I have probably only overwritten about 0.05% of the data, I hope it
> can mostly be restored. However, vgscan and vgchange -ay refuse to do
> anything, and vgcfgrestore reports unhelpfully that "physical volume
> /dev/md3 doesn't belong to volume group vg0"
>
> Any ideas how to fix this without wiping the whole thing (I have
> backups of critical stuff, but not all of it by a long way). I'm in the
> irc channel as "mjj29", if I'm around when everyone else is.
>
> Oh, I have no /usr/, /var/ or /home/ atm, so I hope no solutions need
> them (-;
>
> Matt
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

From: "William Blunn" <bill--f.juq41dsj@tao-group.com>
Message-ID: <BDEMIPDEGABMNEFIHCPDMEHAFCAA.bill--f.juq41dsj@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <5.1.1.6.0.20030712160456.02b2e398@imap.phys.unsw.edu.au>
Subject: [linux-lvm] Enough rope to hang self (was: LVM disk died)
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
Date: Sun Jul 13 12:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> I had LVM spanning 4 HDDs and one will no longer spin up.

Made me think.

If you have a VG with one PV, you're no worse off for resilience than if
you didn't have LVM.

Trouble with LVM is that it tempts people into having a VG made up from
several disks. People then end up gambling that none of their disks will
stop working and trash the VG.

About every couple of weeks, someone pipes up with "One of the disks in
my VG has died. Please help!".

You give people enough rope and they will hang themselves.

If there is to be more than one PV in a VG, it makes sense to make all
the PVs be resilient devices (e.g. RAID). Then when a hard disk goes
down (as it inevitably will), it won't trash the VG.

Makes me wonder if there is a way of making LVM encourage people to do
it properly.

For a VG with a single PV, LVM could let you use just any old device.

For a VG with more than one PV, LVM could offer warnings to the effect
that it would be a good idea to make the PVs be resilient devices.

Perhaps at the point where the number of PVs change from one or less to
more than one, LVM could foist the advice upon the user.

"If you wish to have more than on PV in a VG, please see
 /usr/share/doc/lvm/multiple_pv.txt".

This file would explain the issues and at the end, tell you the
following:

    It is necessary to have a file:

      /etc/lvm/dont_blame_lvm

    in order to be able to have more than one PV in a VG.

Once the file exists, LVM will let you do what you want.

Bill
--=20
William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/

The contents of this e-mail and any attachments are confidential and may
be legally privileged. If you have received this e-mail and you are not
a named addressee, please inform us as soon as possible on
+44 118 901 2999 and then delete the e-mail from your system. If you are
not a named addressee you must not copy, use, disclose, distribute,
print or rely on this e-mail. Any views expressed in this e-mail or any
attachments may not necessarily reflect those of Tao's management.
Although we routinely screen for viruses, addressees should scan this
e-mail and any attachments for viruses. Tao makes no representation or
warranty as to the absence of viruses in this e-mail or any attachments.
Please note that for the protection of our business, we may monitor and
read e-mails sent to and from our server(s).

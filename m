content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Snapshot creating problem
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B4A9@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
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
Date: Mon Mar 17 13:01:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Not sure if this has something to do with it, but right about the time I =
was creating the lv's and snapshot, this was getting spewed into =
/var/log/messages:
Mar 17 12:09:57 debian kernel: invalidate: busy buffer
Mar 17 12:10:00 debian last message repeated 66 times
Mar 17 12:11:30 debian last message repeated 134 times
Mar 17 12:14:53 debian kernel: invalidate: busy buffer
Mar 17 12:15:56 debian last message repeated 268 times
Mar 17 12:16:54 debian last message repeated 267 times
Mar 17 12:26:08 debian kernel: invalidate: busy buffer
Mar 17 12:27:21 debian last message repeated 536 times
Mar 17 12:27:31 debian last message repeated 200 times
Mar 17 12:34:05 debian kernel: invalidate: busy buffer
Mar 17 12:34:26 debian last message repeated 535 times
Mar 17 12:40:44 debian kernel: XFS mounting filesystem =
device-mapper(254,0)
Mar 17 12:46:09 debian kernel: invalidate: busy buffer
Mar 17 12:46:09 debian last message repeated 66 times
Mar 17 12:47:15 debian last message repeated 402 times
Mar 17 12:47:16 debian kernel: device-mapper: internal error adding =
target to table
Mar 17 12:51:40 debian kernel: invalidate: busy buffer
Mar 17 12:52:11 debian last message repeated 134 times
Mar 17 12:53:26 debian last message repeated 201 times
Mar 17 12:53:33 debian last message repeated 401 times
Mar 17 12:53:34 debian kernel: device-mapper: internal error adding =
target to table
Mar 17 12:53:59 debian kernel: invalidate: busy buffer
Mar 17 12:54:24 debian last message repeated 535 times
Mar 17 12:54:24 debian kernel: device-mapper: internal error adding =
target to table
Mar 17 13:02:11 debian kernel: invalidate: busy buffer
Mar 17 13:02:34 debian last message repeated 535 times


That busy buffer error on google seems realated to LVM.

To give you more info I need some instructions on how to get you the =
debug output.

Thanks,



--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: Alasdair G Kergon [mailto:agk@uk.sistina.com]
Sent: Monday, March 17, 2003 1:46 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Snapshot creating problem


On Mon, Mar 17, 2003 at 01:20:55PM -0500, Barry, Christopher wrote:
> Any ideas of what I'm doing wrong? An lvs shows it there, but it does =
not seem to appear in /dev/vg0/ and I cannot mount it.

You don't say what version you are using: see if you can reproduce
the problem using the current CVS LVM2 version.

Look in kernel message log for a (slightly) better error message.

Turn on debugging output (log to file) and see if the last set(s)=20
of 'Adding target' lines before you got the error make sense. =20

Assuming the problem is still present in CVS, if you'd like me
to look into it, I need a copy of the complete debugging output
and to know exactly which device-mapper patches you applied to=20
your kernel.

Alasdair
--=20
agk@uk.sistina.com

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB01258AA6@mercury.infiniconsys.com>
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
Date: Mon Mar 10 16:59:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Will this work against 2.4.20?

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com
office: 610.233.4747
direct: 610.233.4870
cell:   267.879.8321


-----Original Message-----
From: Andy Francke [mailto:afrancke@cisco.com]
Sent: Monday, March 10, 2003 5:51 PM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...


> OK, so I RTFM'd and have the LVM2 patch created against the
> vanilla kernel.org 2.4.20. Sorry for asking such a dumb question.
> Also, just got the latest xfs patch from sgi too, and am awaiting
> your instructions on what to change before applying either.
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Here's the patch for the devmapper patch. Navigate to whatever directory
contains "linux-2.4.19-devmapper-ioctl.patch" on your system (likely
/usr/src/kernel-patches/all/device-mapper). Uudecode and unzip the patch
attached (inline) - you will then want to patch your devmapper patch =
file by
running:

"patch -p0 < linux-2.4.19-devmapper-ioctl-patch.patch"

Make a copy of your linux-2.4.19-devmapper-ioctl.patch first so you can =
do a
before and after diff - the net result should be the deletion of several
lines following "BH_Inode" and the changing of a few line count numbers
above to compensate.

Now both devmapper and the XFS patches will apply cleanly. Do the XFS
patches first.

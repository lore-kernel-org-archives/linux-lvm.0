content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] LVM snap size weirdness...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB0142B55E@mercury.infiniconsys.com>
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
Date: Thu Mar 20 16:00:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Joe (the Magician),
	Thanks, for the insight on exactly what snapshots are doing. I was =
unaware that snapshots were updated by deltas (or, more precisely, only =
are the deltas) - I thought they were a static view of the volume at 'x' =
point in time. Guess that's why it only took a few secs to make!

Another question:

	When a backup program grabs files from the snapshot volume, is it =
subject to open file issues that are normally a problem during backups?

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com


-----Original Message-----
From: Joe Thornber [mailto:joe@fib011235813.fsnet.co.uk]
Sent: Thursday, March 20, 2003 3:31 PM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM snap size weirdness...



On Thursday, March 20, 2003, at 08:00 PM, Barry, Christopher wrote:

> I have dumped an ls of both the snap lv and the home lv and diffed=20
> them - no differences.
> Why/how can df be confused?

It's magic ;)  Think of the filesystem that df is looking at as a=20
combination of the original volume with some modifications held in the=20
snapshot volume.

- Joe


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

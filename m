From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Max storage size per system
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030307174127.SHWE2682.imf13bis.bellsouth.net@tiger2>
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
Date: Fri Mar  7 11:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

>>  I prefer RAID 1 (or RAID 10), too, but sometimes one has to use RAID 5.
>>  A common strategy is to put a higher number of hot spare drives in one
>>  system. Another (somewhat newer) strategy is to use two rotating parity
>>  drives per RAID set.

Can the XPs do that?

It would be really nice because one of the short comings of RAID 5 is the =
window of vulnerability during the rebuild time.

I have heard it can take as long as a week rebuild a large RAID 5 with heavy =
ongoing disk access.

(That might just be EMC propaganda, I have never seen it take that long).

EMC has what they call Parity Raid.  I don't understand it, but they claim it =
is faster and more robust than RAID 5.

Greg
--=20
Greg Freemyer

From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Core questions from a LVM neophyte...
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030311165457.CLW7741.imf25bis.bellsouth.net@tiger2>
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
Date: Tue Mar 11 10:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  Question 1:  Is it possible today to:

 >>  Have a large IDE RAID5 array that is virtualized through LVM and then
 >>  exported to a Dynamic Disk on Win2K over a LAN (not necessarily WAN)?

 >>  I believe iSCSI and HyperSCSI would both work... However I have not
 >>  found the approporiate interoperable software drivers.

I tried them also.  No luck yet.  Let us know if you get it working.

 >>  Question 2: The system that is described above is a linux system with
 >>  direct attached storage.  It is a SPOF.  Any inexpensive solutions that
 >>  would allow the Linux portion to be clustered for active/pasive
 >>  failover?  Is FC the only alternative here?

Several choices.  Ask on Linux-HA (heartbeat).  (Or search their archives.)

This still does not get you a "local" Win2k drive.  Exchange and ms-SQL only =
install onto local drives.

 >>  TIA,

 >>  - Steve






 >>  -- NextPart --
 >>  Attached File: c:\program files\goldmine\MailBox\Attach\gaf\smime(2).p7s

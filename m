From: "Gary Mansell" <Gary.Mansell@ricardo.com>
Content-Class: urn:content-classes:message
Date: Fri, 23 Sep 2005 15:46:03 +0100
Message-ID: <1127486763.18453.11.camel@grma-lap>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Recovering data from LVM partitions....
Reply-To: Gary.Mansell@ricardo.com,
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
To: nahant-list@redhat.com, linux-lvm@redhat.com
Cc: Gary Mansell <Gary.Mansell@ricardo.com>

Hi,

Since RHEL 4 I have been creating my new machines with LVM partitioning
as this is now the default. Hence I have two partitions on my disk
- /boot and an lvm partiton containing /, swap, and two other data
logical volumes.

Today I have had a filesystem failure on a machine and the / partition
is very corrupted and will not boot. Is there anyway that I can access
and recover the data from the logical volumes?

It strikes me that this is the downside of LV's - if you cannot boot off
of slash then it is not possible to access the data on the other logical
volumes.

Perhaps, if filesystem sizes are not likely to change it is better to
use standard partitions because if the / filesystem gets corrupted, at
least the other partitions are rescuable.

Please can someone advise. 

Regards

Gary Mansell
-- 

This e-mail and any files transmitted with it are confidential and intended
solely for the use of the individual or entity to whom they are addressed.
If you have received this e-mail in error please notify the sender immediately
and delete this e-mail from your system.  Please note that any views or opinions
presented in this e-mail are solely those of the author and do not necessarily
represent those of Ricardo (save for reports and other documentation formally
approved and signed for release to the intended recipient).  Only Directors
or Duly Authorised Officers are authorised to enter into legally binding
obligations on behalf of Ricardo unless the obligation is contained within
a Ricardo Purchase Order.

Ricardo may monitor outgoing and incoming e-mails and other telecommunications
on its e-mail and telecommunications systems.  By replying to this e-mail you
give consent to such monitoring.  The recipient should check this e-mail and
any attachments for the presence of viruses.  Ricardo accepts no liability for
any damage caused by any virus transmitted by this e-mail.  "Ricardo" means
Ricardo plc and its subsidiary companies.

Ricardo plc is a public limited company registered in England with registered
number 00222915.
The registered office of Ricardo plc is Bridge Works, Shoreham-by Sea,
West Sussex, BN43 5FG.
 

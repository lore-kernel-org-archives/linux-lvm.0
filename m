content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <BD9F7FC07AAE534CAFF3DCC5DD395D6E046D85C0@uspto-is-111.uspto.gov>
From: "Griffin, Michael (PEC)" <Michael.Griffin@USPTO.GOV>
Subject: [linux-lvm] Performance question
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
Date: Tue Jul 29 09:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have a Dell 4600 with a PERC quad channel raid controller attached to
an external disk array (14 disks).  I am running Oracle 9i on Red Hat
Linux.  I am running an import from an Oracle 8i database and
normalizing the data.  My 3 import files are between 2-4GB each
compressed, but grow to between 25-40GB each uncompressed.  It takes
approximately 10 hours to import these into my database.  I currently
have three disk arrays set up in RAID 0 to achieve as much speed as
possible (so far). =20

My question is, would it help my performance if I were to turn off RAID
on the controller(s) and use LVM?  Any suggested configs would be
helpful.

Thank you,

Michael

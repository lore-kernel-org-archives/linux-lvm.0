Return-Path: <russell@coker.com.au>
From: Russell Coker <bofh@coker.com.au>
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with striping
Date: Thu, 22 Mar 2001 09:58:13 +0100
References: <01C0B04F.5EFB3400.smdenton@bellsouth.net>
In-Reply-To: <01C0B04F.5EFB3400.smdenton@bellsouth.net>
MIME-Version: 1.0
Message-Id: <0103220958130N.00851@lyta>
Content-Transfer-Encoding: quoted-printable
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, "S. Michael Denton" <smdenton@bellsouth.net>

On Monday 19 March 2001 14:34, S. Michael Denton wrote:
> I tend to agree.  In general software RAID will bog the system down
> and if performance is key, you should take the load off the CPU
> whereever possible.  The obvious conclusion with data volumes is to
> use a hardware RAID controller, beit SCSI or IDE... I've used both
> SCSI raid controllers and the IDE promise raid controller with good
> results.  The other thing that may be killing your performance is IO
> contention.  Check for other highly-used devices on the same PCI
> bus... on PCs there are quite a few points of possible contention.

That really depends on the type of card.  There are many hardware RAID=20
devices out there that have significant limits on performance (they give =
less=20
performance from an array of 10000rpm Ultra2-SCSI drives than you expect =
from=20
a single ATA drive).

Hardware RAID controllers that have a CPU that is less than 100MHz in spe=
ed,=20
or that don't have battery backed cache for write-back caching tend to=20
deliver less performance than you hope for.

--=20
http://www.coker.com.au/bonnie++/     Bonnie++ hard drive benchmark
http://www.coker.com.au/postal/       Postal SMTP/POP benchmark
http://www.coker.com.au/projects.html Projects I am working on
http://www.coker.com.au/~russell/     My home page

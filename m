From: Toby Dickenson <tdickenson@geminidataloggers.com>
Subject: Re: [linux-lvm] Is it possible to change the PE size on a live volume?
References: <BDEMIPDEGABMNEFIHCPDIEHGEBAA.bill+f.9sfuw6uo@tao-group.com>
In-Reply-To: <BDEMIPDEGABMNEFIHCPDIEHGEBAA.bill+f.9sfuw6uo@tao-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200210212044.12544.tdickenson@geminidataloggers.com>
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
Date: Mon Oct 21 14:45:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, William Blunn <bill+f.9sfuw6uo@tao-group.com>

On Monday 21 Oct 2002 7:22 pm, William Blunn wrote:
> > Greetings. My volume is 225 GB in size and getting too small.
> > Unfortunately, I used the default PE size when creating the volume
> > group. Is there any way I can overcome the 256 GB limit ...
>
> In the LVM 1.0.x series,
>
> Given the sizes of modern hard disk arrays,
> maybe the default PE/LE size should be changed from 4 MiB to 16 MiB,
> in the LVM 1.0.x series.
>
> My feeling is that more people's needs would fit into 1 TiB than fit
> into 256 GiB.

doesnt LE size affect snapshot performance too?

> Perhaps a few people with small hard disks might complain: "I made an V=
G
> and it used the default PE/LE size of 16 MiB. The granularity is too
> coarse. Is there any way I can reduce the PE/LE size?"
>
> Of course I don't think many people would ever make this complaint, and
> even if they did, it would be because their disk arrays were small, say
> less than 500 MiB.

vgcreate knows the size of its initial PV. If the default LE size was=20
increased, vgcreate could give a warning if the initial PV was small enou=
gh=20
to be inconvenient.

From: "Anthony W. Marino" <anthony@AWMObjects.com>
Subject: Re: [linux-lvm] LVM System
References: <auto-000021223409@front2.mail.megapathdsl.net>
    <18610000.1015278554@duke.wrkhors.com>
In-Reply-To: <18610000.1015278554@duke.wrkhors.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <auto-000021226804@front2.mail.megapathdsl.net>
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
Date: Mon Mar  4 16:03:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, lembark@wrkhors.com

On Monday 04 March 2002 04:49 pm, lembark@wrkhors.com wrote:
> -- "Anthony W. Marino" <anthony@AWMObjects.com> on 03/04/02 16:39:10 -0500
>
> > Any thoughts or articles that would be usefull in determining the quality
> > on the following combination would be greatly appreciated:
> >
> > LVM 1.x
> > 3Ware 7800 Raid Controller
> > Maxtor 40GB harddrives
> > XFS Journalling FS
> > SuSE 2.4.18+ Linux
>
> Striped LVM on RAID5 is a nice, flexable way to go.
> If you set the individual raid stripes at an I/O page
> (normally 4K on linux) and then stripe across the
> PV's the I/O gets spread nicely across plenty of paths.
> Using a stripe == I/O size avoids the "write penalty" in
> RAID5, the Raid Controller and drives do a nice job of
> buffering and the whole thing should work nicely.

Do you recommend any particular kernel release?
Where could I find good instructions on putting it all together?

Thank You,
Anthony

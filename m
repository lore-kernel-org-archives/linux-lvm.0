From: Marc MERLIN <marc@merlins.org>
Subject: Re: [linux-lvm] vgchange -a y /dev/System fails
Message-Id: <20020129215738.GA8651@merlins.org>
References: <20020125233533.GK26045@merlins.org>
    <20020128104258.A24830@sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020128104258.A24830@sistina.com>
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
Date: Tue Jan 29 15:58:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: lvm-devel@sistina.com

[Adding a Cc to lvm-devel, since I apparently hit a bug in the code. Please
remove or edit as appropriate]

On Mon, Jan 28, 2002 at 10:42:58AM +0100, Heinz J . Mauelshagen wrote:
> > It fails and says:
> > parameter error setting up snapshot copy on write exception
> > 
> > So yes, I have  snapshots in there, but I can't delete  the snapshots if the
> > volume isn't active, and I can't activate the volume because of a snapshot.
> > 
> > To make things worse, /dev/System contains /usr and /var.
> > 
> > The snapshots were created with 1.0.1rc4 on 2.4.14 and I now run 2.4.17 with
> > 1.0.1rc4-ish
> 
> I am afraid you need to figure out the last metadata backup in /etc/lvmconf/
> which *doesn't* contain the flaky snapshot(s).
> 
> You didn't mention the name of you VG so let's say it was 'A'.
>
> You can do that with "vgcfgrestore -f /etc/lvmconf/A.conf.1.old -n A -ll".
> Replace the '1' in the metadata backup filename above with 2, 3 and so on
> (you should have a default of up to 9).
> After you found one (say #3), remember all you PVs belonging to that VG and run
> 
> pvcreate -yff /dev/AllYourPVsBelongingToA
> for pv in /dev/AllYourPVsBelongingToA
> do
>    vgcfgrestore -f /etc/lvmconf/A.conf.3.old -n A $pv
> done
> vgscan
> vgchange -ay A

Unfortunately, that doesn't work because I  had a cron job that was creating
daily snapshots (in an attempt to emulate ONTAP's snapshot's feature), so my
10 backups contain snapshot LVs

If the backups were text, I could edit them and remove the snapshot info in
there, but with a binary backup, I don't know how to do that.

If I  know how big  my /var and  /usr partitions were  and in which  order I
created them (vgcfgrestore -ll shows this  anyway), can I recreate the VG on
top of itself without losing the data in the the LVs?
Is there another way to recover from this?

More importantly, is this a known bug? Can I give info to help fix it?

Marc
-- 
Microsoft is to operating systems & security ....
                                      .... what McDonalds is to gourmet cooking
  
Home page: http://marc.merlins.org/   |   Finger marc_f@merlins.org for PGP key

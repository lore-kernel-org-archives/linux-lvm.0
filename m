From: d.levitin@gmx.de
MIME-Version: 1.0
References: <Pine.LNX.4.44.0208031112290.2922-100000@pzat.meep.org>
Subject: Re: [linux-lvm] vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group
Message-ID: <21751.1028376330@www23.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
Date: Sat Aug  3 07:04:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

> 
> 
> On Sat, 3 Aug 2002 d.levitin@gmx.de wrote:
> 
> > Hello,
> > I have a problem with my vg00 - the LVM doesn't have it any more. I
> found
> > such postings in the list archive, but I don't want to restore - as I
> think.
> > To the problem:
> > I had 10 disks in my Computer (/dev/sda.../dev/sdj) in the vg00. Then I
> have
> > 2 of them (/dev/sdj and /dev/sdi) unplugged. I hoped it would be no
> problem
> > for the LVM to work with the rest 8, but it doesn't do. I dont' worry
> about
> > the volumes on the sdi and sdj, but the other volumes are a problem...
> > So why the LVM dosn't see the other disks as well?
> >
> > Thanks a lot for your help
> > Dmitri
> >
> 
> Because LVM does not currently mount part volume groups for safety...
> I believe at some in in the future this might be solved.
> 
> Do you still have /dev/sdj and /dev/sdi you say they are unpluged at the
> moment and you don't want access to the info on them... if they have data
> that is split onto other pvs use pvmove move so only have lvs you don't
> what on those two pvs then use vgsplit to remove them from the vg, then
> you can unplug those two disks as they will be in a new volume group.
> 
> lv = logical volume
> pv = physical volume
> vg = volume group
> 
> 
> james
> 
> 

The 2 disks are for us temporarily unavailable (problem with a controller)
and I can't wait untill I can use them (so no pvmove :-(  ). Can I tell LVM it
have only with the other 8 disks to go on ?

Dmitri

-- 
GMX - Die Kommunikationsplattform im Internet.
http://www.gmx.net

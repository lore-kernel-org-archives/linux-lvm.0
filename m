Message-ID: <1055594711.3eeb18d7b67a4@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
Subject: Re: [linux-lvm] snapshots+highmem+'md raid5'
References: <3560BA143F45D5118E670000E82459214C2084@ssk.schneiderkenzingen.de> <20030612235501.GA15452@www.13thfloor.at> <20030614002027.GA26078@corp.vendio.com> <20030614003726.GA27245@www.13thfloor.at>
In-Reply-To: <20030614003726.GA27245@www.13thfloor.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sat Jun 14 14:52:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Quoting Herbert Poetzl <herbert@13thfloor.at>:

> On Fri, Jun 13, 2003 at 05:20:27PM -0700, Petro wrote:
> > On Fri, Jun 13, 2003 at 01:55:01AM +0200, Herbert Poetzl wrote:
> > > On Thu, Jun 12, 2003 at 03:28:59PM +0200, Koch, Steffen wrote:
> > > > If someone has a solution for this please help.
> > > hmm, do you have himem enabled (in kernel config)?
> > > if yes, try to disable it ...
> > 
> >     Does this apply to RAID 0 as well? 
> > 
> >     I've got several boxes running with:
> > 
> >     CONFIG_HIGHMEM4G=y
> >     # CONFIG_HIGHMEM64G is not set
> >     CONFIG_HIGHMEM=y
> > 
> >     And 2-4 GiB of ram under 2.4.18, with LVM 1.03. 
> > 
> >     I'm trying to get LVM 1.07 to compile with 2.4.21 with :
> >     
> >     CONFIG_HIGHMEM4G=y
> >     # CONFIG_HIGHMEM64G is not set
> >     CONFIG_HIGHMEM=y
> >     CONFIG_HIGHIO=y
> > 
> > 
> >     Why is this bad? 
> 
> didn't say that this would be bad, only that
> it live-locked my system at high load ...
> the tenor on the list was: "highmem is bad"
> so I turned it off, and, voila the system was
> stable again ...

snapshots + md + highmem is very bad
if you don't use snapshots its perfectly OK

> another, yet unexplained issue, is that on
> another system, 4 SCSI discs, form a RAID 5
> array (software) which gives about 35MB
> throughput, but lvm 1.0.7 ontop of that md
> only has about 18MB throughput ...

I've a bit defferent figures from a onboard HPT374 4 ide chanels with
4 IBM deskstars 80Gb, but i still lose 8-15Mb/s compared to plain md :

/dev/hda:
 Timing buffer-cache reads:   128 MB in  0.41 seconds =308.43 MB/sec
 Timing buffered disk reads:  64 MB in  1.42 seconds = 45.07 MB/sec
[root@svetljo root]# hdparm -tT /dev/md13

/dev/md13:
 Timing buffer-cache reads:   128 MB in  0.41 seconds =316.05 MB/sec
 Timing buffered disk reads:  64 MB in  1.08 seconds = 59.26 MB/sec
[root@svetljo root]# hdparm -tT /dev/data
data   data2
[root@svetljo root]# hdparm -tT /dev/data2/Movies

/dev/data2/Movies:
 Timing buffer-cache reads:   128 MB in  0.41 seconds =316.05 MB/sec
 Timing buffered disk reads:  64 MB in  1.32 seconds = 48.30 MB/sec

time dd if=/dev/zero of=/mnt/Movies/BigFile.tm bs=1M count=4000
4000+0 records in
4000+0 records out
0.02user 15.57system 1:37.10elapsed 16%CPU (0avgtext+0avgdata 0maxresident)k
0inputs+0outputs (148major+40minor)pagefaults 0swaps

best,

Svetljo

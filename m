Subject: Re: [linux-lvm] snapshots+highmem+'md raid5'
Message-ID: <1055625009.3eeb8f3202f9c@secure.st-peter.stw.uni-erlangen.de>
From: Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>
References: <3560BA143F45D5118E670000E82459214C2084@ssk.schneiderkenzingen.de> <20030612235501.GA15452@www.13thfloor.at> <20030614002027.GA26078@corp.vendio.com> <20030614003726.GA27245@www.13thfloor.at> <1055594711.3eeb18d7b67a4@secure.st-peter.stw.uni-erlangen.de> <20030614200754.GB16650@www.13thfloor.at>
In-Reply-To: <20030614200754.GB16650@www.13thfloor.at>
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
Date: Sat Jun 14 16:11:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: herbert@13thfloor.atHerbert Poetzl <herbert@13thfloor.at>
Cc: linux-lvm@sistina.com, Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

Quoting Herbert Poetzl <herbert@13thfloor.at>:

> On Sat, Jun 14, 2003 at 02:45:11PM +0200, Svetoslav Slavtchev wrote:
> > Quoting Herbert Poetzl <herbert@13thfloor.at>:
> > 
> > > didn't say that this would be bad, only that
> > > it live-locked my system at high load ...
> > > the tenor on the list was: "highmem is bad"
> > > so I turned it off, and, voila the system was
> > > stable again ...
> > 
> > snapshots + md + highmem is very bad
> > if you don't use snapshots its perfectly OK
> 
> I have to disagree, live-lock under high load is
> not perfectly OK, at least not for me ... 8-)

i never had a lock-up :)
this is with lvm1 soft raid 0 &5 and xfs.
(firstly 1Gb and from a week 1.5Gb)

> > > another, yet unexplained issue, is that on
> > > another system, 4 SCSI discs, form a RAID 5
> > > array (software) which gives about 35MB
> > > throughput, but lvm 1.0.7 ontop of that md
> > > only has about 18MB throughput ...
> > 
> > I've a bit defferent figures from a onboard HPT374 4 ide chanels
> with
> > 4 IBM deskstars 80Gb, but i still lose 8-15Mb/s compared to plain md
> :
> > 
> > /dev/hda:
> >  Timing buffer-cache reads:   128 MB in  0.41 seconds =308.43 MB/sec
> >  Timing buffered disk reads:  64 MB in  1.42 seconds = 45.07 MB/sec
> > [root@svetljo root]# hdparm -tT /dev/md13
> > 
> > /dev/md13:
> >  Timing buffer-cache reads:   128 MB in  0.41 seconds =316.05 MB/sec
> >  Timing buffered disk reads:  64 MB in  1.08 seconds = 59.26 MB/sec
> > [root@svetljo root]# hdparm -tT /dev/data
> > data   data2
> > [root@svetljo root]# hdparm -tT /dev/data2/Movies
> > 
> > /dev/data2/Movies:
> >  Timing buffer-cache reads:   128 MB in  0.41 seconds =316.05 MB/sec
> >  Timing buffered disk reads:  64 MB in  1.32 seconds = 48.30 MB/sec
> 
> I posted my results a month ago, but I digged them
> out again, because together with your results, it
> sheds new light on that issue ...
> 
> mine          	raw disc    md(raid5)   lvm on md
> -----------------------------------------------------
> hdparm          14694.40    34129.92    18667.52
> dd 1024k        14988.22    34732.56    18647.98
> dd 32k          15516.06    33945.48    18862.67
> 
> yours          	raw disc    md(raid5)   lvm on md
> -----------------------------------------------------
> hdparm          46151.68    60682.24    49459.20 
> 
> in both cases the lvm lies about 3MB over the raw
> disc throughput, regardless of the md values ...
> 
> maybe this could lead to some explanation of this
> issue ... unfortunately there was no reply to my
> posting over the last month *sigh*

hm this is really strange.
but can we belive hdparm, i think no.
i was getting ~55Mb/s  on raid-0 with bonnie++ but hdparm gives between 58-68Mb/s.
i probably have to try to free one of the md5 raids and run bonnie++ on it,
it should give better/ trustable numbers 


best,

svetljo

From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] snapshots+highmem+'md raid5'
Message-ID: <20030616102659.GB23590@www.13thfloor.at>
References: <3560BA143F45D5118E670000E82459214C2084@ssk.schneiderkenzingen.de> <20030612235501.GA15452@www.13thfloor.at> <20030614002027.GA26078@corp.vendio.com> <20030614003726.GA27245@www.13thfloor.at> <1055594711.3eeb18d7b67a4@secure.st-peter.stw.uni-erlangen.de> <20030614200754.GB16650@www.13thfloor.at> <20030616113249.C24004@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030616113249.C24004@sistina.com>
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
Date: Mon Jun 16 05:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mauelshagen@sistina.com
Cc: linux-lvm@sistina.com, Svetoslav Slavtchev <galia@st-peter.stw.uni-erlangen.de>

On Mon, Jun 16, 2003 at 11:32:49AM +0200, Heinz J . Mauelshagen wrote:
> On Sat, Jun 14, 2003 at 10:07:54PM +0200, Herbert Poetzl wrote:
> > On Sat, Jun 14, 2003 at 02:45:11PM +0200, Svetoslav Slavtchev wrote:
> > > Quoting Herbert Poetzl <herbert@13thfloor.at>:

 ... some highmem live-lock issue [removed] ...

> > I posted my results a month ago, but I digged them
> > out again, because together with your results, it
> > sheds new light on that issue ...
> > 
> > mine          	raw disc    md(raid5)   lvm on md
> > -----------------------------------------------------
> > hdparm          14694.40    34129.92    18667.52
> > dd 1024k        14988.22    34732.56    18647.98
> > dd 32k          15516.06    33945.48    18862.67
> > 
> > yours          	raw disc    md(raid5)   lvm on md
> > -----------------------------------------------------
> > hdparm          46151.68    60682.24    49459.20 
> > 
> > in both cases the lvm lies about 3MB over the raw
> > disc throughput, regardless of the md values ...
> 
> The reason probably is LVMs read ahead.

hmm, so it's a feature?

seriously, what can be done about it?
it surely doesn't hurt on a 50M per disk throughput 
system, but 34M/19M seems cruel, especially because 
I'm thinking of adding one or two more discs to the 
system, which probably leads to a 50M/19M situation 
with lvm?

TIA,
Herbert

PS: why am I receiving your emails twice, with 
alternating From headers? I actually get them
three times as I'm subscribed to the list too ;)

Heinz.Mauelshagen@t-online.de (Heinz J . Mauelshagen)
"Heinz J . Mauelshagen" <mauelshagen@sistina.com>
(one list copy)

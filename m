From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] LVM2 for kernels 2.4.20(another problem raid-0)
Message-ID: <20030127124956.GI1698@tykepenguin.com>
References: <1043622448.3e346a3057b43@secure.st-peter.stw.uni-erlangen.de> <20030127111301.GD1698@tykepenguin.com> <1043666356.3e3515b44e061@secure.st-peter.stw.uni-erlangen.de> <20030127112714.GE1698@tykepenguin.com> <1043667262.3e35193e470c0@secure.st-peter.stw.uni-erlangen.de> <20030127115012.GG1698@tykepenguin.com> <1043669513.3e3522096e53e@secure.st-peter.stw.uni-erlangen.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1043669513.3e3522096e53e@secure.st-peter.stw.uni-erlangen.de>
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
Date: Mon Jan 27 06:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 27, 2003 at 01:11:53PM +0100, Svetoslav Slavtchev wrote:
> Quoting Patrick Caulfield <caulfield@sistina.com>:
> 
> > On Mon, Jan 27, 2003 at 12:34:22PM +0100, Svetoslav Slavtchev wrote:
> > > 
> > > do you think it's only xfs related,
> > > if i remmember correctly it's not only xfs problem
> > 
> > I'm fairly sure it was just XFS. It makes (to us) odd assumptions about
> > the
> > alignment of the journal or something.
> > > i'll check later with reiser and jfs 
> > 
> 
> may be i should try this patch:
> http://cgi.cse.unsw.edu.au/~neilb/patches/linux-stable/2.4.leading/2003-01-06:00/015RaidSplit
> after i check reiser and jfs
> 
> 
> 
> > I've been running reiser over LVM2 for AGES !
> over soft raid-0 ? 

No, true. I did try it once though :) 
 

-- 

patrick

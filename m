From: Benoit <benoit.peccatte@enst-bretagne.fr>
Subject: Re: [linux-lvm] Changing PV position
References: <200312181208.49303.benoit.peccatte@enst-bretagne.fr> <20031219110923.E18654@sistina.com>
In-Reply-To: <20031219110923.E18654@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200312191603.25287.benoit.peccatte@enst-bretagne.fr>
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
Date: Fri Dec 19 09:05:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Friday 19 December 2003 11:09, Heinz J . Mauelshagen wrote:
> On Thu, Dec 18, 2003 at 12:08:49PM +0100, Benoit wrote:
> > Hello,
> >
> > I'm currently using lvm on my box and one disk just died.
> > Then the second disk (hdb) became the first one (hda). The problem is
> > that now I can't get back the physical volume which is on it. Is it
> > possible to tell lvm to force the reading of a PV even if it isn't on the
> > same disk as before ?
>
> vgscan does whyt you are asking for (before trying "vgchange -ay").

I found the problem, my lvm.conf had a filter to dsable the scan of the first 
drive. So now vgchange -ay works. 

Thank you for your help and sorry for bugging you.

Benoit

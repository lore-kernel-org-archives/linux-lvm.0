From: Harri Haataja <harri.haataja@smilehouse.com>
Subject: Re: [linux-lvm] extending a logical volume
Message-Id: <20020121224817.B10434@tolppa.smilehouse.com>
References: <12230000.1011638456@duke.wrkhors.com>
    <20020121201314.40293.qmail@web20303.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020121201314.40293.qmail@web20303.mail.yahoo.com>;
    from bwlang@yahoo.com on Mon, Jan 21, 2002 at 12:13:14PM -0800
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
Date: Mon Jan 21 14:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Jan 21, 2002 at 12:13:14PM -0800, Brad Langhorst wrote:
> --- lembark@wrkhors.com wrote:
> > -- Pierrick PONS <ppons@cvf.fr> on 01/21/02 19:09:31
> > +0100
> > 
> > > I've read the extending logical volume section and
> > I can't believe this.
> > > According to the doc, it would be impossible to
> > extend a logical volume 
> 
> um - i think i just did this...
> 
> lvextend -L +10G /dev/vg1/data 
> followed by 
> resize-reiserfs
> 
> no corruption (at least not that I've noticed)

I do this all the time with XFS, Reiser and even ext3.
At least reiser also shrinks, I think.

-- 
I presented the idea of entropy informally recently as "when you put a frog
in a blender, the bits that are no longer frog".
	-- Alan Rosentahl, Scary Devil Monastery

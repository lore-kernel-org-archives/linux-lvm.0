From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] extending a logical volume
In-Reply-To: <20020121224817.B10434@tolppa.smilehouse.com>
Message-Id: <Pine.LNX.4.10.10201220023310.20722-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Mon Jan 21 18:27:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Mon, 21 Jan 2002, Harri Haataja wrote:

> On Mon, Jan 21, 2002 at 12:13:14PM -0800, Brad Langhorst wrote:
> > --- lembark@wrkhors.com wrote:
> > > -- Pierrick PONS <ppons@cvf.fr> on 01/21/02 19:09:31
> > > +0100
> > > 
> > > > I've read the extending logical volume section and
> > > I can't believe this.
> > > > According to the doc, it would be impossible to
> > > extend a logical volume 
> > 
> > um - i think i just did this...
> > 
> > lvextend -L +10G /dev/vg1/data 
> > followed by 
> > resize-reiserfs
> > 
> > no corruption (at least not that I've noticed)
> 
> I do this all the time with XFS, Reiser and even ext3.
> At least reiser also shrinks, I think.
> 

I had a resize reiserfs go really bad on 2.4.9 + patches, noticed it
after a couple of days. Personally i don't trust it, but thats just
probably me, I aways try to rebuild filesystems. 

James

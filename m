Subject: Re: [linux-lvm] extending a logical volume
In-Reply-To: Your message of
    "Mon, 21 Jan 2002 19:28:59 MST."
    <20020121192859.H4014@lynx.turbolabs.com>
References: <E16Sist-000136-00@arwen.dev33.cvf>
    <20020121192859.H4014@lynx.turbolabs.com>
MIME-Version: 1.0
From: Pierrick PONS <ppons@cvf.fr>
Message-Id: <E16Syml-0004V1-00@arwen.dev33.cvf>
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
Date: Tue Jan 22 05:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> On Jan 21, 2002  19:09 +0100, Pierrick PONS wrote:
> > I've read the extending logical volume section and I can't believe this.
> > According to the doc, it would be impossible to extend a logical volume 
> > without unmounting it first.
> 
> LV resize != fs resize.
> 

Yes you're right. It's possible to extend LV online but it's not the same for 
file systems.


> > I'm using a ext3 (with a 2.4.17 kernel) filesystem and I'd like to extend my 
> > logical volume without unmounting it first. This would be used on a
> > production server, so I can't unmount any logical volume.
> 
> Currently, you cannot online resize ext3, but that is only because the code
> which I wrote to do this for 2.2 was never released, and it has not been
> ported to 2.4/2.5 yet.
> 

It would be a really goud feature .... :-)


> > I've seen that a ext2online patch does exist, maybe this fonctionnality is 
> > still implemented in a newer kernel ?
> 
> No, still only available as a patch.  The ext2 online resizing patch is
> very solid.  The ext3 code is, by necessity, a total rewrite of the code
> to work with ext3 journaling, but the fundamental concepts are the same.
> 
> > Could you give me, if it exists, a method to extend the size without unmount 
> > the logical volume ?
> 
> Use ext2 + ext2online patch (not great, because you probably crash more
> often than you need to resize), use ext3 but no online resizing (offline
> resizing works just fine with ext2resize), or work on porting the ext3
> resizing code to 2.4.
> 

hmmm, I'm not good enough to code this    :-(

So you'd rather use ext3 with offline resizing. 
That is a real problem because LVM would be used on a 24/24 available data 
server with nfs accesses . Datas should be get as often as the other servers 
need to.
Maybe I should have a look at reiserfs + resize-reiserfs instead of using ext3 
. What a pitty, ext3 is easy to install and is jouralised.


> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> 
> 
Thank you Andreas .


Pierrick

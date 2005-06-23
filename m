Date: Wed, 22 Jun 2005 18:13:14 -0700
From: Terry Rigby <t-rigby@shaw.ca>
Subject: Re: [linux-lvm] lvextend
In-reply-to: <1119488901.4305.27.camel@sboyd.brisbane.redhat.com>
Message-id: <200506221813.14575.t-rigby@shaw.ca>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
References: <200506221716.00221.t-rigby@shaw.ca>
	<1119488901.4305.27.camel@sboyd.brisbane.redhat.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: sboyd@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

thx Sean, I had just stumbled upon that as well.  another alternative seems to 
be pvdislplay /dev/hde |grep "PV Size" and then use that size in GB using 
lvextend -L +XXG /path/to/lv

Terry Rigby

On June 22, 2005 06:08 pm, Sean Boyd wrote:
> On Wed, 2005-06-22 at 17:16 -0700, Terry Rigby wrote:
> > I am trying to add a full hard drive to my LV by following the directions
> > at TLDP.org.  It says there to use lvextend -L +XXG where XX is the size
> > in GB you want to add to the LV.  Is there a more simple way to just add
> > a whole hard drive ie: /dev/hde
> >
> > It seems like a pain to have to manually figure out the size of the hard
> > drive then add it using lvextend -L +200GB for a 200GB hard drive
> > especially since we all know its not actually 200GB.
>
> You could increase the LV by using the remaining free physical extents
> (PE).
>
> To check how many PE's are available after extending the VG run
> vgdisplay and check "Free  PE / Size". The first value will give you the
> total number of PE's available.
>
> Then extend your LV using the -l switch to specify PE's rather than
> having to determine a size using the -L switch.
>
> For example "lvextend -l +25 /dev/volGroup00/myLVM" will extend myLVM by
> 25 PE's.
>
> Of course you then need to extend to file system to be able to use this
> extra space :)
>
> --Sean
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

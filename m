From: Andreas Pakulat <ap125@informatik.uni-rostock.de>
Subject: Re: [linux-lvm] Repair inconsistent PV
In-reply-to: <20030818220805.GB513@questra.com>
Message-id: <20030818230554.GB23997@debian.pakulat>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <20030816154556.GA23415@debian.pakulat>
 <20030817012336.GA26462@debian.pakulat>
 <20030818214207.GC22587@debian.pakulat> <20030818220805.GB513@questra.com>
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
Date: Mon Aug 18 18:07:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On 18.Aug 2003 - 18:08:05, Scott Mcdermott wrote:
> Andreas Pakulat on Mon 18/08 23:42 +0200:
> > only wanted to notify everyone, that I could now solve my
> > problem with hexedit and lvm.h. I changed the Major/Minor
> > Numbers in both hdXX and then looked at the VG Data, I
> > found that the one in hdc2 seemed OK, while the one in
> > hda7 looked like random Data was written in it. So I
> > copied the VG Metadata into hda7 using dd. A vgscan marked
> > lvtmp as problematic, it was in hda7 but in the vgmetadata
> > were only 3 LV's, so I changed that and threw out the LV
> > Metadata of that particular lv. It is also the one I was
> > deleting when the hardware error occured. Now I can read
> > my data again.
> 
> that's cool investigative work...

With a bit knowledge of C and the size of integer-datatypes it is not
that hard. Even though I had to play a little, to find out which
metadata block is the right one. And the lvm.h file is very well written
and documented, it's relatively easy to use it to understand the bytes
on the device.

> just wondering out of curiosity...did you have a backup when
> you did this? :)

You mean a backup of my original VG-Metadata? No, I explained that in
the original post, I lost my / partition and wanted to reinstall my
system, during the reorganization of the VG I lost some metadata due to
a hardware error. If I had a backup of the LVM-Metadata the whole
process would have been much easier - only a pvcreate -ff and
vgcfgrestore. 

From the raw devices I made a backup before starting of doing anything
to the PV's, I did not want to loose more data.

And I did not have a system backup, as this system is not that
important, but it would have costed a reasonable amount of time to get
the system back working without the data from the lv.

Andreas

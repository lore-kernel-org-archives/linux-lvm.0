From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvcreate problem on new IDE disk
Message-ID: <20030423183832.A5757@sistina.com>
References: <20030419192108.A18402@ultraviolet.org> <20030421000714.A30038@uk.sistina.com> <20030420212233.B18402@ultraviolet.org>
Mime-Version: 1.0
In-Reply-To: <20030420212233.B18402@ultraviolet.org>; from treed@ultraviolet.org on Sun, Apr 20, 2003 at 09:22:33PM -0700
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
Date: Wed Apr 23 11:44:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Apr 20, 2003 at 09:22:33PM -0700, Tracy R Reed wrote:
> On Mon, Apr 21, 2003 at 12:07:15AM +0100, Alasdair G Kergon spake thusly:
> > Two things to check first:
> >   Make sure that /dev/hdd2 exists and that other programs can
> > write/read it;
> 
> brw-rw----    1 root     disk      22,  66 Mar 14  2002 /dev/hdd2
> 
> >   Run 'vgscan' and then try the pvcreate again.
> > [vgscan needs running after new devices are added] 
> 
> home:/# vgscan
>   Reading all physical volumes.  This may take a while...
>   Found volume group "system" using metadata type lvm1
> home:/# pvcreate /dev/hdd2
>   Failed to read existing physical volume '/dev/hdd2'
>   Physical volume "/dev/hdd2" successfully created
> 
> It still says "failed to read" etc. but then says successfully created.
> Hmm...
> 
> home:/# vgextend system /dev/hdd2
>   Volume group "system" successfully extended
> 
> Ok, looks like it is working ok. Now another problem...
> 
> home:/# pvmove
>   Command not implemented yet.
> 
> Ugh...looks like LVM1 had it but LVM2 does not yet. Has this changed since
> my version?

You'll have it shortly with LVM 2.0 :)

> 
>   LVM version:     1.95.10 (2002-05-31)
> 
> Even if pvmove is still nonexistant I guess I can put the new disk in another
> VG, create LV's over there, and manually copy the data over.

Yes.

> 
> Thanks for the help! 
> 
> -- 
> Tracy Reed      http://www.ultraviolet.org

Regards,
Heinz    -- The LVM Guy --

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

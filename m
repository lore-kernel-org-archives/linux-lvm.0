Subject: Re: [linux-lvm] combining two vg's into one
References: <20040129022341.88184.qmail@web80402.mail.yahoo.com>
	<200401290444.i0T4iVX02132@ecstasy.winternet.com>
From: Christopher Mark Conn <cmcgoat@swbell.net>
In-Reply-To: <200401290444.i0T4iVX02132@ecstasy.winternet.com> (Ken Fuchs's
 message of "Wed, 28 Jan 2004 22:44:31 -0600")
Message-ID: <87ektj8dxm.fsf@swbell.net>
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
Date: Thu Jan 29 01:30:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Ken Fuchs <kfuchs@winternet.com> writes:

>>I've got 2 vg's on two different partitions on
>>different disks, one is my root vg and the other
>>has /usr, /var and /tmp filesystems. I'd like to
>>keep them on separate disks but use the same vg
>>if I can, but I'm unsure how to combine them.
>
> To keep / on one disk and /usr, /var and /tmp on another
> disk, one volume group per disk as described above is the
> best way to do this.  There is no advantage to combining
> the two volume groups together given that one wants to
> keep logical volumes exclusively on one disk or the other.
>
> Combining the two volume groups into one volume group
> would allow logical volumes to span the two disks and
> lvm striping, but that is contrary to the desire to keep
> each logical volume exclusively on a particular disk.

Thanks Ken, that's one thing I was wondering, is it 
better to keep one vg per pv. Sounds like I'm already
set up the way I need to be.

--
Chris Conn             
cmcgoat@swbell.net  http://storm.cadcam.iupui.edu/~cmcgoat
Austin, Texas, USA
                                        

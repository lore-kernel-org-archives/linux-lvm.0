Message-ID: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560E8C@s99mail06>
From: "Little, Chris" <Chris.Little@okdhs.org>
Subject: RE: [linux-lvm] restoring filesystem state using snapshot
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
Date: Thu Jan  8 17:25:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Will that work since snapshot relies on the source?

> -----Original Message-----
> From: Ken Fuchs [mailto:kfuchs@winternet.com]
> Sent: Thursday, January 08, 2004 4:26 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] restoring filesystem state using snapshot
> 
> 
> Kanika Nema wrote:
> 
> >i want to restore the filesystem state using only the 
> snapshot taken by LVM 
> >ie without taking a full backup.
> >is this possible to do? i read all the lvm commands, but 
> there is no command 
> >to actually restore the entire filesystem back to the state 
> it was in, when 
> >the snapshot was taken.
> >though the old files' state can be viewed using the snapshot 
> volume, i want 
> >to take the filesystem back to the prev state.
> >Please tell me if this can be done. its urgent.
> 
> Will copying the contents of the snapshot over the original logical
> volume do what you want?  If so, this can be done as follows:
> 
> # mount /dev/vg/snapshot /snap
> # mount /dev/vg/original /orig
> # (cd /snap; tar cf - .) | (cd /orig; tar xvf -)
> 
> Of course the v option on the second tar invocation can be omitted to
> avoid seeing all the filenames of the files being copied.
> 
> Sincerely,
> 
> Ken Fuchs <kfuchs@winternet.com>
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

From: Herbert Poetzl <herbert@13thfloor.at>
Subject: Re: [linux-lvm] umount returns device is busy
Message-ID: <20031222231520.GA31471@MAIL.13thfloor.at>
References: <000701c3c8b7$3190a800$c3507580@atdsputnik> <3FE76BD3.13937AA5@uiuc.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FE76BD3.13937AA5@uiuc.edu>
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
Date: Mon Dec 22 17:16:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "P. Larry Nelson" <lnelson@uiuc.edu>
Cc: linux-lvm@sistina.com

On Mon, Dec 22, 2003 at 04:10:27PM -0600, P. Larry Nelson wrote:
> I've been using LVM now since sometime this past summer and
> everything has worked great and as advertised, until I tried
> to unmount a logical volume.  And this happens on both RedHat
> 9 and ES_3.
> 
> I had occasion the other day to unmount one of the mounted raid 
> arrays in order to upgrade some firmware.  When I tried to do an
> unmount command, I got "device is busy".  Ok, I'm cd'd there
> from one of my windows or something, so I make sure all open
> terminal windows are *not* cd'd there.  Redo the umount command
> with same result.  Weird, something's got a file open. So, I did
> an lsof command and grep for the device (/dev/VG1/LV1).  Nothing.
> I try greping for the mount name (/scratch/cdf).  Nothing.
> It will not let me unmount the logical volume.
> 
> The system in question is running RedHat 9 w/kernel 2.4.20-24.9smp
> with RedHat's lvm-1.0.3-12.  I just so happened to have built 
> another system using RedHat's ES_3 w/kernel 2.4.21-4.0.1.ELsmp and
> their lvm-1.0.3-15, so I thought I'd try it there.  Built an identical
> logical volume, mounted it, tested it (works fine), tried to umount
> the filesystem with identical results: device is busy.  Checked
> again using lsof.  Nothing open on the mounted filesystem.
> 
> I went checking back thru about 4 months of this list and saw
> (apparently) that no one else has this problem.  At this point
> I'm a bit baffled why the umount command isn't working.  I've
> also seen nothing that might address this in the LVM-HOWTO.
> Then again, I could have missed it.
> 
> Ideas?

maybe some kernel service is holding a reference
to that device, nfs or samba server comes to mind, 
just try to disable them one after the other and
see if umount will work ...

HTH,
Herbert

> 
> Thanks!
> -- 
> P. Larry Nelson (217-244-9855) | Systems/Network Administrator
> 461 Loomis Lab                 | U of I, CITES Departmental Services
> 1110 W. Green St., Urbana, IL  | Consultant to: High Energy Physics Group
> MailTo:lnelson@uiuc.edu        | http://www.uiuc.edu/ph/www/lnelson
> -------------------------------------------------------------------------
>  "Information without accountability is just noise."  - P.L. Nelson
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

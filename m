Subject: Re: [linux-lvm] lvm/devfs bug?
From: Rich Turner <rich@storix.com>
In-Reply-To: <1049836943.7411.19.camel@rich>
References: <1049829705.2312.16.camel@rich> 
	<20030408204334.GD22951@percy.comedia.it>  <1049836943.7411.19.camel@rich>
Content-Transfer-Encoding: 7bit
Message-Id: <1049839040.2328.23.camel@rich>
Mime-Version: 1.0
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
Date: Tue Apr  8 16:57:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

its my understanding that pvcreate investigates /proc/partitions for
disk information to create the physical volume. if there are no
partitions defined on a disk in /proc/partitions then why does pvcreate
think there is a partition? am i missing something that pvcreate is
looking at to determine disk information?

On Tue, 2003-04-08 at 14:22, Rich Turner wrote:
> even though devfs is compiled in the kernel it actually is not mounted
> at this time. i have tried it using devfs long names also with no
> success.
> 
> On Tue, 2003-04-08 at 13:43, Luca Berra wrote:
> > On Tue, Apr 08, 2003 at 12:21:45PM -0700, Rich Turner wrote:
> > >i am able to confirm that /proc/partitions does not have a partition
> > >entry for the disk but pvcreate still fails. i am using a devfs kernel
> > >so i thought there might be some strange behavior between lvm and devfs.
> > >is there a fix or known issues regarding lvm and devfs?
> > >
> > if you have devfs you should use the devfs long mane to reference your pv
> > eg: /dev/scsi/host0/bus0/target0/lun0/disc
> > as to why the error message is misleading i would not say, lvm1 tools are
> > very buggy wrt the handling of device names.
> > 
> > L.
> > 
> > -- 
> > Luca Berra -- bluca@comedia.it
> >         Communication Media & Services S.r.l.
> >  /"\
> >  \ /     ASCII RIBBON CAMPAIGN
> >   X        AGAINST HTML MAIL
> >  / \
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> -- 
> Rich Turner
> Storix Software
> (619)702-6500 phone
> (619)702-6501 fax
> http://www.storix.com
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Rich Turner
Storix Software
(619)702-6500 phone
(619)702-6501 fax
http://www.storix.com

Return-Path: <james@fr.clara.net>
Date: Wed, 7 Feb 2001 18:12:10 +0100 (CET)
From: James <james@fr.clara.net>
Subject: Re: [linux-lvm] lvm with raid
In-Reply-To: <20010207110140.H22166@sistina.com>
Message-ID: <Pine.LNX.4.21.0102071811300.16192-100000@munster.noc.fr.clara.net>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am thanks I noted the wrong one in the mail earlier :-)

lvm_0.9.1_beta3.tar.gz

James

On Wed, 7 Feb 2001, AJ Lewis wrote:

> On Wed, Feb 07, 2001 at 05:31:30PM +0100, James wrote:
> > 
> > Seems to work a treat :-) (upgraded to 0.9.1 beta1)
> 
> Hmm...you should probably use Beta3
>  
> > On Wed, 7 Feb 2001, James wrote:
> > 
> > > 
> > > Apparantly I need the latest beta, I will give a go and let you know
> > > 
> > > On Wed, 7 Feb 2001, Jean-Eric Cuendet wrote:
> > > 
> > > > 
> > > > > I created /dev/md0 (raid autodetect)
> > > > > Did a pvcreate /dev/md0
> > > > > lvcreate'd partitions /usr /home /var
> > > > 
> > > > I think it's because of NO "LVM linux" partition ID.
> > > > Your md0 partition is "RAID Auto detect" and that's normal.
> > > > I'm not a guru of LVM, so I have no idea of what to do, but anyone out
> > > > there?
> > > > I'm interested too in this thing.
> > > > It works for me to have RAID partitions in LVM because I have a mix of hda1
> > > > + hda2 + md0 + md1, so vgscan and vgchange works because of the "Linux LVM"
> > > > IDs on hda1 and hda2
> > > > Thanks for the GURU response.
> > > > 
> > > > -jec
> > > > 
> > > > 
> > > > > 
> > > > > copied and remounted everything.
> > > > > This all goes surprisingly well, until I decided to test with 
> > > > > a reboot.
> > > > > 
> > > > > vgscan and vgchange don't find a thing !
> > > > > 
> > > > > test:/home/james# vgscan 
> > > > > vgscan -- reading all physical volumes (this may take a while...)
> > > > > vgscan -- no volume groups found
> > > > > 
> > > > > test:/home/james# vgchange -a y
> > > > > vgchange -- no volume groups found
> > > > > 
> > > > > but if I try to recreate a PV 
> > > > > 
> > > > > test:/home/james# pvcreate /dev/md0
> > > > > pvcreate -- ERROR: can't initialize physical volume 
> > > > > "/dev/md0" of volume
> > > > > group "devlvm" without -ff
> > > > >  
> > > > > Everything is still there apparantly.
> > > > > 
> > > > > I must be missing something fundamental. Thanks fot any help 
> > > > > in advance.
> > > > > 
> > > > > James
> > > > > 
> > > > > 
> > > > > _______________________________________________
> > > > > linux-lvm mailing list
> > > > > linux-lvm@sistina.com
> > > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > > 
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> -- 
> AJ Lewis
> Sistina Software Inc.                  Voice:  612-379-3951
> 1313 5th St SE, Suite 111              Fax:    612-379-3952
> Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
> http://www.sistina.com
> 
> Current GPG fingerprint = 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2648
> Get my key at: http://www.sistina.com/~lewis/gpgkey
>  (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)
> 
> -----Begin Obligatory Humorous Quote----------------------------------------
> Life's short and hard, kind of like a bodybuilding elf
> -----End Obligatory Humorous Quote------------------------------------------
> 

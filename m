Return-Path: <Jean-Eric.Cuendet@linkvest.com>
Message-ID: <B45465FD9C23D21193E90000F8D0F3DF683CB6@mailsrv.linkvest.com>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: RE: [linux-lvm] Lost filesystems on LVs
Date: Tue, 15 May 2001 15:07:49 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> > I have a BIG problem. I have an LVM VG of 160Gb. There is 3 
> LVs defined:
> > - MS
> > - Distrib
> > - backups
> 
> I assume that all LVs use the ext2 fs...

Yes, they all use ext2. (no reiser nor xfs, nor...)

> Can you deactivate everything (LVs and VG), delete the 
> /dev/<your_vg_nme> and
> do a vgscan? I think that LVM has got confused with the 
> special devices' major
> and minor numbers, and that would be why you see things where 
> they wouldn't be

I thought of that, but after a look at the numers, all seems OK. I can't
stop that now, I'll do it this evening.
I'll let you know further.

> expected to be. But I'm (almost) sure that not all of your 
> LVs are using the
> same fs, do they?

Yes, they all use ext2

Thanks
-jec

Message-ID: <3E673D81.7962C1AE@tid.es>
From: Miguel =?iso-8859-1?Q?Gonz=E1lez=20Casta=F1os?= <mgc@tid.es>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM and transferring filesystem
References: <BDEMIPDEGABMNEFIHCPDAEJBEJAA.bill+f.9sfuw6uo@tao-group.com>
Content-Transfer-Encoding: 7bit
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
Date: Thu Mar  6 06:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello,

 Many thanks for your promptly answer.

 It works perfectly. I didnt know very much about the rsync command, i thought that It was only used to synchronize

files between hosts.

 I also would like to know which is the best approach now, should i delete the original directories? any change in
the LVMed partitions will not be reflected in the original ROOTed directory but If I delete them, I wont be able
to boot without LVM (in the case I would need it and my LVMed partitions got corrupted).

Many thanks in advance

Miguel

William Blunn ha escrito:

> >  I am installing a redhat 7.3 linux box with X-Window.
> >
> >  I have installed LVM splitting the system with the following scheme:
> >
> >  /boot and / are installed each in different non-LVM partitions.
>
> Smart move.
>
> >  LVM volumes:
> >
> >  /usr , /var/ , /tmp
> >
> >  I have noticed that when I mount the filesystem using the LVM volumes
> > my X-Windows server doesnt work, but when I deactivate the LVM volumes
> > using the original configuration stored in the original / partition
> > (which still have the original /var, /tmp, /usr partitions) then
> > X-Window works perfectly.
> >
> >  Then I assume that I havent transferred the filesystem well.
> >
> >  I use from / the following command from the LVM howtos:
> >
> >  tar cplf - -C var .|tar xvlf - -C /mnt/var
> >
> >  and the same thing for the rest of partitions.
> >
> >  Any suggestion?
>
> Permissions on /tmp ?
>
> Should be 1777 (drwxrwxrwt).
>
> To copy filesystems, I use:
>
>   rsync -avxSHW --delete /var/ /mnt/var
>
> This has the added benefit that you can copy most data over whilst the system is up and running.
>
> Then you can take it down to single user, do the rsync again, and only the changed data will need to be copied.
>
> This minimises the time the system is in single user (which is good if you are working on a server).
>
> Bill
> --
> William H. Blunn - <bill+s.9sfuw6uo@tao-group.com> - Developer Support
> Tao
> 62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
> Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
>
> The contents of this e-mail and any attachments are confidential and may
> be legally privileged. If you have received this e-mail and you are not
> a named addressee, please inform us as soon as possible on
> +44 118 901 2999 and then delete the e-mail from your system. If you are
> not a named addressee you must not copy, use, disclose, distribute,
> print or rely on this e-mail. Any views expressed in this e-mail or any
> attachments may not necessarily reflect those of Tao's management.
> Although we routinely screen for viruses, addressees should scan this
> e-mail and any attachments for viruses. Tao makes no representation or
> warranty as to the absence of viruses in this e-mail or any attachments.
> Please note that for the protection of our business, we may monitor and
> read e-mails sent to and from our server(s).
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

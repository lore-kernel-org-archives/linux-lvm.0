Message-ID: <3905A81F.2C06D8D9@netconnect.com.au>
Date: Wed, 26 Apr 2000 00:13:52 +1000
From: bug1 <bug1@netconnect.com.au>
MIME-Version: 1.0
Subject: Re: [linux-lvm] mounting lv's from fstab
References: <200004250841.KAA09151@u9etz.ez-darmstadt.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

Ok, thanks, i have it worked out now, i think im going to really like
lvm

Thanks everyone.

Glenn

Heinz Mauelshagen wrote:
> 
> Please put a "vgscan ; vgchange -a y" in a system startup file
> like /sbin/init.d/boot on SuSE or an equivalent one on another distribution.
> 
> Please see the file INSTALL which comes with the LVM sources also.
> 
> Regards,
> Heinz
> 
> > I put all my logical volumes in /etc/fstab but it doesnt work
> > automatically.
> >
> > Everytime i restart my machine i have to manually activate my volume
> > group by typing vgchange -a y archive.
> >
> > Is there a way of automatically doing this with lvm or would i have to
> > write an init script ?
> >
> >
> > Thanks
> >
> > Glenn McGrath
> >
> 
> --
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Systemmanagement TS                              T-Nova
>                                                  Entwicklungszentrum Darmstadt
> Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
> Senior Systems Engineer                          Postfach 10 05 41
>                                                  64205 Darmstadt
> mge@EZ-Darmstadt.Telekom.de                      Germany
>                                                  +49 6151 886-425
>                                                           FAX-386
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

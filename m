From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200004250841.KAA09151@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] mounting lv's from fstab
In-Reply-To: <39053E22.D84F870F@netconnect.com.au> from bug1 at "Apr 25, 2000  4:41:38 pm"
Date: Tue, 25 Apr 2000 10:41:51 +0200 (MEST)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: bug1 <bug1@netconnect.com.au>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Please put a "vgscan ; vgchange -a y" in a system startup file
like /sbin/init.d/boot on SuSE or an equivalent one on another distribution.

Please see the file INSTALL which comes with the LVM sources also.

Regards,
Heinz

> I put all my logical volumes in /etc/fstab but it doesnt work
> automatically.
> 
> Everytime i restart my machine i have to manually activate my volume
> group by typing vgchange -a y archive.
> 
> Is there a way of automatically doing this with lvm or would i have to
> write an init script ?
> 
> 
> Thanks
> 
> Glenn McGrath
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement TS                              T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Message-Id: <199904151425.AA22497@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] Swap/DB devices
Date: Thu, 15 Apr 1999 16:24:10 METDST
In-Reply-To: <199904150815.AA02380@future-is.orange.co.uk>; from "Martyn.AYSHFORD@orange.co.uk" at Apr 15, 99 9:18 am
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martyn.AYSHFORD@orange.co.uk
Cc: linux-lvm@msede.com, mge@u9ete.ez-darmstadt.telekom.de

> 
> I'm in the process of re-jigging all the file systems to sit in volume
> groups.
> 
> Two questions :-
> 
> a) Can I setup swap to run from a volume group is it a good idea?

Yes.
It's as good as partition based swap (very low LVM driver overhead).

Please take i/o amounts into consideration and avoid to allocate swap LVs
and other i/o intensive LVs on the same PVs.

> 
> b) I have  database devices running in cooked file systems for Oracle,
> Sybase and Informix.
> 
> Vendor recommendations for sybase and Informix are normally raw, here we
> carve our database devices from HP volume groups is this a good idea for
> linux?

There is a raw device patch available by Stephen Tweedie.
IIRC it will make it into the 2.3 kernel (what do you say Stephen?).

LVM has to be enhanced a little bit to support that patch.

> 
> Anybody done this?
> 

Yes, i did successfull tests with a lot of swap LVs.
Anybody out there with (big) database installations on LVM?

BTW: you can have performance boosts by setting up striped LVs
     if your hardware setup is o.k. (enough i/o bandwith on scsi busses,
     several busses ...)
     


Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement C/S                             Deutsche Telekom AG
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

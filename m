From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003092135.WAA10104@u9etz.ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] 12 disks -- new problems ....
In-Reply-To: <Pine.LNX.4.10.10003092237070.23268-100000@tie.egs.uct.ac.za> from Bruce Hewitson at "Mar 9, 2000 10:39:33 pm"
Date: Thu, 9 Mar 2000 22:35:05 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Bruce Hewitson <hewitson@egs.uct.ac.za>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com


Please have a look at tools/lib/lvm_check_dev.c and add the additional major
numbers there around line 68.

Heinz

> 
> Answering my own message -- seems that there must be something in LVM that
> only looks at ide0 - ide5 -- I found the latest version of hdparm which
> goes up to ide9.
> 
> So -- does anybody know how to patch lvm to look at least as far as ide7?
> 
> thanks
> 
> 
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  | Assoc. Prof. Bruce C. Hewitson                  Ph: +27 21 650 2878 |
>  | Dept. Environmental & Geographical Sc.         Fax: +27 21 650 3791 |
>  | University of Cape Town, Private Bag, Rondebosch, South Africa 7701 |
>  |      hewitson@egs.uct.ac.za       http://www.egs.uct.ac.za/csag     |
>  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 
> 
> 
> 


-- 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@EZ-Darmstadt.Telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Message-Id: <199908020957.AA21641@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: Re: [linux-lvm] bug in liblvm 0.7 [added on 11/15/1998]
Date: Mon, 02 Aug 1999 11:57:11 METDST
In-Reply-To: <19990731135859.C30729@cyberhqz.com>; from "Ryan Murray" at Jul 31, 99 1:58 pm
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: rmurray@cyberhqz.com
Cc: mge@ts1.ez-darmstadt.telekom.de, linux-lvm@msede.com


Hello Ryan,

the simple idea behind this was to avoid not neccessary accesses in case of
a regular /dev layout (no trouble in case of devfs anyway).

If we put to much effort into holding up this concept i'ld rather say
"let's throw it away and open all existing device special nodes in turn".

Any opinions?

> 
> The following bit of code tries to "skip" partitions if the main drive
> doesn't exist:
> 
> pv_read_all_pv.c:102
> 
>       for ( n = 0; n < cache_size; n++) {
>          dev_name = dir_cache[n].dev_name;
> #ifdef DEBUG
>          debug ( "pv_read_all_pv -- calling pv_read with \"%s\"\n",
>                   dev_name);
> 
>          if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
>             if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
>                  MINOR ( dir_cache[n].st_rdev) % 16 == 0) {
>                n += 15;
>                continue;
>             }
>          } else close ( tst);
> 
> this will work for SCSI disks (assuming all partition devices exist),
> but fails for IDE disks.  IDE disks can have up to 63 partitions, and a
> quick survey shows debian potato creating devices for the first 20, and
> slackware 4.0 creating devices for the first 16.
> 
<SNIP>

Regards,
Heinz

--

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Systemmanagement CS-TS                           T-Nova
                                                 Entwicklungszentrum Darmstadt
Heinz Mauelshagen                                Otto-Roehm-Strasse 71c
Senior Systems Engineer                          Postfach 10 05 41
                                                 64205 Darmstadt
mge@ez-darmstadt.telekom.de                      Germany
                                                 +49 6151 886-425
                                                          FAX-386
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Message-Id: <200003051707.SAA31929@u9etz.ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: LVM bug report and questions
In-Reply-To: <m12Rayn-0006h9C@grumbeer.inka.de> from Hans-Joachim Baader at "Mar 5, 2000  2:21:53 pm"
Date: Sun, 5 Mar 2000 18:07:22 +0100 (MET)
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Hans-Joachim Baader <hans@grumbeer.inka.de>
Cc: mge@ez-darmstadt.telekom.de, linux-lvm@msede.com

> Hi,
> 
> I have kernel 2.2.15pre13, LVM 0.7 (first question: will 0.8 be ported
> to kernel 2.2.15?

Yes.

) on a dual Pentium-200 MMX with two 20G IBM disks
> (/dev/hdb and /dev/hdc at the moment).
> vgscan was unable to find the volume groups I defined. In the debug
> output I could see that after scanning hda16, the scan continued
> with hdb11 rather than hdb1. I found the relevant code which looked
> suspicous to me. So I changed it:
> 
> --- pv_read_all_pv.c.orig       Sun Mar  5 14:07:34 2000
> +++ pv_read_all_pv.c    Sun Mar  5 14:07:40 2000
> @@ -102,7 +102,7 @@
>     if ( ( tst = open ( dev_name, O_RDONLY)) == -1) {
>         if ( MAJOR ( dir_cache[n].st_rdev) != MD_MAJOR &&
>             MINOR ( dir_cache[n].st_rdev) % 16 == 0) {
> -               n += 15;
> +               /*n += 15;*/
>             continue;
>         }
>     } else close ( tst);
> 
> It's probably still wrong but at least it worked for me ;-)

In some /dev configurations there's overlapping of device nodes which
breaks the above performance oriented search algorithm.

Your workaround helps in these cases as correct setup of all /dev
nodes does.

> 
> It is possible to make a LV the root partition if initrd is used.
> However, is this also possible when the root is on a striped LV?

Yes.

> I guess not because LILO would have to know how to handle it.

LILO loads an initrd from a small partition (about 20MB in size)
and at the EOF of /linuxrc after activation of the Volume Group(s)
it switches to the real root-filesystem which can live on a
striped logical volume,

> Are there plans to make this possible?

See above.

> 
> What is the performance of striped LVs compared to a md device with
> RAID0?

More or less the same.

> On my system, using Reiserfs, I get about 9 MB/s on each
> individual disk, measured with hdparm. On a striped LV I get
> about 11 MB/s, measured with Bonnie.

Do you have all Physical Volumes you use to allocate Extemts to the striped
Logical Volume on different physical disks and IDE adapters?

> Given that hdparm and Bonnie
> usually agree about the speed, this seems not much of an
> improvement. How much is the CPU overhead for striped LVs?

Minimal.

> Is there more to gain in different configurations, eg. if I
> hooked the disks to a UDMA controller?
> 
> Thanks,
> hjb
> -- 
> http://www.pro-linux.de/ - Germany's largest volunteer Linux support site
> You feel strangely lucky...
> 

Heinz
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

Message-Id: <199909140948.AA20150@mailgate1b.telekom.de>
From: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Subject: [linux-lvm] Re: lvmcreate_initrd error? vgscan from initrd error?
Date: Tue, 14 Sep 1999 11:46:43 METDST
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com


Hi Harald,

sorry, i wasn't able to read the attachement.

But anyway, could you check, if all necessary device specials
(/dev/sda10 etc.) exist in the initrd.gz?

Cheers,
Heinz

> 
> --UlVJffcvxoiEqYs2
> Content-Type: text/plain; charset=us-ascii
> 
> Hi,
> 
> I'm trying to use LVM 0.7 with the SuSE 6.2 kernel (2.2.10-SuSE). Works
> fine so far but not if I try to use the initrd creation script. Machine
> boots fine, linuxrd starts but vgscan does not find any volume groups. I
> tried "vgscan -v" but this just shows it doesn't find any VGs :-/. Hence
> "vgchange -ay" fails. 
> 
> It _does_ work, however, in /etc/rc.d/boot (just before the MD stuff is
> initialized), except that it can't create /etc/lvmtab* (root is mounted
> RO at this time). This is kinda catch-22 situation...
> 
> What gives? What kind of information do you need to see what's (not) going
> on? I ran "vgscan -d" from initrd and after the initial boot sequence
> and appended the outputs - maybe you can see the relevant parts - I
> can't. It seems vgscan does not find /dev/sda10 somehow (while it does
> find /dev/hda7).
> 
> Here's some info at least 
> 
> seneca:/usr/src/LVM/0.7 # cat /proc/lvm 
> LVM module version 0.7  (12/07/1999)
> 
> Total:  1 VG  2 PVs  2 LVs (2 LVs open 2 times)
> 
> Global: 12832 bytes vmalloced   IOP version: 4   0:14:12 active
> 
> VG:  vg1  [2 PV, 2 LV/2 open]  PE Size: 4096 KB
>   Usage [KB/PE]: 6737920 /1645 total  2146304 /524 used  4591616 /1121 free
>   PVs: [AA] /dev/hda7              2584576 /631      2146304 /524 438272 /107   
>        [AA] /dev/sda10             4153344 /1014           0 /0 4153344 /1014  
>     LVs: [AWDL  ] publv                      2048000 /500      1x open
>          [AWDL  ] testlv                       98304 /24       1x open
> 
> 

<SNIP>
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
